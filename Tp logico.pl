precioDepto(tinsmithCircle1774, 700).
precioDepto(avMoreno708,2000).
precioDepto(avSiempreviva742, 1000).
precioDepto(calleFalsa123, 200).
tieneCaracteristicas(tinsmithCircle1774,ambientes(3)).
tieneCaracteristicas(tinsmithCircle1774,jardin).
tieneCaracteristicas(avMoreno708,ambientes(7)).
tieneCaracteristicas(avMoreno708,jardin).
tieneCaracteristicas(avMoreno708,pileta(30)).
tieneCaracteristicas(avSiempreviva742,ambientes(4)).
tieneCaracteristicas(avSiempreviva742,jardin).
tieneCaracteristicas(calleFalsa123,ambientes(3)).

persona(carlos).
persona(ana).
persona(maria).
persona(pedro).
persona(chamaleon).

caracteristicasDeseadas(carlos,ambientes(3)).
caracteristicasDeseadas(carlos,jardin).
caracteristicasDeseadas(ana,pileta(100)).
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

/** Consultas:


*/
