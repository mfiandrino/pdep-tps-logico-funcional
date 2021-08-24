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
cursada(eric,mateDiscreta,verano(2018,2),6).
cursada(eric,ayed,verano(2018,2),6).
cursada(eric,algebra,verano(2018,2),6).

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
    esPersona(Persona),
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
    esPersona(Persona),
    esMateria(Materia),
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
    forall((aproboCursada(Persona,Materia),notaFinal(Persona,Materia,Nota)),Nota < 6).

% b. Integrante 2
soloRegularizoCursada(Nombre, Materia):-
    cursada(Nombre,Materia,_,Nota),
    Nota >=6,
    Nota <8.

materiaEsFiltro(Materia):-
    cursada(Nombre,Materia,_,_),
    forall(cursada(Nombre,Materia,_,_), soloRegularizoCursada(Nombre, Materia)).

% c. Integrante 3
esTrivial(Materia) :-
    cursada(_,Materia,_,_),
    forall(cursada(_,Materia,_,Nota), Nota >=6).

% Predicado para saber si aprobo el final.
aproboFinal(Persona,Materia) :-
    notaFinal(Persona,Materia,Nota),
    Nota >= 6.
% El concepto al que hacen referencia en la Parte 3 es el de inversibilidad.


%  --------------------- Parte 4 --------------------
% a. Integrante 1
quiereCursar(eric,economia).
quiereCursar(eric,fisica2).
quiereCursar(eric,disenioDeSistemas).
quiereCursar(eric,ads).
quiereCursar(eric,syo).
quiereCursar(eric,sintaxis).
quiereCursar(eric,fisica1).
quiereCursar(eric,paradigmas).
quiereCursar(eric,ingles1).
quiereCursar(eric,proba).

leGusta(eric,ads).
leGusta(eric,fisica1).
leGusta(eric,paradigmas).
leGusta(eric,ingles1).
leGusta(eric,proba).

leGusta(seba,so).

% Caso que tiene las 3 materias
posibilidadesDeCursada(Nombre,MateriaLinda,MateriaPesada,MateriaIntegradora) :-
    cursarMateriaLinda(Nombre,MateriaLinda),
    cursarMateriaPesada(Nombre,MateriaPesada),
    cursarMateriaIntegradora(Nombre,MateriaIntegradora).

% Caso de que no tiene materia linda
posibilidadesDeCursada(Nombre,_,MateriaPesada,MateriaIntegradora) :-
    noQuiereCursarMateriaLinda(Nombre),
    cursarMateriaPesada(Nombre,MateriaPesada),
    cursarMateriaIntegradora(Nombre,MateriaIntegradora).

% Caso de que no tiene materia pesada
posibilidadesDeCursada(Nombre,MateriaLinda,_,MateriaIntegradora) :-
    cursarMateriaLinda(Nombre,MateriaLinda),
    noQuiereCursarMateriaPesada(Nombre),
    cursarMateriaIntegradora(Nombre,MateriaIntegradora).

% Caso de que no tiene materia integradora
posibilidadesDeCursada(Nombre,MateriaLinda,MateriaPesada,_) :-
    cursarMateriaLinda(Nombre,MateriaLinda),
    cursarMateriaPesada(Nombre,MateriaPesada),
    noQuiereCursarMateriaIntegradora(Nombre).

% Caso de que no tiene materia linda ni pesada
posibilidadesDeCursada(Nombre,_,_,MateriaIntegradora) :-
    noQuiereCursarMateriaLinda(Nombre),
    noQuiereCursarMateriaPesada(Nombre),
    cursarMateriaIntegradora(Nombre,MateriaIntegradora).

% Caso de que no tiene materia linda ni integradora
posibilidadesDeCursada(Nombre,_,MateriaPesada,_) :-
    noQuiereCursarMateriaLinda(Nombre),
    cursarMateriaPesada(Nombre,MateriaPesada),
    noQuiereCursarMateriaIntegradora(Nombre).

% Caso de que no tiene materia pesada ni integradora
posibilidadesDeCursada(Nombre,MateriaLinda,_,_) :-
    cursarMateriaLinda(Nombre,MateriaLinda),
    noQuiereCursarMateriaPesada(Nombre),
    noQuiereCursarMateriaIntegradora(Nombre).

% Predicados auxiliares
noQuiereCursarMateriaIntegradora(Nombre) :-
    quiereCursar(Nombre,_),
    forall(quiereCursar(Nombre,MateriaIntegradora), not(esIntegradora(MateriaIntegradora))).

noQuiereCursarMateriaPesada(Nombre) :-
    quiereCursar(Nombre,_),
    forall(quiereCursar(Nombre,MateriaPesada), not(esPesada(MateriaPesada))).

noQuiereCursarMateriaLinda(Nombre) :-
    quiereCursar(Nombre,_),
    forall(quiereCursar(Nombre,MateriaLinda), not(leGusta(Nombre,MateriaLinda))).

cursarMateriaLinda(Nombre,MateriaLinda) :-
    quiereCursar(Nombre,MateriaLinda),
    leGusta(Nombre,MateriaLinda).

cursarMateriaPesada(Nombre,MateriaPesada) :-
    quiereCursar(Nombre,MateriaPesada),
    esPesada(MateriaPesada).

cursarMateriaIntegradora(Nombre,MateriaIntegradora) :-
    quiereCursar(Nombre,MateriaIntegradora),
    esIntegradora(MateriaIntegradora).

% b. Integrante 2
disponibleParaCursar(Nombre, ListaF):-
    aproboCursada(Nombre,Materia),
    esCorrelativa(MateriaNueva,Materia),
    intersection(materiasNecesarias(MateriaNueva, Lista1), materiasAprobadas(Nombre, Lista2), ListaF),
    materiasNecesarias(MateriaNueva, Lista1) = ListaF. 

materiasNecesarias(Materia, Lista1):- 
    findall(MateriaDisponible, (esCorrelativa(Materia, MateriaDisponible)), Lista1).

materiasAprobadas(Nombre, Lista2):- 
    findall(MateriaDisponible, (aproboCursada(Nombre, MateriaDisponible)), Lista2).

/*
% c. Integrante 3
combinacionMateriasTranquis(Estudiante, Combinacion):-
    findall(Materias, (cursada(Estudiante,Materia,_,_), materiasQueHabilita(Materia, Materias);
not(cursada(Estudiante, Materias,_,_)), materiasIniciales(Materias)),
CombinacionDada),
list_to_set(CombinacionDada, Combinacion).
combinacionMateriasTranquilas(Estudiante, Combinacion):-
    combinacionMateriasTranquilas(Estudiante, CombinacionDada),
    findall(Materia,(member(Materia, CombinacionDada),not(materiaEsFiltro(Materia))), Combinacion).
*/
