materia(algebra, 5).
materia(am1, 5).
materia(mateDiscreta, 3).
materia(ayed, 5).
materia(arqCompu, 4).
materia(syo, 3).
materia(quimica, 3).
materia(ingysoc, 4).
materia(ads, 6).
materia(sistDeRep, 3).
materia(am2, 5).
materia(sintaxis, 4).
materia(fisica1, 5).
materia(paradigmas, 4).
materia(ingles1, 4).
materia(proba, 6).
materia(disenioDeSistemas, 6).
materia(sistemasOperativos, 8).
materia(fisica2, 10).
materia(economia, 6).
materia(gestionDeDatos, 8).
materia(ingles2, 4).
materia(matematicaSuperior, 8).
materia(legislacion, 4).
materia(administracionDeRecursos, 6).
materia(ingenieriaDeSoftware, 6).
materia(teoriaDeControl, 6).
materia(comunicaciones, 8).
materia(redesDeInformacion, 8).
materia(investigacionOperativa, 10).
materia(simulacion, 8).
materia(proyectoFinal, 6).
materia(inteligenciaArtificial, 6).
materia(administracionGerencial, 6).
materia(sistemasDeGestion, 8).
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
esCorrelativa(economia, ads).
esCorrelativa(ads, syo).

materiasIniciales(algebra).
materiasIniciales(aml).
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

  /* materiasQueHabilita(Asignatura, MateriasQueHabilita):-materia(NombreMateria, _),
    findall(MateriaQueHabilita, (necesariasParaCursar(MateriaQueHabilita, MateriasNecesarias), member(NombreMateria, MateriasNecesarias)), MateriasQueHabilita).*/
