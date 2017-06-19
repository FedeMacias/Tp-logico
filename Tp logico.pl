precioDepto(tinsmithCircle1774, 700).
precioDepto(avMoreno708,2000).
precioDepto(avSiempreviva742, 1000).
precioDepto(calleFalsa123, 200).

tieneCaracteristicas(tinsmithCircle1774,ambientes(3)).
tieneCaracteristicas(tinsmithCircle1774,jardin).
tieneCaracteristicas(tinsmithCircle1774,instalaciones([aireAcondicionado,extractor,calefaccionAGas]).
tieneCaracteristicas(avMoreno708,ambientes(7)).
tieneCaracteristicas(avMoreno708,jardin).
tieneCaracteristicas(avMoreno708,pileta(30)).
tieneCaracteristicas(avMoreno708,instalaciones([vidriosDobles,lozaRadiante,extractor,aireAcondicionado]).
tieneCaracteristicas(avSiempreviva742,ambientes(4)).
tieneCaracteristicas(avSiempreviva742,jardin).
tieneCaracteristicas(avSiempreviva742,calefaccionAGas).
tieneCaracteristicas(avSiempreviva742,instalaciones([calefaccionAGas]).
tieneCaracteristicas(calleFalsa123,ambientes(3)).

persona(carlos).
persona(ana).
persona(maria).
persona(pedro).
persona(chamaleon).

caracteristicaDeseada(carlos,ambientes(3)).
caracteristicaDeseada(carlos,jardin).
caracteristicaDeseada(ana,pileta(100)).
caracteristicaDeseada(ana, aireAcondicionado).
caracteristicaDeseada(ana, vidriosDobles).
caracteristicaDeseada(maria,ambientes(2)).
caracteristicaDeseada(maria,pileta(15)).
caracteristicaDeseada(pedro,Caracteristica):-
  caracteristicaDeseada(maria,Caracteristica).
caracteristicaDeseada(pedro,lozaRadiante).
caracteristicaDeseada(pedro,vidriosDobles).
caracteristicaDeseada(chamaleon,Caracteristica):-
	persona(Persona),
  Persona \= chamaleon,
  caracteristicasDeseadas(Persona,Caracteristica).

cumpleCaracteristica(Propiedad,Caracteristica):-
  caracteristicasDeseadas(Caracteristica),
  tieneCaracteristicas(Propiedad,Caracteristica).

cumpleCaracteristica(Propiedad,Caracteristica):-
  caracteristicasDeseadas(Caracteristica),
  analisisCaracteristica(Caracteristica,Propiedad).

analisisCaracteristica(pileta(Metros),Propiedad):-
  tieneCaracteristicas(Propiedad,pileta(OtrosMetros)),
  Metros<OtrosMetros.

analisisCaracteristica(ambientes(Metros),Propiedad):-
    tieneCaracteristicas(Propiedad,ambientes(OtrosMetros)),
    Metros<OtrosMetros.

analisisCaracteristica(instalaciones(Instalacion),Propiedad):-
  tieneCaracteristicas(Propiedad,instalaciones(Instalacion)).

cumpleTodo(Nombre,Depto):-
persona(Nombre),
precioDepto(Depto,_),
	forall(caracteristicasDeseadas(Nombre, Caracteristica),cumpleCaracteristica(Depto, Caracteristica)).

mejorOpcion(Nombre, Depto):-
  cumpleTodo(Nombre,Depto),
  precioDepto(Depto,UnPrecio),
  forall((precioDepto(OtroDepto,OtroPrecio),cumpleTodo(Nombre,OtroDepto)),(UnPrecio=<OtroPrecio)).
  %Hacer opcion 2 con el doble NOT

efectividad(Cantidad):-
  todasLasSatisfechas(Persona),
  todasLasPersonas(Persona),
	length(PersonasSatisfechasSinRepetir,Cantidad1),
	length(PersonasEnElMundo, Cantidad2),
	Cantidad is Cantidad1 / Cantidad2.

estaSatisfecho(Persona):-
  persona(Persona),
  cumpleTodo(Persona, _ ).

todasLasPersonas(Persona):-
  findall(Persona,persona(Persona),PersonasEnElMundo).

todasLasSatisfechas(Persona):-
findall(Persona,(estaSatisfecho(Persona)), PersonasSatisfechas),
list_to_set(PersonasSatisfechas,PersonasSatisfechasSinRepetir).

esPropiedadTop(Propiedad):-
	tieneCaracteristicas(Propiedad,instalaciones(aireAcondicionado)),
	not(esChica(Propiedad)).

esChica(Propiedad):-
	tieneCaracteristicas(Propiedad,ambientes(1)),

esChica(Propiedad):-
  precioDepto(Propiedad,_).
	not(tieneAmbientes(Propiedad)).

tieneAmbientes(Propiedad):-tieneCaracteristicas(Propiedad,ambientes(_)).

% Pendientes
% 1-Hacer parte teorica
% 2-Hacer bonus (si sale)
% 3-Rehacer las Consultas

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
