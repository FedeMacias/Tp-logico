departamento(tinsmithcircle1774, 700).
departamento(avmoreno708,2000).
departamento(avsiempreviva742, 1000).
departamento(callefalsa123, 200).
jardin(tinsmithcircle1774).
jardin(avmoreno708).
jardin(avsiempreviva742).
cantidadAmbientes(tinsmithcircle1774,3).
cantidadAmbientes(avmoreno708,7).
cantidadAmbientes(avsiempreviva742,4).
cantidadAmbientes(tinsmithcircle1774,3).
pileta(avmoreno708,30).


mismaCantidadAmbientes(Propiedad1,Propiedad2):-
  cantidadAmbientes(Propiedad1,Metros),
  cantidadAmbientes(Propiedad2,Metros).

quiereCantidadDeAmbientes(carlos,3).
quiereCantidadDeAmbientes(maria,2).
quiereCantidadDeAmbientes(pedro,2).
quiereCantidadDeAmbientes(chameleon, 2).


quiereJardin(carlos).
quiereJardin(chameleon).

quierePiscina(ana,100).
quierePiscina(carlos,30).
quierePiscina(maria,15).
quierePiscina(pedro,15).
quierePiscina(chameleon,100).

propiedadCompatible(Nombre, Propiedad):-
  compatibleJardin(Nombre, Propiedad),
  compatibleCantidadAmbientes(Nombre,Propiedad).
  compatiblePileta(Nombre,Propiedad).

compatibleJardin(Nombre,Propiedad):-
  quiereJardin(Nombre),
  jardin(Propiedad).

compatibleCantidadAmbientes(Nombre,Propiedad):-
    quiereCantidadDeAmbiente(Nombre,CantiadQueQuiere),
    cantidadAmbientes(Propiedad,CantidadQueTiene),
    CantidadQueTiene>=CantiadQueQuiere.

compatiblePileta(Nombre,Propiedad):-
  quierePiscina(Nombre, TamanioQueQuiere),
  pileta(Propiedad, TamanioQueTiene),
  TamanioQueTiene>=TamanioQueQuiere.
