-- TP Funcional _ Fuente de los Deseos _ Martes noche 2021 _ K2054
--Ejercicio 1, punto B

data Persona = Persona {edad :: Int, suenios :: [String], nombre :: String, felicidonios :: Int, habilidades :: [String]} deriving Show

--juan es un recurso para ejemplos
juan = Persona {edad = 26, suenios = ["hacer algo nuevo"], nombre = "juan cruz", felicidonios = 50, habilidades = ["nada", "mas nada"] }

gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion unaPersona | felicidonios unaPersona > 100 = (length.suenios $ unaPersona) * (felicidonios unaPersona)
                           | felicidonios unaPersona > 50 && felicidonios unaPersona <= 100 = (length.suenios $ unaPersona) * (edad unaPersona)
                           | otherwise = (2*).length.suenios $ unaPersona

coeficienteDeSatisfaccion :: Persona -> Int --TEMPORAL only for testing
coeficienteDeSatisfaccion unaPersona | felicidonios unaPersona > 100 = 30
                           | felicidonios unaPersona > 50 && felicidonios unaPersona <= 100 = 1
                           | otherwise = 20

--Ejercicio 2, punto B
--asumimos que existe una funcion coeficienteDeSatisfaccion creada por Integrante 1 en el punto 1.A

personaSuertuda :: Persona -> Bool
personaSuertuda otraPersona = (((3*).coeficienteDeSatisfaccion $ otraPersona) `mod` 2) == 0

--Ejercicio 3, punto B

cumplirSueño :: String -> [String] -> Persona -> Persona
cumplirSueño "viajar" listaCiudades laPersona = Persona {edad = (1+).edad $ laPersona,suenios = suenios laPersona, nombre = nombre laPersona, felicidonios = ((100*).length $ listaCiudades) + (felicidonios laPersona), habilidades = habilidades laPersona }