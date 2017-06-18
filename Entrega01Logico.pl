%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin,    honeyBunny).
%Ejercicio02
pareja(bernardo,charo).
pareja(bernardo,bianca).

%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
%Ejercicio03
trabajaPara(Empleador,bernardo) :-
	trabajaPara(marsellus,Empleador),
	Empleador \= jules.
trabajaPara(Empleador,george) :-
	saleCon(Empleador,bernardo),
	Empleador \= george.

%Ejercicio01
%saleCon(Persona,Persona)
saleCon(Persona1,Persona2) :-
	pareja(Persona1,Persona2),
	Persona1 \= Persona2.
saleCon(Persona1,Persona2) :-
	pareja(Persona2,Persona1),
	Persona1 \= Persona2.
	
%EJercicio04
esFiel(Persona) :-
	saleCon(_,Persona),
	findall(Pareja, saleCon(Pareja,Persona) , Novios ),
	length(Novios,Cantidad),
	Cantidad = 1.
	
%Ejercicio05
acataOrden(Empleador,Empleado) :-
	trabajaPara(Empleador,Empleado).
acataOrden(Empleador,Empleado) :- 
	trabajaPara(Empleador,Alguien),
	acataOrden(Alguien,Empleado).
	

	


	
	