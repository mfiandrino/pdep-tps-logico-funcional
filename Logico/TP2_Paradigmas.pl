% Listado de materias con total de horas de cursada
materia(algebra, 160).            
materia(am1, 160).                
materia(mateDiscreta, 96).       
materia(ayed, 160).              
materia(arqCompu, 128).                     
materia(quimica, 48).            
materia(ingysoc, 64).   
materia(syo, 96).    
materia(ads, 192).      
materia(sistDeRep, 96).          
materia(am2, 160).               
materia(sintaxis, 128).          
materia(fisica1, 160).           
materia(paradigmas, 128).        
materia(ingles1, 64).            
materia(proba, 96).               
materia(disenioDeSistemas, 192).  
materia(sistemasOperativos, 128).    
materia(fisica2, 160).               
materia(economia, 96).               
materia(gestionDeDatos, 128).        
materia(ingles2, 64).                
materia(matematicaSuperior, 128).    
materia(legislacion, 64).            
materia(administracionDeRecursos, 192).   
materia(ingenieriaDeSoftware, 96).        
materia(teoriaDeControl, 96).             
materia(comunicaciones, 128).             
materia(redesDeInformacion, 128).         
materia(investigacionOperativa, 160).     
materia(simulacion, 128).                 
materia(proyectoFinal, 192).              
materia(inteligenciaArtificial, 96).         
materia(administracionGerencial, 96).            
materia(sistemasDeGestion, 128).     

esMateria(Materia) :- materia(Materia,_).

% Materias integradoras y libres
esIntegradora(ads).
esIntegradora(syo).
esIntegradora(disenioDeSistemas).
esIntegradora(proyectoFinal).
esIntegradora(administracionDeRecursos).

% Correlatividades
esCorrelativa(am2, am1).
esCorrelativa(am2, algebra).
esCorrelativa(fisica2, am1).
esCorrelativa(fisica2, fisica1).
esCorrelativa(ads, syo).
esCorrelativa(ads, ayed).
esCorrelativa(sintaxis, mateDiscreta).
esCorrelativa(sintaxis, ayed).
esCorrelativa(paradigmas, mateDiscreta).
esCorrelativa(paradigmas, ayed).
esCorrelativa(sistemasOperativos, mateDiscreta).
esCorrelativa(sistemasOperativos, ayed).
esCorrelativa(sistemasOperativos, arqCompu).
esCorrelativa(proba, am1).
esCorrelativa(proba, algebra).
esCorrelativa(disenioDeSistemas, ads).
esCorrelativa(disenioDeSistemas, paradigmas).
esCorrelativa(comunicaciones, arqCompu).
esCorrelativa(comunicaciones, am2).
esCorrelativa(fisica2, fisica1).
esCorrelativa(matematicaSuperior, am2).
esCorrelativa(gestionDeDatos, ads).
esCorrelativa(gestionDeDatos, sintaxis).
esCorrelativa(gestionDeDatos, paradigmas).
esCorrelativa(economia, ads).
esCorrelativa(ingles2, ingles1).
esCorrelativa(redesDeInformacion, sistemasOperativos).
esCorrelativa(redesDeInformacion, comunicaciones).
esCorrelativa(administracionDeRecursos, sistemasOperativos).
esCorrelativa(administracionDeRecursos, disenioDeSistemas).
esCorrelativa(administracionDeRecursos, economia).
esCorrelativa(investigacionOperativa, proba).
esCorrelativa(investigacionOperativa, matematicaSuperior).
esCorrelativa(simulacion, proba).
esCorrelativa(simulacion, matematicaSuperior).
esCorrelativa(ingenieriaDeSoftware, proba).
esCorrelativa(ingenieriaDeSoftware, disenioDeSistemas).
esCorrelativa(ingenieriaDeSoftware, gestionDeDatos).
esCorrelativa(teoriaDeControl, quimica).
esCorrelativa(teoriaDeControl, matematicaSuperior).
esCorrelativa(legislacion, ads).
esCorrelativa(legislacion, ingysoc).
esCorrelativa(proyectoFinal, redesDeInformacion).
esCorrelativa(proyectoFinal, administracionDeRecursos).
esCorrelativa(proyectoFinal, ingenieriaDeSoftware).
esCorrelativa(proyectoFinal, legislacion).
esCorrelativa(inteligenciaArtificial, investigacionOperativa).
esCorrelativa(inteligenciaArtificial, simulacion).
esCorrelativa(administracionGerencial, administracionDeRecursos).
esCorrelativa(administracionGerencial, investigacionOperativa).
esCorrelativa(sistemasDeGestion, administracionDeRecursos).
esCorrelativa(sistemasDeGestion, investigacionOperativa).
esCorrelativa(sistemasDeGestion, simulacion).

% Libre
rindioLibre(rocky,ingles1,aprobado).
rindioLibre(rocky,ingles2,aprobado).
rindioLibre(terminator,ingles1,aprobado).
rindioLibre(terminator,ingles2,desaprobado).
rindioLibre(danielLarusso,ingles1,desaprobado).

% Cursadas
cursada(rocky,mateDiscreta, anual(2020),8).
cursada(rocky,algebra, cuatrimestral(2018, 2),5).
cursada(rocky,algebra, cuatrimestra(2018, 1),6).
cursada(rocky,quimica, anual(2015),6).
cursada(rocky,algebra, cuatrimestral(2018, 1),6).
cursada(rocky,fisica1, anual(2018),5).
cursada(terminator,am1, anual(2015),10).
cursada(terminator,algebra, cuatrimestral(2014, 2),4).
cursada(terminator,mateDiscreta, anual(2009),7).
cursada(terminator,fisica1, anual(2017),2).
cursada(terminator,fisica1, anual(2018),8).
cursada(danielLarusso,algebra, cuatrimestral(2015, 2),10).
cursada(danielLarusso,mateDiscreta, anual(2015),1).
cursada(danielLarusso,mateDiscreta, anual(2021),6).
cursada(danielLarusso,fisica1, anual(2019),8).
cursada(eric,mateDiscreta,verano(2018,2),6).
cursada(eric,ayed,verano(2018,2),6).
cursada(eric,algebra,verano(2018,2),7).

esPersona(Persona) :- cursada(Persona,_,_,_).

%  --------------------- Parte 1: Las Materias -----------------
/* Punto 1 - Intergrante 1*/
tieneMasDeCienHoras(Materia) :- materia(Materia,Horas), Horas>100.
tieneNombreLargo(Materia) :- esMateria(Materia) , string_length(Materia, Length) , Length > 25.

esPesada(Materia) :- tieneMasDeCienHoras(Materia), esIntegradora(Materia).
esPesada(Materia) :- tieneNombreLargo(Materia).


/* Punto 2 */
% a.  - Todos los integrantes -
materiasIniciales(Materia) :- 
    esMateria(Materia),
    not(esCorrelativa(Materia,_)).

% b. Integrante 2
todasLasCorrelativas(Materia,ListaCorrelativas) :-
    esMateria(Materia),
    findall(Correlativa,correlativa(Materia,Correlativa),ListaCorrelativasAux),
    list_to_set(ListaCorrelativasAux, ListaCorrelativas).
    

correlativa(Materia, Correlativa):- esCorrelativa(Materia, Correlativa).
correlativa(Materia, Correlativa):- esCorrelativa(SiguienteCorrelativa, Correlativa),
    correlativa(Materia, SiguienteCorrelativa).

% c. Integrante 3
todasLasMateriasQueHabilita(Asignatura,ListaDeMateriasQueHabilita) :- 
    esMateria(Asignatura),
    findall(MateriaQueHabilita,materiaQueHabilita(Asignatura, MateriaQueHabilita),ListaDeMateriasQueHabilitaAux),
    list_to_set(ListaDeMateriasQueHabilitaAux, ListaDeMateriasQueHabilita).
    
materiaQueHabilita(Asignatura, MateriaQueHabilita):-materia(Asignatura, _),
    esCorrelativa(MateriaQueHabilita, Asignatura). 


%  --------------------- Parte 2: Cursada -----------------
% Requerimientos base
% a. Integrante 1
anioCursada(Persona,Materia,Anio) :- cursada(Persona,Materia,TipoDeCursada,_), sacarAnio(TipoDeCursada,Anio).

sacarAnio(anual(Anio),Anio).
sacarAnio(cuatrimestral(Anio,_),Anio).
sacarAnio(verano(Anio2,_),Anio) :- Anio is Anio2-1.

% b. Integrante 2
aproboCursada(Nombre,Materia) :-
    cursada(Nombre,Materia,_,Nota),
    Nota >= 6.

% c. Integrante 3
recurso(Estudiante, MateriasRecursada):-
    anioCursada(Estudiante, MateriasRecursada, Anio),
    anioCursada(Estudiante, MateriasRecursada, OtroAnio),
    Anio \= OtroAnio.

% Desempeño academico
% a. Todos los integrantes
indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,anual(_),Indice).
indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,cuatrimestral(_,Cuatri),Nota), Indice is Nota - (Cuatri - 1).
indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,verano(_,_),Nota) , indiceVerano(Nota,Indice).

indiceVerano(Nota,Nota) :- between(0,10,Nota), Nota < 9.
indiceVerano(Nota,8) :- between(0,10,Nota), Nota >= 9.

% b. Todos los integrantes
indiceAcademicoDeTodasLasCursadasDeLaMateria(Persona,Materia,Sumatoria) :- 
    cursada(Persona,Materia,_,_),
    findall(Indice,indiceAcademicoDeMateria(Persona,Materia,Indice),ListaIndices),
    sumlist(ListaIndices, Sumatoria).

%  --------------------- Parte 3: Personas que estudian-----------------
% a. Integrante 1
notaFinal(rocky,algebra,5).
notaFinal(terminator,mateDiscreta,3).
notaFinal(danielLarusso,fisica1,6).
notaFinal(danielLarusso,mateDiscreta,3).
notaFinal(eric,algebra,10).

esProcrastinadora(Persona) :-
    notaFinal(Persona,_,_),
    forall((aproboCursada(Persona,Materia),notaFinal(Persona,Materia,Nota)),Nota < 6).

% b. Integrante 2
materiaEsFiltro(Materia) :-
    cursada(_,Materia,_,_),
    forall(aproboCursada(Persona,Materia),not(promocionoCursada(Persona,Materia))).

% c. Integrante 3
esTrivial(Materia) :-
    cursada(_,Materia,_,_),
    forall(cursada(_,Materia,_,Nota), Nota >=6).

% Predicados auxiliares.
aproboFinal(Persona,Materia) :-
    notaFinal(Persona,Materia,Nota),
    Nota >= 6.
aproboFinal(Persona,Materia) :-
    rindioLibre(Persona,Materia,aprobado).

promocionoCursada(Persona,Materia) :- 
    cursada(Persona,Materia,_,Nota),
    Nota >= 8.

soloRegularizoCursada(Nombre, Materia):-
    aproboCursada(Nombre,Materia),
    not(promocionoCursada(Nombre,Materia)).

aproboMateria(Persona,Materia) :- aproboFinal(Persona,Materia).
aproboMateria(Persona,Materia) :- promocionoCursada(Persona,Materia).

% El concepto al que hacen referencia en la Parte 3 es el de inversibilidad.


%  --------------------- Parte 4 --------------------
% a. Integrante 1
leGusta(eric,ads).
leGusta(eric,fisica1).
leGusta(eric,paradigmas).
leGusta(eric,ingles1).
leGusta(eric,proba).
leGusta(seba,so).

sinRepetidos([],[]).
sinRepetidos([Cabeza|Cola], ListaSinRepetidos):- member(Cabeza, Cola), !, sinRepetidos(Cola, ListaSinRepetidos).
sinRepetidos([Cabeza|Cola],[Cabeza|ListaSinRepetidos]) :- sinRepetidos(Cola,ListaSinRepetidos).

alternativa(Persona,Lista) :-
    leGusta(Persona,MateriaLinda),
    esPesada(MateriaPesada),
    esIntegradora(MateriaIntegradora),
    sinRepetidos([MateriaLinda,MateriaPesada,MateriaIntegradora], Lista).

% b. Integrante 2
materiasQuePuedeCursar(Estudiante,ListaMaterias) :-
    cursada(Estudiante,_,_,_),
    findall(Materia,materiaQuePuedeCursar(Estudiante,Materia),Materias),
    sinRepetidos(Materias,ListaMaterias).

materiaQuePuedeCursar(Estudiante,Materia) :-
    esMateria(Materia),
    cursada(Estudiante,_,_,_),
    forall(correlativa(Materia,Correlativa) , aproboCursada(Estudiante,Correlativa)),
    not(aproboCursada(Estudiante,Materia)).

combinatoria([],[]).

combinatoria([Materia|Materias],[Materia|MateriasCombinatoria]) :-
    combinatoria(Materias,MateriasCombinatoria).

combinatoria([_|Materias],MateriasCombinatoria) :-
    combinatoria(Materias,MateriasCombinatoria).


combinatoriaMateriasQuePuedeCursar(Persona,Combinatoria) :-
    materiasQuePuedeCursar(Persona,MateriasTranqui),
    combinatoria(MateriasTranqui,Combinatoria).


% c. Integrante 3

esTranqui(Materia) :- 
    cursada(_,Materia,_,_),
    not(materiaEsFiltro(Materia)).

materiasTranquiQuePuedeCursar(Persona,MateriasTranqui) :- 
    cursada(Persona,_,_,_),
    findall(MateriaTranqui,(esTranqui(MateriaTranqui),materiaQuePuedeCursar(Persona,MateriaTranqui)),MateriasTranquiAux),
    sinRepetidos(MateriasTranquiAux,MateriasTranqui).

combinatoriaMateriasTranquis(Persona,Combinatoria) :-
    materiasTranquiQuePuedeCursar(Persona,MateriasTranqui),
    combinatoria(MateriasTranqui,Combinatoria).

/*
%c. Integrante 3 Generar estudiante, luego materias posibles, Abstraccion de Materia Tranqui por ej esTranqui (No Filtro)
% Materia posible = que no haya aprobado pero si las cursada de las correlativas. 
% generar findall de materias tranqui, con la condicion que sea tranqui y posible, se genera una lista y con esa trabajo.
% Y ahi hacer la combinatoria. Para eliminar el repetido, no suar list_to:set, usar un predicado auxiliar que sea sin repetidos, con recursividad
% c. Integrante 3 . 
alumnosCursando([rocky, terminator, danielLarusso,eric]).
esTranqui(Materia):-cursada(_, Materia, _ ,_), not(materiaEsFiltro(Materia)).
materiaPosible(Estudiante, Materia):-not(aproboCursada(Estudiante, Materia)), correlativa(Materia, Correlativa), aproboCursada(Estudiante, Correlativa).
todasMateriasTranquis(Materias):-findall(Materia, (esTranqui(Materia), materiaPosible(_, Materia)), Materias).

    
combinacionTranquis(Estudiante, Tranquis):-
    todasMateriasTranquis(Tranquis).
  

tranquis([], []).
tranquis([MateriasPosible|MateriasPosibles], [MateriasPosible|Tranquis]):-
todasMateriasTranquis(MateriasPosible), 
tranquis(Posibles, Tranquis).
tranquis([_|MateriasPosibles], Tranquis):-
	tranquis(MateriasPosibles, Tranquis).
*/
 
