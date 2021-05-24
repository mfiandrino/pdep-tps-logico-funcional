-- TP Funcional _ Fuente de los Deseos _ Martes noche 2021 _ K2054

--Ejercicio 1
data Persona = Persona {edad :: Int, suenios :: [String], nombre :: String, felicidonios :: Int, habilidades :: [String]} deriving Show
--data Persona1 = Persona1 {edad1 :: Int, suenios1 :: [(Algo -> Persona -> Persona)], nombre1 :: String, felicidonios1 :: Int, habilidades1 :: [String]} deriving Show

--En sueños "Algo" puede ser:
--Carrera (String)
--Lista de Ciudades (Lista de String)
--Una persona (Persona)



--Recursos para ejemplos
juan = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "juan cruz", felicidonios = 50, habilidades = ["nada", "mas nada"]}
pedro = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "san pedro", felicidonios = 105, habilidades = ["nada", "mas nada"] }
judas = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "judas", felicidonios = 50, habilidades = ["nada", "mas nada"] }
persona1 = Persona 25 ["Recibirse de ingeniero", "Ser programador"] "Maximiliano" 100 ["Pintura","Java"]
persona2 = Persona 46 ["Comprar una bicicleta"] "Camila" 250 ["Decir palindromos"]
persona3 = Persona 12 ["Recibirse de Arquitecto","Conocer una nueva persona"] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]
--persona4 = Persona 12 [recibirseDeUnaCarrera "Ingenieria",unaPersonaSeEnamoraDeOtra persona1] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]

cantidadSuenios :: Persona -> Int
cantidadSuenios = length.suenios

--Punto A (Integrante 1: Maximiliano Fiandrino)
type CoeficienteSatisfaccion = Int
calcularCoefSatisfaccion :: Persona -> CoeficienteSatisfaccion
calcularCoefSatisfaccion persona    | felicidonios persona > 100 = (felicidonios persona) * (edad persona)
                                    | felicidonios persona > 50 = cantidadSuenios persona * (felicidonios persona)
                                    | otherwise = div (felicidonios persona) 2

--Punto B (Integrante 2: Rodrigo Mollon)
gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion unaPersona | felicidonios unaPersona > 100 = (length.suenios $ unaPersona) * (felicidonios unaPersona)
                           | felicidonios unaPersona > 50 = (length.suenios $ unaPersona) * (edad unaPersona)
                           | otherwise = (2*).length.suenios $ unaPersona

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
sumarFelicidonios :: Persona -> Int -> Persona
sumarFelicidonios alguien cantidad = alguien {felicidonios = felicidonios alguien + cantidad}

--Punto A (Integrante 1: Maximiliano Fiandrino)


data Algo = Carrera {carrera :: String} | ListaCiudades {lista :: [String]} | Personas {persona :: Persona}


agregarFelicidonios :: Algo -> Persona -> Int
agregarFelicidonios (Carrera carrera) persona = (felicidonios persona) + ((*1000).length) carrera
agregarFelicidonios (ListaCiudades lista) persona =  (felicidonios persona) + ((100*).length $ lista)
agregarFelicidonios (Personas personaDeQuienSeEnamoro) personaEnamorada = felicidonios personaEnamorada + felicidonios personaDeQuienSeEnamoro

type Carrera = String
agregarFelicidoniosPorCarrera :: Carrera -> Persona -> Persona
agregarFelicidoniosPorCarrera carrera persona = persona {felicidonios = ((+(felicidonios persona)).(*1000).length) carrera}

type Habilidad = String
agregarHabilidad :: Habilidad -> Persona -> Persona 
agregarHabilidad habilidad persona = persona {habilidades = (habilidades persona) ++ [habilidad]}

recibirseDeUnaCarrera :: Carrera -> Persona -> Persona
--recibirseDeUnaCarrera carrera persona = persona {felicidonios = felicidonios (agregarFelicidoniosPorCarrera carrera persona), habilidades = habilidades (agregarHabilidad carrera persona)}
recibirseDeUnaCarrera carrera persona = persona {felicidonios = agregarFelicidonios (Carrera carrera) persona , habilidades = habilidades (agregarHabilidad carrera persona)}



--Punto B (Integrante 2: Rodrigo Mollon)
cumplirSuenioViajar :: [String] -> Persona -> Persona
cumplirSuenioViajar lista laPersona = laPersona {edad = edad laPersona + 1, felicidonios = agregarFelicidonios (ListaCiudades lista) laPersona}


--Punto C (Integrante 3: Daniel Kesel)
unaPersonaSeEnamoraDeOtra :: Persona -> Persona -> Persona
unaPersonaSeEnamoraDeOtra enamorado deQuienSeEnamoro = enamorado {felicidonios = agregarFelicidonios (Personas deQuienSeEnamoro) enamorado}



--Punto general
queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual = id

comboPerfecto :: Persona -> Persona
comboPerfecto estaPersona = Persona (edad (cumplirSuenioViajar ["Berazategui", "Paris"] estaPersona)) (suenios estaPersona) (nombre estaPersona) ((+100).felicidonios $ (recibirseDeUnaCarrera "Medicina" (cumplirSuenioViajar ["Berazategui", "Paris"] estaPersona))) (habilidades (recibirseDeUnaCarrera "Medicina" estaPersona))
