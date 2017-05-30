precioDepto(tinsmithCircle1774, 700).
precioDepto(avMoreno708,2000).
precioDepto(avSiempreviva742, 1000).
precioDepto(calleFalsa123, 200).
tieneCaracteristicas(tinsmithCircle1774,ambientes(3)).
tieneCaracteristicas(tinsmithCircle1774,jardin).
tieneCaracteristicas(tinsmithCircle1774,[aireAcondicionado,extractor,calefaccionAGas]).
tieneCaracteristicas(avMoreno708,ambientes(7)).
tieneCaracteristicas(avMoreno708,jardin).
tieneCaracteristicas(avMoreno708,pileta(30)).
tieneCaracteristicas(avMoreno708,[aireAcondicionado,extractor,lozaRadiante,vidriosDobles).
tieneCaracteristicas(avSiempreviva742,ambientes(4)).
tieneCaracteristicas(avSiempreviva742,jardin).
tieneCaracteristicas(avSiempreviva742,[calefaccionAGas]).
tieneCaracteristicas(calleFalsa123,ambientes(3)).
tieneCaracteristicas(calleFalsa123,[]).

persona(carlos).
persona(ana).
persona(maria).
persona(pedro).
persona(chamaleon).

caracteristicasDeseadas(carlos,ambientes(3)).
caracteristicasDeseadas(carlos,jardin).
caracteristicasDeseadas(ana,pileta(100)).
caracteristicasDeseadas(ana, aireAcondicionado).
caracteristicasDeseadas(ana, vidriosDobles).
caracteristicasDeseadas(maria,ambientes(2)).
caracteristicasDeseadas(maria,pileta(15)).
caracteristicasDeseadas(pedro,Caracteristica):-
  caracteristicasDeseadas(maria,Caracteristica)
caracteristicasDeseadas(chamaleon,Caracteristica):-
  Persona /= chamaleon,
  caracteristicasDeseadas(Persona,Caracteristica).

propiedadCompatible(Nombre, Propiedad):-
  compatibleJardin(Nombre, Propiedad),
  compatibleCantidadAmbientes(Nombre,Propiedad).
  compatiblePileta(Nombre,Propiedad).

compatibleJardin(Nombre,Propiedad):-
  quiereJardin(Nombre),
  jardin(Propiedad).

compatibleCantidadAmbientes(Nombre,Propiedad):-
  quiereCantidadDeAmbientes(Nombre,CantidadQueQuiere),
  cantidadAmbientes(Propiedad,CantidadQueTiene),
  CantidadQueTiene>=CantidadQueQuiere.

compatiblePileta(Nombre,Propiedad):-
  quierePiscina(Nombre, TamanioQueQuiere),
  pileta(Propiedad, TamanioQueTiene),
  TamanioQueTiene>=TamanioQueQuiere.

cumpleTodo(Persona,Propiedad):-
  propiedadCompatible(Persona,Propiedad).

mejorOpcion(Persona,Propiedad):-
  propiedadCompatible(Persona,Propiedad),
  propiedadCompatible(Persona,Propiedad2),
  precioDepto(Propiedad,Precio1),
  precioDepto(Propiedad2,Precio2),
  Precio1 < Precio2.

propiedadTop(Propiedad):-
  tieneCaracteristicas(Propiedad,ambientes(CantidadDeAmbientes)),
  CantidadDeAmbientes > 1,
  tieneCaracteristicas(Propiedad,Caracteristica),
  member(Caracteristica,[Instalaciones]).







/** Consultas:


*/
