-- TP Funcional _ Fuente de los Deseos _ Martes noche 2021 _ K2054

--Ejercicio 1
data Persona = Persona {edad :: Int, suenios :: [String], nombre :: String, felicidonios :: Int, habilidades :: [String]} deriving Show
--data Persona1 = Persona1 {edad1 :: Int, suenios1 :: [a -> Persona -> Persona], nombre1 :: String, felicidonios1 :: Int, habilidades1 :: [String]} deriving Show

--Recursos para ejemplos
juan = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "juan cruz", felicidonios = 50, habilidades = ["nada", "mas nada"]}
pedro = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "san pedro", felicidonios = 105, habilidades = ["nada", "mas nada"] }
judas = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "judas", felicidonios = 50, habilidades = ["nada", "mas nada"] }
persona1 = Persona 25 ["Recibirse de ingeniero", "Ser programador"] "Maximiliano" 100 ["Pintura","Java"]
persona2 = Persona 46 ["Comprar una bicicleta"] "Camila" 250 ["Decir palindromos"]
persona3 = Persona 12 ["Recibirse de Arquitecto","Conocer una nueva persona"] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]
--persona4 = Persona 12 [recibirseDeUnaCarrera,unaPersonaSeEnamoraDeOtra] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]

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
                           | felicidonios unaPersona > 50 && felicidonios unaPersona <= 100 = (length.suenios $ unaPersona) * (edad unaPersona)
                           | otherwise = (2*).length.suenios $ unaPersona

--Punto C (Integrante 3: Daniel Kesel) 
    --Ejecución de pruebas : Mirar archivo de texto "Testing TP1 - Puntos 1C 2C 3C- Integrante 3.txt"



--Ejercicio 2

--Punto A (Integrante 1: Maximiliano Fiandrino)
esNombreLargo :: Persona -> Bool
esNombreLargo = (>10).length.nombre

--Punto B (Integrante 2: Rodrigo Mollon)
personaSuertuda :: Persona -> Bool
personaSuertuda otraPersona = (((3*).calcularCoefSatisfaccion $ otraPersona) `mod` 2) == 0

--Punto C (Integrante 3: Daniel Kesel)
esNombreLindo :: Persona -> Bool
esNombreLindo = ((== 'a').last.nombre)



--Ejercicio 3

--Punto A (Integrante 1: Maximiliano Fiandrino)
--agregarHabilidad :: String -> Persona -> Persona
type Carrera = String
agregarFelicidoniosPorCarrera :: Carrera -> Persona -> Persona
agregarFelicidoniosPorCarrera carrera persona = persona {felicidonios = ((+(felicidonios persona)).(*1000).length) carrera}

type Habilidad = String
agregarHabilidad :: Habilidad -> Persona -> Persona 
agregarHabilidad habilidad persona = persona {habilidades = (habilidades persona) ++ [habilidad]}

recibirseDeUnaCarrera :: Persona -> Carrera -> Persona
recibirseDeUnaCarrera persona carrera = Persona (edad persona) (suenios persona) (nombre persona) (((+(felicidonios persona)).(*1000).length) carrera) ((habilidades persona) ++ [carrera])

recibirseDeUnaCarrera2 :: Carrera -> Persona -> Persona
recibirseDeUnaCarrera2 carrera persona = persona {felicidonios = felicidonios (agregarFelicidoniosPorCarrera carrera persona), habilidades = habilidades (agregarHabilidad carrera persona)}

--Punto B (Integrante 2: Rodrigo Mollon)
cumplirSuenio :: String -> [String] -> Persona -> Persona
cumplirSuenio "viajar" listaCiudades laPersona = Persona {edad = (1+).edad $ laPersona,suenios = suenios laPersona, nombre = nombre laPersona, felicidonios = ((100*).length $ listaCiudades) + (felicidonios laPersona), habilidades = habilidades laPersona }

--Punto C (Integrante 3: Daniel Kesel)
unaPersonaSeEnamoraDeOtra :: Persona -> Persona -> Persona 
unaPersonaSeEnamoraDeOtra enamorado deQuienSeEnamoro = Persona (edad enamorado) (suenios enamorado) (nombre enamorado) ((felicidonios enamorado) + (felicidonios deQuienSeEnamoro)) (habilidades enamorado)



--Punto general
queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual = id

comboPerfecto :: Persona -> Persona
comboPerfecto estaPersona = Persona (edad (cumplirSuenio "viajar" ["Berazategui", "Paris"] estaPersona)) (suenios estaPersona) (nombre estaPersona) ((+100).felicidonios $ (recibirseDeUnaCarrera (cumplirSuenio "viajar" ["Berazategui", "Paris"] estaPersona) "Medicina")) (habilidades (recibirseDeUnaCarrera estaPersona "Medicina"))