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

%  --------------------- Parte 1 -----------------
/* Punto 1 */


/* punto 2 */
% Base de conocimiento
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


materiasIniciales(algebra).
materiasIniciales(am1).
materiasIniciales(ingles1).
materiasIniciales(syo).
materiasIniciales(ayed).
materiasIniciales(mateDiscreta).
materiasIniciales(arqCompu).
materiasIniciales(quimica).
materiasIniciales(ingysoc).
materiasIniciales(sistDeRep).
materiasIniciales(fisica1).

% a.  - Todos los integrantes -
materiasIniciales(MateriasIniciales):-
    findall(MateriaInicial, materiasIniciales(MateriaInicial), MateriasIniciales).

% b. Integrante 2
todasLasCorrelativas(Materia, Correlativa):- esCorrelativa(Materia, Correlativa).
todasLasCorrelativas(Materia, Correlativa):- esCorrelativa(SiguienteCorrelativa, Correlativa),
    todasLasCorrelativas(Materia, SiguienteCorrelativa).
    

% c. Integrante 3

materiasQueHabilita(Asignatura, MateriasQueHabilita):-materia(Asignatura, _),
esCorrelativa(MateriasQueHabilita, Asignatura). 

/* Parte 2 - c*/


cursada(rocky,am1, anual(2018)).
cursada(rocky,algebra, cuatrimestral(2018, 2)).
cursada(rocky,algebra, cuatrimestral(2018, 1)).
cursada(rocky,mateDiscreta, anual(2019)).
cursada(rocky,mateDiscreta, anual(2020)).
cursada(rocky,fisica1, anual(2018)).
cursada(terminator,am1, anual(2015)).
cursada(terminator,algebra, cuatrimestral(2014, 2)).
cursada(terminator,mateDiscreta, anual(2009)).
cursada(terminator,fisica1, anual(2017)).
cursada(terminator,fisica1, anual(2018)).
cursada(danielLarusso,am1, anual(2016)).
cursada(danielLarusso,algebra, cuatrimestral(2015, 2)).
cursada(danielLarusso,mateDiscreta, anual(2015)).
cursada(danielLarusso,mateDiscreta, anual(2021)).
cursada(danielLarusso,fisica1, anual(2019)).

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, anual(UnAnio)),
    cursada(Estudiante, MateriasRecursada, anual(OtroAnio)),
UnAnio \= OtroAnio.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, cuatrimestral(UnAnio, _)),
    cursada(Estudiante, MateriasRecursada, cuatrimestral(OtroAnio, _)),
UnAnio \= OtroAnio.

recurso(Estudiante, MateriasRecursada):-
    cursada(Estudiante, MateriasRecursada, cuatrimestral(_, Cuatri)),
    cursada(Estudiante, MateriasRecursada, cuatrimestral(_, OtroCuatri)),
Cuatri \= OtroCuatri.

/* Parte3.c */

promedioMateriaAlumno(rocky, am1, 6).
promedioMateriaAlumno(rocky, algebra, 5).
promedioMateriaAlumno(rocky, algebra, 6).
promedioMateriaAlumno(rocky, mateDiscreta, 5).
promedioMateriaAlumno(rocky, mateDiscreta, 8).
promedioMateriaAlumno(rocky, fisica1, 6).
promedioMateriaAlumno(terminator, am1, 6).
promedioMateriaAlumno(terminator, algebra, 9).
promedioMateriaAlumno(terminator, mateDiscreta, 9).
promedioMateriaAlumno(terminator, fisica1, 5).
promedioMateriaAlumno(terminator, fisica1, 6).
promedioMateriaAlumno(danielLarusso, am1, 6).
promedioMateriaAlumno(danielLarusso, algebra, 9).
promedioMateriaAlumno(danielLarusso, mateDiscreta, 2).
promedioMateriaAlumno(danielLarusso, mateDiscreta, 9).
promedioMateriaAlumno(danielLarusso, fisica1, 5).

esTrivial(Materia):-
    promedioMateriaAlumno(_, Materia, 6),
    not(recurso(_, Materia)).

