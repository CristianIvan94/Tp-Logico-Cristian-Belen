% personaje(Nombre, Ocupacion)
personaje(pumkin, ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent, mafioso(maton)).
personaje(jules, mafioso(maton)).
personaje(marsellus, mafioso(capo)).
personaje(winston, mafioso(resuelveProblemas)).
personaje(mia, actriz([foxForceFive])).
personaje(butch, boxeador).
personaje(bernardo, mafioso(cerebro)).
personaje(bianca, actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie, vender([auto])).

% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).


amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

%Ejercicio01
esPeligroso(Personaje) :-
	personajePeligroso(Personaje).

personajePeligroso(Personaje) :-
	personaje(Personaje, mafioso(maton)).
personajePeligroso(Personaje) :-
	personaje(Personaje, ladron(Lista)),
	member(licorerias,Lista).
personajePeligroso(Personaje) :-
	encargo(Jefe,Personaje,_),
	personajePeligroso(Jefe).
	
%Ejercicio02FALTATERMINARLO
tieneCerca(Personaje1,Personaje2) :-
	amigo(Personaje1,Personaje2).
tieneCerca(Personaje1,Personaje2) :-
	encargo(Personaje2,Personaje1,_).


	
%Ejercicio03
nivelRespeto(Personaje,Nivel) :-
	nivel(Personaje,Nivel).
	
nivel(Personaje,Nivel) :-
	personaje(Personaje, actriz(Lista)),
	length(Lista,Cantidad),
	Nivel is Cantidad * 0.1.
nivel(Personaje,Nivel) :-
	personaje(Personaje, mafioso(resuelveProblemas)),
	Nivel is 10.
nivel(Personaje,Nivel) :-
	personaje(Personaje, mafioso(capo)),
	Nivel is 20.
nivel(vincent,15).


%Ejercicio04
respetabilidad(Respetables,NoRespetables) :-
	respetable(Respetables),
	noRespetable(NoRespetables).
	
respetable(Respetables) :-
	findall(Personaje, esRespetable(Personaje), RespetablesAux ),
	length(RespetablesAux,CantidadRespetables),
	Respetables is CantidadRespetables.
	
noRespetable(NoRespetables) :-
	findall(Personaje, noEsRespetable(Personaje), NoRespetablesAux),
	length(NoRespetablesAux,CantidadNoRespetables),
	NoRespetables is CantidadNoRespetables.
	
esRespetable(Personaje) :-
	nivelRespeto(Personaje,Nivel),
	Nivel > 9.
	
noEsRespetable(Personaje) :-
	personaje(Personaje,_),
	not(esRespetable(Personaje)).
	
%Ejercicio05FALTATERMINARLO
cantidadEncargos(Personaje,cantidadEncargos) :-
	personaje(Personaje,_),
	findall(Personaje, encargo(_,Personaje,_), listaEncargos),
	length(listaEncargos,cantidadEncargos).
