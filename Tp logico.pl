precioDepto(tinsmithCircle1774, 700).
precioDepto(avMoreno708,2000).
precioDepto(avSiempreviva742, 1000).
precioDepto(calleFalsa123, 200).
tieneCaracteristicas(tinsmithCircle1774,ambientes(3)).
tieneCaracteristicas(tinsmithCircle1774,jardin).


tieneCaracteristicas(tinsmithCircle1774,aireAcondicionado).
tieneCaracteristicas(tinsmithCircle1774,extractor).
tieneCaracteristicas(tinsmithCircle1774,calefaccionAGas).
tieneCaracteristicas(avMoreno708,ambientes(7)).
tieneCaracteristicas(avMoreno708,jardin).
tieneCaracteristicas(avMoreno708,pileta(30)).


tieneCaracteristicas(avMoreno708,aireAcondicionado).
tieneCaracteristicas(avMoreno708,extractor).
tieneCaracteristicas(avMoreno708,lozaRadiante).
tieneCaracteristicas(avMoreno708,vidriosDobles).
tieneCaracteristicas(avSiempreviva742,ambientes(4)).
tieneCaracteristicas(avSiempreviva742,jardin).

tieneCaracteristicas(avSiempreviva742,calefaccionAGas).
%15
tieneCaracteristicas(calleFalsa123,ambientes(3)).

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
%30
caracteristicasDeseadas(maria,ambientes(2)).
caracteristicasDeseadas(maria,pileta(15)).

caracteristicasDeseadas(pedro,Caracteristica):-
  caracteristicasDeseadas(maria,Caracteristica).
caracteristicasDeseadas(pedro,lozaRadiante).
caracteristicasDeseadas(pedro,vidriosDobles).
caracteristicasDeseadas(chamaleon,Caracteristica):-
	persona(Persona),
  Persona \= chamaleon,
  caracteristicasDeseadas(Persona,Caracteristica).


cumpleTodo(Nombre,Depto):-
	
	forall(persona(Nombre),(caracteristicasDeseadas(Nombre, Caracteristica),tieneCaracteristicas(Depto, Caracteristica))).

mejorOpcion(Nombre, Depto):-
	cumpleTodo(Nombre, Depto),
	cumpleTodo(Nombre, Depto2),
	precioDepto(Depto, Precio),
	precioDepto(Depto2, Precio2),
	Depto\=Depto2,
	Precio=<Precio2.

efectividad(Cantidad):-

	findall(Persona,(persona(Persona),cumpleTodo(Persona, _ ), PersonasSatisfechas),
	list_to_set(PersonasSatisfechas,PersonasSatisfechasSinRepetir),
	findall(Persona,(persona(Persona),PersonasEnElMundo),
	length(PersonasSatisfechasSinRepetir,Cantidad1),
	length(PersonasEnElMundo, Cantidad2),
	Cantidad is Cantidad1 \ Cantidad2.

esPropiedadTop(Propiedad):-
	tieneCaractersiticas(Propiedad,aireAcondicionado),
	not(esChica(Propiedad)).
	


esChica(Propiedad):-
	tieneCaracteristicas(Propiedad,ambientes(CantidadDeAmbientes)),
	CantidadDeAmbientes is 1.

esChica(Propiedad):-
	not(tieneAmbientes(Propiedad)).

tieneAmbientes(Propiedad):-tieneCaracteristicas(Propiedad,ambientes(_)).
/** Consultas:


*/
