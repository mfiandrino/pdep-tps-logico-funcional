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

data Fuente = Fuente {titulo :: String, accion :: Persona -> Persona} deriving Show

--Ejercicio 4
quitarSuenios :: [Suenio] -> Persona -> Persona
quitarSuenios sueniosQueQuedan persona = persona {suenios = sueniosQueQuedan}


--Punto A (Integrante 1: Maximiliano Fiandrino)
fuenteMinimalista :: Persona -> Persona
fuenteMinimalista persona = quitarSuenios (tail.suenios $ persona) ((head.suenios $ persona) persona)

--Punto B (Integrante 2: Rodrigo Mollon)
fuenteCopada = Fuente "Fuente Copada" accionFCopada
accionFCopada :: Persona -> Persona
accionFCopada persona = quitarSuenios [] (foldl (flip ($)) persona (suenios persona))

--Punto C (Integrante 3: Daniel Kesel)
cumplirSuenio :: Persona -> Int -> Suenio
cumplirSuenio persona nSuenio = (suenios persona) !! nSuenio

fuenteAPedido :: Int -> Persona -> Persona
fuenteAPedido nSuenio persona = (cumplirSuenio persona nSuenio) persona

--Punto D (General)
fuenteSorda :: Persona -> Persona
fuenteSorda = queTodoSigaIgual
--fuenteSorda = id



--Ejercicio 5
type Fuentes = [Fuente]
listaFuentes = [Fuente "Fuente Sorda" fuenteSorda , Fuente "Fuente Minimalista" fuenteMinimalista, Fuente "Fuente A Pedido" (fuenteAPedido 1)]

fuenteGanadora :: (Persona -> Int) -> (Int -> Int -> Bool) -> Persona -> Fuentes -> Fuente
fuenteGanadora _ _ _ [ultimoElemento] = ultimoElemento
fuenteGanadora criterio signo persona (fuente1:fuente2:restoDeFuentes)  | signo (criterio.(accion fuente1) $ persona) (criterio.(accion fuente2) $ persona) = fuenteGanadora criterio signo persona (fuente1:restoDeFuentes)
                                                                        | otherwise = fuenteGanadora criterio signo persona (fuente2:restoDeFuentes) 

--Punto A (Integrante 1: Maximiliano Fiandrino)

--Punto B (Integrante 2: Rodrigo Mollon)
fuenteMinimosFelicidonios :: Fuentes -> Persona -> Fuente
fuenteMinimosFelicidonios fuentes persona = fuenteGanadora felicidonios (<) persona fuentes

--Punto C (Integrante 3: Daniel Kesel)



--Ejercicio 6

--Punto A (Integrante 1: Maximiliano Fiandrino)


--Punto B (Integrante 2: Rodrigo Mollon)


--Punto C (Integrante 3: Daniel Kesel)