-- TP Funcional _ Fuente de los Deseos _ Martes noche 2021 _ K2054
import Text.Show.Functions()



--Ejercicio 1
type Suenio = (Persona -> Persona)
data Persona = Persona {edad :: Int, suenios :: [Suenio], nombre :: String, felicidonios :: Int, habilidades :: [Habilidad]} deriving Show

--Recursos para ejemplos
persona1 = Persona 25 [recibirseDeUnaCarrera "Arquitectura", cumplirSuenioViajar ["Roma","Oporto"]] "Maximiliano" 100 ["Pintura","Java"]
persona2 = Persona 46 [recibirseDeUnaCarrera "Comunicacion Social", unaPersonaSeEnamoraDeOtra persona1] "Camila" 250 ["Decir palindromos"]
persona3 = Persona 12 [recibirseDeUnaCarrera "Chef", cumplirSuenioViajar ["Shangai"]] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]
persona4 = Persona 12 [unaPersonaSeEnamoraDeOtra persona3,recibirseDeUnaCarrera "Ingenieria"] "Nicolas" 55 ["Construir maquetas","Photoshop"]
persona5 = Persona 12 [unaPersonaSeEnamoraDeOtra persona4,recibirseDeUnaCarrera "Ingenieria", cumplirSuenioViajar ["Barcelona", "Lima", "Caracas"]] "Nicolas" 46 ["Construir maquetas","Photoshop"]
persona6 = Persona 12 [unaPersonaSeEnamoraDeOtra persona4, queTodoSigaIgual, cumplirSuenioViajar ["Barcelona", "Lima", "Caracas"]] "Nicolas" 46 ["Construir maquetas","Photoshop"]


cantidadSuenios :: Persona -> Int
cantidadSuenios = length.suenios

--Punto A (Integrante 1: Maximiliano Fiandrino)
type CoeficienteSatisfaccion = Int
calcularCoefSatisfaccion :: Persona -> CoeficienteSatisfaccion
calcularCoefSatisfaccion persona    | felicidonios persona > 100 = (felicidonios persona) * (edad persona)
                                    | felicidonios persona > 50 = (cantidadSuenios persona) * (felicidonios persona)
                                    | otherwise = div (felicidonios persona) 2

--Punto B (Integrante 2: Rodrigo Mollon)
gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion unaPersona | felicidonios unaPersona > 100 = (cantidadSuenios unaPersona) * (felicidonios unaPersona)
                           | felicidonios unaPersona > 50 = (cantidadSuenios unaPersona) * (edad unaPersona)
                           | otherwise = (2*).cantidadSuenios $ unaPersona

--Punto C (Integrante 3: Daniel Kesel) 
    --Ejecución de pruebas : Mirar archivo de texto "Testing TP1 - Puntos 1C 2C 3C- Integrante 3.txt"




--Ejercicio 2

--Punto A (Integrante 1: Maximiliano Fiandrino)
esNombreLargo :: Persona -> Bool
esNombreLargo = (>10).length.nombre

--Punto B (Integrante 2: Rodrigo Mollon)
personaSuertuda :: Persona -> Bool
personaSuertuda otraPersona = even.(3*).calcularCoefSatisfaccion $ otraPersona

--Punto C (Integrante 3: Daniel Kesel)
esNombreLindo :: Persona -> Bool
esNombreLindo = (== 'a').last.nombre




--Ejercicio 3
agregarFelicidonios :: Int -> Persona -> Persona
agregarFelicidonios cuenta persona = persona {felicidonios = (+cuenta).felicidonios $ persona}

--Punto A (Integrante 1: Maximiliano Fiandrino)
type Habilidad = String
agregarHabilidad :: Habilidad -> Persona -> Persona 
agregarHabilidad habilidad persona = persona {habilidades = (habilidades persona) ++ [habilidad]}

type Carrera = String
recibirseDeUnaCarrera :: Carrera -> Suenio
recibirseDeUnaCarrera carrera persona = (agregarHabilidad carrera).agregarFelicidonios (((*1000).length) carrera) $ persona

--Punto B (Integrante 2: Rodrigo Mollon)
cumplirAnio :: Persona -> Persona
cumplirAnio persona = persona {edad = (edad persona) + 1}

cumplirSuenioViajar :: [String] -> Suenio
cumplirSuenioViajar lista laPersona = cumplirAnio.(agregarFelicidonios ((100*).length $ lista)) $ laPersona

--Punto C (Integrante 3: Daniel Kesel)
unaPersonaSeEnamoraDeOtra :: Persona -> Suenio
unaPersonaSeEnamoraDeOtra deQuienSeEnamoro enamorado = agregarFelicidonios (felicidonios deQuienSeEnamoro) enamorado




--Punto general
queTodoSigaIgual :: Suenio
queTodoSigaIgual = id

comboPerfecto :: Suenio
comboPerfecto persona = (agregarFelicidonios 100).(cumplirSuenioViajar ["Berazategui","Paris"]).(recibirseDeUnaCarrera "Medicina") $ persona




---------- 2da Parte -----------

type Fuente = (Persona -> Persona)

--Ejercicio 4
quitarSuenios :: [Suenio] -> Persona -> Persona
quitarSuenios sueniosQueQuedan persona = persona {suenios = sueniosQueQuedan}


--Punto A (Integrante 1: Maximiliano Fiandrino)
fuenteMinimalista :: Fuente
fuenteMinimalista persona = quitarSuenios (tail.suenios $ persona) ((head.suenios $ persona) persona)

--Punto B (Integrante 2: Rodrigo Mollon)
fuenteCopada :: Fuente
fuenteCopada persona = (quitarSuenios []).foldl (flip ($)) persona $ (suenios persona)

--Punto C (Integrante 3: Daniel Kesel)
fuenteAPedido :: Int -> Fuente
fuenteAPedido nSuenio persona  = ((suenios persona) !! nSuenio) persona



--Punto D (General)
fuenteSorda :: Persona -> Persona
fuenteSorda = queTodoSigaIgual
--fuenteSorda = id




--Ejercicio 5
type Fuentes = [Fuente]
listaFuentes = [fuenteSorda , fuenteMinimalista, (fuenteAPedido 1)]

fuenteGanadoraPor :: (Persona -> Int) -> Persona -> Fuentes -> Fuente
fuenteGanadoraPor criterio persona (fuente:restoDeFuentes) = foldl (fuenteGanadora criterio persona) fuente restoDeFuentes

fuenteGanadora :: (Persona -> Int) -> Persona -> Fuente -> Fuente -> Fuente
fuenteGanadora criterio persona unaFuente otraFuente    | (criterio.unaFuente $ persona) > (criterio.otraFuente $ persona) = unaFuente
                                                        | otherwise = otraFuente


--Punto A (Integrante 1: Maximiliano Fiandrino)
masFelicidonios :: Persona -> Int 
masFelicidonios = felicidonios

-- *Main> fuenteGanadoraPor masFelicidonios persona1 listaFuentes 
-- <function>


--Punto B (Integrante 2: Rodrigo Mollon)
menosFelicidonios :: Persona -> Int
menosFelicidonios = (*(-1)).felicidonios

-- *Main> fuenteGanadoraPor menosFelicidonios persona1 listaFuentes 
-- <function>

--Punto C (Integrante 3: Daniel Kesel)
masHabilidades :: Persona -> Int
masHabilidades = length.habilidades

-- *Main> fuenteGanadoraPor masHabilidades persona1 listaFuentes 
-- <function>




--Ejercicio 6

--Punto A (Integrante 1: Maximiliano Fiandrino)
sueniosValiosos :: Persona -> [Suenio]
sueniosValiosos persona = filter (\unSuenio -> (>100).felicidonios $ (unSuenio persona)) (suenios persona)

--Punto B (Integrante 2: Rodrigo Mollon)
tieneAlgunSuenioRaro :: Persona -> Bool
tieneAlgunSuenioRaro persona = any (== (felicidonios persona)) (map (felicidonios.flip ($) persona) (suenios persona))

--Punto C (Integrante 3: Daniel Kesel)
type Personas = [Persona]
listaPersonas = [persona1, persona2, persona6]

felicidadTotalGrupo :: Personas -> Int
felicidadTotalGrupo personas =  foldl1 (+) (map (felicidonios.fuenteCopada) personas)



--Ejercicio 7
personaSueniosInfinitos = Persona 12 (cycle [cumplirSuenioViajar ["Barcelona", "Lima", "Caracas"],unaPersonaSeEnamoraDeOtra persona4, queTodoSigaIgual]) "Nicolas" 46 ["Construir maquetas","Photoshop"]


--Punto A (Integrante 1: Maximiliano Fiandrino)
{-
Si le aplico la fuenteMinimalista (que solo cumple el primer sueño de la persona) a la personaSueniosInfinito (que tiene infinitos sueños)
con el comando "fuenteMinimalista personaSueniosInfinitos" en la consola, la fuente satisface a la persona, ya que al solo cumplir el primer sueño
lo puede aplicar aunque la persona tenga infinitos sueños.
El único problema es a la hora de mostrar a la persona ya que queda en un loop infinito de suenios (representadas por <function>) y nunca deja ver
los campos siguientes del tipo de dato Persona.
Pero al posicionar convenientemente un sueño que modifique la edad como lo es "cumplirSuenioViajar ["Barcelona", "Lima", "Caracas"]", podemos ver
que la fuente modifica a la persona, por lo tanto concluyo que la fuente satisface a la persona aunque luego no se pueda ver completamente. 
En la consola se ve: 
*Main> fuenteMinimalista personaSueniosInfinitos 
Persona {edad = 13, suenios = [<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,
<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,<function>,...(y asi sucesivamente)
-}

--Punto B (Integrante 2: Rodrigo Mollon)
{- A la persona "personaSueniosInfinitos" con infinitos sueños, generados con la funcion <cycle>, si 
le aplico la accion de la fuente "fuenteCopada" desde la consola se genera un loop infinito, esto sucede
porque la fuente busca cumplir todos los suenios de la persona, y como no busca un sueño especifico no
se pueden aplicar los conceptos de "lazy evaluation" como si se podria con una fuente hipotetica que cumpla
un sueño "x" y le quite todos los sueños restantes a la persona.
De hecho con solo querer imprimir por pantalla el detalle de "personaSueniosInfinitos" se obtiene una
sucesion infinita de <function> que son los elementos de lista de suenios.
-}

--Punto C (Integrante 3: Daniel Kesel)
{- Si le aplico a la persona "personaSueniosInfinitos" con infinitos sueños, generados con la funcion <cycle>, la funcion fuenteAPedido
satisface a la persona ya que puedo cumplir el enésimo sueño que se quiera, lamentablemente no se podrá cumplir el último sueño ya que 
no se definir con n valro entero el enésimo sueño final si los sueños son infinitos. Por lo tanto, al querer imprimir por pantalla 
el detalle de "personaSueniosInfinitos" se obtiene un loop infinito de <function> que son los elementos de lista de suenios.
-}