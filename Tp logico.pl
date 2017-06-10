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

%(CONSULTAS 6 Y 7), NO SE COMO PLANTEAR EJERCICIO PARA SATISFACERLAS
cumpleCaracteristica(Nombre,Propiedad):-
  caracteristicasDeseadas(Nombre,Caracteristica),
  tieneCaracteristicas(Propiedad,Caracteristica).

cumpleCaracteristica(Nombre,Propiedad):-
  caracteristicasDeseadas(Nombre,Caracteristica),
  precioDepto(Propiedad,_),
  bla(Caracteristica,Propiedad).

bla(pileta(Metros), Propiedad):-
  tieneCaracteristicas(Propiedad,pileta(OtrosMetros)),
  Metros<OtrosMetros.

bla(ambientes(Metros), Propiedad):-
    tieneCaracteristicas(Propiedad,ambientes(OtrosMetros)),
    Metros<OtrosMetros.


cumpleTodo(Nombre,Depto):- 
persona(Nombre),
precioDepto(Depto,_),
	forall(caracteristicasDeseadas(Nombre, Caracteristica),tieneCaracteristicas(Depto, Caracteristica)).



mejorOpcion(Nombre, Depto):-
  persona(Nombre),
  cumpleTodo(Nombre,Depto),
  precioDepto(Depto,UnPrecio),
  forall((cumpleTodo(Nombre,OtroDepto),precioDepto(OtroDepto,OtroPrecio),cumpleCaracteristica(Nombre,OtroDepto)),(UnPrecio=<OtroPrecio)).



efectividad(Cantidad):-
	findall(Persona,(persona(Persona),cumpleTodo(Persona, _ )), PersonasSatisfechas),
	list_to_set(PersonasSatisfechas,PersonasSatisfechasSinRepetir),
	findall(Persona1,persona(Persona1),PersonasEnElMundo),
	length(PersonasSatisfechasSinRepetir,Cantidad1),
	length(PersonasEnElMundo, Cantidad2),
	Cantidad is Cantidad1 / Cantidad2.



esPropiedadTop(Propiedad):-%BIEN!
	tieneCaracteristicas(Propiedad,aireAcondicionado),
	not(esChica(Propiedad)).

esChica(Propiedad):-
	tieneCaracteristicas(Propiedad,ambientes(CantidadDeAmbientes)),
	CantidadDeAmbientes is 1.

esChica(Propiedad):-
	not(tieneAmbientes(Propiedad)).

tieneAmbientes(Propiedad):-tieneCaracteristicas(Propiedad,ambientes(_)).
/** Consultas:
1. Si existe alguna propiedad con una piscina de 30 metros, y si es que existe, cuál es.
?-tieneCaracteristicas(Propiedad,pileta(30)).
Propiedad = avMoreno708.


2. Si existe alguna propiedad que tenga la misma cantidad de ambientes que otra, y si existe, cuál/es son solución.
?- tieneCaracteristicas(Propiedad,ambientes(CantAmbientes)),tieneCaracteristicas(Propiedad2,ambientes(CantAmbientes)),Propiedad\=Propiedad2.
Propiedad = tinsmithCircle1774,
CantAmbientes = 3,
Propiedad2 = calleFalsa123 ;
Propiedad = calleFalsa123,
CantAmbientes = 3,
Propiedad2 = tinsmithCircle1774 ;


3. Mostrar qué quiere Pedro. Por ejemplo, una posible solución a lo que quiere, es una piscina de 15 m³.
?- caracteristicasDeseadas(pedro,Caracteristica).
Caracteristica = ambientes(2) ;
Caracteristica = pileta(15) ;
Caracteristica = lozaRadiante ;
Caracteristica = vidriosDobles.


4. Si existe alguna propiedad que cumpla con tener al menos 2 ambientes.
 ?- tieneCaracteristicas(Propiedad,ambientes(2)).
 false.


5. Cuál propiedad tiene (cumple) algo de lo que quiere Pedro.
?- cumpleCaracteristica(pedro,Propiedad).
Propiedad = avMoreno708 ;
Propiedad = tinsmithCircle1774 ;
Propiedad = avMoreno708 ;
Propiedad = avSiempreviva742 ;
Propiedad = calleFalsa123 ;


6. Qué se está deseando de la propiedad de Av. Moreno 708 (y que ésta lo cumpla).


7. Determinar qué característica fue solicitada y ninguna propiedad la pudo cumplir.


8. Qué persona se relaciona con cuál propiedad mediante ese predicado.
?- cumpleTodo(Nombre,Propiedad).
Nombre = carlos,
Propiedad = tinsmithCircle1774 ;
false.

9. Qué persona se relaciona con cuál propiedad (asegurarse de que ambas alternativas encuentren las mismas
soluciones, ya sean en el mismo orden o no).
?- mejorOpcion(Persona,Propiedad).
Persona = carlos,
Propiedad = tinsmithCircle1774 ;

10. Qué efectividad tiene nuestro sistema.
?- efectividad(A).
A = 0.2.

11. Determinar cuáles son las propiedades top.
?- esPropiedadTop(PropiedadTop).
PropiedadTop = tinsmithCircle1774 ;
PropiedadTop = avMoreno708.
*/
