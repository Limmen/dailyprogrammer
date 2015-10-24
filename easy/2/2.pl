% compile: ['2.pl']
% start with: start.

start:-
    format("What would you like to find? type Type f for force, m for mass, or a for Acceleration: ~n", []),
    ask_function(Func),
    find(Func).


ask_function(Func):-
    read(Func),
    nl.

find(f):-
    format("What is the acceleration? ~n", []),
    read(Acc),
    format("What is the mass? ~n", []),
    read(Mass),
    F is Acc*Mass,
    format("The force is: ~w ~n", [F]).

find(f):-
    format("What is the acceleration? ~n", []),
    read(Acc),
    format("What is the mass? ~n", []),
    read(Mass),
    F is Acc*Mass,
    format("The force is: ~w ~n", [F]).

find(m):-
    format("What is the acceleration? ~n", []),
    read(Acc),
    format("What is the force? ~n", []),
    read(F),
    M is F/Acc,
    format("The mass is: ~w ~n", [M]).

find(a):-
    format("What is the mass? ~n", []),
    read(M),
    format("What is the force? ~n", []),
    read(F),
    A is F/M,
    format("The acceleration is: ~w ~n", [A]).
    
