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

/** 1) 1 ?- pileta(Cual,30).
   Cual = avmoreno708.
*/

/** 2)2 ?- mismaCantidadAmbientes(X,Y).
X = Y, Y = tinsmithcircle1774 ;
X = tinsmithcircle1774,
Y = callefalsa123 ;
X = Y, Y = avmoreno708 ;
X = Y, Y = avsiempreviva742 ;
X = callefalsa123,
Y = tinsmithcircle1774 ;
X = Y, Y = callefalsa123.
*/

mismaCantidadAmbientes(Propiedad1,Propiedad2):-
  cantidadAmbientes(Propiedad1,Metros),
  cantidadAmbientes(Propiedad2,Metros).

%--version 1--
quiereCantidadDeAmbientes(carlos,3).
quiereCantidadDeAmbientes(maria,2).
quiereCantidadDeAmbientes(pedro,2).
quiereCantidadDeAmbientes(chameleon, 2).

quiereJardin(carlos).
quiereJardin(chameleon).

quierePiscina(ana,100).
quierePiscina(maria,15).
quierePiscina(pedro,15).
quierePiscina(chameleon,100).

propiedadCompatible(Nombre, Propiedad):-
  compatibleJardin(Nombre, Propiedad).
  compatiblePileta(Nombre,Propiedad).


compatibleJardin(Nombre,Propiedad):-
  quiereJardin(Nombre),
  jardin(Propiedad).

compatiblePileta(Nombre,Propiedad):-
  quierePiscina(Nombre, Tamanio),
  pileta(Propiedad, Tamanio).

 %usuario(carlos,(cantidadAmbientes(depto,3),jardin(depto),noPileta)).
