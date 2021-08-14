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
esIntegradora(ads).
esIntegradora(syo).
esIntegradora(disenioDeSistemas).
esIntegradora(proyectoFinal).
esIntegradora(administracionDeRecursos).
esLibre(ingles).
esLibre(ingles2).


/* punto 2 */
esCorrelativa(am2, am1).
esCorrelativa(sintaxis, mateDiscreta).
esCorrelativa(sintaxis, ayed).
esCorrelativa(paradigmas, ayed).
esCorrelativa(economia, ads).
esCorrelativa(ads, syo).

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
/* PUNTO 2 */
% a.
materiasIniciales(MateriasIniciales):-
    findall(MateriaInicial, materiasIniciales(MateriaInicial), MateriasIniciales).


% c.

materiasQueHabilita(Asignatura, MateriasQueHabilita):-materia(Asignatura, _),
    findall(MateriaQueHabilita, (esCorrelativa(MateriaQueHabilita, Asignatura)), MateriasQueHabilita).
