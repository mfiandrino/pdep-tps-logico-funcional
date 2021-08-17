% Listado de materias con total de horas de cursada
materia(algebra, 160).            
materia(am1, 160).                
materia(mateDiscreta, 96).       
materia(ayed, 160).              
materia(arqCompu, 128).          
materia(syo, 96).                
materia(quimica, 48).            
materia(ingysoc, 64).            
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

% Materias integradoras y libres
esIntegradora(ads).
esIntegradora(syo).
esIntegradora(disenioDeSistemas).
esIntegradora(proyectoFinal).
esIntegradora(administracionDeRecursos).
esLibre(ingles).
esLibre(ingles2).

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

% Cursadas
cursada(rocky,mateDiscreta, anual(2020),8).
cursada(rocky,algebra, cuatrimestral(2018, 2),5).
cursada(rocky,algebra, cuatrimestral(2018, 1),6).
cursada(rocky,fisica1, anual(2018),5).
cursada(terminator,am1, anual(2015),10).
cursada(terminator,algebra, cuatrimestral(2014, 2),4).
cursada(terminator,mateDiscreta, anual(2009),7).
cursada(terminator,fisica1, anual(2017),2).
cursada(terminator,fisica1, anual(2018),8).
cursada(danielLarusso,fisica1, anual(2019),7).
cursada(danielLarusso,algebra, cuatrimestral(2015, 2),10).
cursada(danielLarusso,mateDiscreta, anual(2015),1).
cursada(danielLarusso,mateDiscreta, anual(2021),6).
cursada(danielLarusso,fisica1, anual(2019),8).
cursada(eric,algebra,verano(2018,2),6).


%  --------------------- Parte 1: Las Materias -----------------
/* Punto 1 - Intergrante 1*/
tieneMasDeCienHoras(Materia) :- materia(Materia,Horas), Horas>100.
tieneNombreLargo(Materia) :- materia(Materia,_) , string_length(Materia, Length) , Length > 25.

esPesada(Materia) :- tieneMasDeCienHoras(Materia), esIntegradora(Materia).
esPesada(Materia) :- tieneNombreLargo(Materia).


/* punto 2 */
% a.  - Todos los integrantes -
materiasIniciales(Materia) :- 
    materia(Materia,_),
    not(esCorrelativa(Materia,_)).

% b. Integrante 2
todasLasCorrelativas(Materia, Correlativa):- esCorrelativa(Materia, Correlativa).
todasLasCorrelativas(Materia, Correlativa):- esCorrelativa(SiguienteCorrelativa, Correlativa),
    todasLasCorrelativas(Materia, SiguienteCorrelativa).

% c. Integrante 3
materiasQueHabilita(Asignatura, MateriasQueHabilita):-materia(Asignatura, _),
    esCorrelativa(MateriasQueHabilita, Asignatura). 


%  --------------------- Parte 2: Cursada -----------------
% Requerimientos base
% a. Integrante 1
anioCursada(Persona,Materia,Anio) :- cursada(Persona,Materia,anual(Anio),_).
anioCursada(Persona,Materia,Anio) :- cursada(Persona,Materia,cuatrimestral(Anio,_),_).
anioCursada(Persona,Materia,Anio) :- cursada(Persona,Materia,verano(Anio2,_),_), Anio is Anio2-1.

% b. Integrante 2
aproboCursada(Nombre,Materia) :-
    cursada(Nombre,Materia,_,Nota),
    Nota >= 6.

% c. Integrante 3
recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, anual(UnAnio), _),
    cursada(Estudiante, MateriasRecursada, anual(OtroAnio), _),
UnAnio \= OtroAnio.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, cuatrimestral(UnAnio, _), _),
    cursada(Estudiante, MateriasRecursada, cuatrimestral(OtroAnio, _),_),
UnAnio \= OtroAnio.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, cuatrimestral(_, Cuatri),_),
    cursada(Estudiante, MateriasRecursada, cuatrimestral(_, OtroCuatri),_),
Cuatri \= OtroCuatri.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, verano(Anio,_ ),_),
    cursada(Estudiante, MateriasRecursada, verano(OtroAnio,_ ),_),
    Anio \= OtroAnio.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, verano(_, Mes),_),
    cursada(Estudiante, MateriasRecursada, verano(_, OtroMes),_),
    Mes \= OtroMes.

% Desempeño academico
% a. Todos los integrantes
indiceAcademicoTotal(Persona,Sumatoria) :- 
    findall(Indice,indiceAcademico(Persona,Indice),ListaIndices),
    sumlist(ListaIndices, Sumatoria).

indiceAcademico(Persona,Indice) :- cursada(Persona,_,anual(_),Nota), indiceAnual(Nota,Indice).
indiceAcademico(Persona,Indice) :- cursada(Persona,_,cuatrimestral(_,Cuatri),Nota), indiceCuatrimestral(Cuatri,Nota,Indice).
indiceAcademico(Persona,Indice) :- cursada(Persona,_,verano(_,_),Nota) , indiceVerano(Nota,Indice).

indiceAnual(Nota,Indice) :- Indice = Nota.
indiceCuatrimestral(Cuatri,Nota,Indice) :- Indice is Nota - (Cuatri - 1).
indiceVerano(Nota,Indice) :- between(0,10,Nota), Nota < 9 , Indice is Nota.
indiceVerano(Nota,Indice) :- between(0,10,Nota), Nota >= 9 , Indice is 8.


% b. Todos los integrantes
indiceAcademicoTotalPorMateria(Persona,Materia,Sumatoria) :- 
    findall(Indice,indiceAcademicoDeMateria(Persona,Materia,Indice),ListaIndices),
    sumlist(ListaIndices, Sumatoria).

indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,anual(_),Nota), indiceAnual(Nota,Indice).
indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,cuatrimestral(_,Cuatri),Nota), indiceCuatrimestral(Cuatri,Nota,Indice).
indiceAcademicoDeMateria(Persona,Materia,Indice) :- cursada(Persona,Materia,verano(_,_),Nota) , indiceVerano(Nota,Indice).


%  --------------------- Parte 3: Personas que estudian-----------------

% a. Integrante 1
notaFinal(rocky,algebra,5).
notaFinal(terminator,mateDiscreta,3).
notaFinal(danielLarusso,fisica1,6).
notaFinal(danielLarusso,mateDiscreta,3).
notaFinal(eric,algebra,10).

esProcrastinadora(Persona) :-
    notaFinal(Persona,_,_),
    forall(notaFinal(Persona,_,Nota),Nota < 6).

% b. Integrante 2
soloRegularizoCursada(Nombre, Materia):-
    cursada(Nombre,Materia,_,Nota),
    Nota >=6,
    Nota <8.

materiaEsFiltro(Materia):-
    cursada(Nombre,Materia,_,_),
    forall(cursada(Nombre,Materia,_,_), soloRegularizoCursada(Nombre, Materia)).


% c. Integrante 3
esTrivial(Materia):-
    cursada(_, Materia, _,6),
    not(recurso(_, Materia)).

esTrivial(Materia):-
    cursada(_, Materia, _,7),
    not(recurso(_, Materia)).

esTrivial(Materia):-
    cursada(_, Materia, _,8),
    not(recurso(_, Materia)).

esTrivial(Materia):-
    cursada(_, Materia, _,9),
    not(recurso(_, Materia)).

esTrivial(Materia):-
    cursada(_, Materia, _,10),
    not(recurso(_, Materia)).

% El concepto al que hacen referencia en la Parte 3 es el de inversibilidad.


%  --------------------- Parte 4 -----------------

% a. Integrante 1

% b. Integrante 2
disponibleParaCursar(Nombre, ListaMaterias):-
    aproboCursada(Nombre,Materia),
    forall(not(aproboCursada(Nombre,MateriaDisponible)), ListaMaterias).

materiasNecesarias(Materia, Lista):- 
    findall(MateriaDisponible, (esCorrelativa(MateriaDisponible, Materia)), Lista).

% c. Integrante 3

esTranqui(am1).
esTranqui(fisica1).
esTranqui(mateDiscreta).
esTranqui(syo).
esTranqui(legislacion).
esTranqui(quimica).
esTranqui(ingles1).
esTranqui(am1).

esTranqui(am1).

