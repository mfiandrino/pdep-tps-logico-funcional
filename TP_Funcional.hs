-- TP Funcional _ Fuente de los Deseos _ Martes noche 2021 _ K2054
import Text.Show.Functions()



--Ejercicio 1
data Persona = Persona {edad :: Int, suenios :: [(Persona -> Persona)], nombre :: String, felicidonios :: Int, habilidades :: [String]} deriving Show

--Recursos para ejemplos
persona1 = Persona 25 [recibirseDeUnaCarrera "Arquitectura", cumplirSuenioViajar ["Roma","Oporto"]] "Maximiliano" 100 ["Pintura","Java"]
persona2 = Persona 46 [recibirseDeUnaCarrera "Comunicacion Social", unaPersonaSeEnamoraDeOtra persona1] "Camila" 250 ["Decir palindromos"]
persona3 = Persona 12 [recibirseDeUnaCarrera "Chef", cumplirSuenioViajar ["Shangai"]] "Juan Ignacio" 55 ["Construir maquetas","Photoshop"]
persona4 = Persona 12 [unaPersonaSeEnamoraDeOtra persona3,recibirseDeUnaCarrera "Ingenieria"] "Nicolas" 55 ["Construir maquetas","Photoshop"]

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
agregarFelicidonios :: (Persona -> Int) -> Persona -> Int
agregarFelicidonios funcionFelicidonios persona = funcionFelicidonios persona

--Punto A (Integrante 1: Maximiliano Fiandrino)
type Carrera = String
agregarFelicidoniosPorCarrera :: Carrera -> Persona -> Int
agregarFelicidoniosPorCarrera carrera persona =((+(felicidonios persona)).(*1000).length) carrera

type Habilidad = String
agregarHabilidad :: Habilidad -> Persona -> Persona 
agregarHabilidad habilidad persona = persona {habilidades = (habilidades persona) ++ [habilidad]}

recibirseDeUnaCarrera :: Carrera -> Persona -> Persona
recibirseDeUnaCarrera carrera persona = persona {felicidonios = agregarFelicidonios (agregarFelicidoniosPorCarrera carrera) persona , habilidades = habilidades (agregarHabilidad carrera persona)}

--Punto B (Integrante 2: Rodrigo Mollon)
agregarFelicidoniosPorViajar :: [String] -> Persona -> Int
agregarFelicidoniosPorViajar lista persona = (felicidonios persona) + ((100*).length $ lista)

cumplirSuenioViajar :: [String] -> Persona -> Persona
cumplirSuenioViajar lista laPersona = laPersona {edad = edad laPersona + 1, felicidonios = agregarFelicidonios (agregarFelicidoniosPorViajar lista) laPersona}

--Punto C (Integrante 3: Daniel Kesel)
agregarFelicidoniosPorEnamorarse :: Persona -> Persona -> Int
agregarFelicidoniosPorEnamorarse personaEnamorada personaDeQuienSeEnamoro = felicidonios personaEnamorada + felicidonios personaDeQuienSeEnamoro

unaPersonaSeEnamoraDeOtra :: Persona -> Persona -> Persona
unaPersonaSeEnamoraDeOtra enamorado deQuienSeEnamoro = enamorado {felicidonios = agregarFelicidonios (agregarFelicidoniosPorEnamorarse deQuienSeEnamoro) enamorado}




--Punto general
queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual = id

comboPerfecto :: Persona -> Persona
comboPerfecto persona = (\persona -> persona {felicidonios = ((+100).felicidonios) persona}).(cumplirSuenioViajar ["Berazategui","Paris"]).(recibirseDeUnaCarrera "Medicina") $ persona