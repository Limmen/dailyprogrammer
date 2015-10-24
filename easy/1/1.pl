% compile: ['1.pl']
% start with: start.
% lowercase input only.

start:-
    ask_name(Name),
    ask_age(Age),
    ask_username(User),
    print(Name,Age,User).

ask_name(Name):-
    format("What is  your name? ~n", []),
    read(Name),
    nl.

ask_age(Age):-
    format("What is  your age? ~n",[]),
    read(Age),
    nl.

ask_username(User):-
    format("What is your reddit username? ~n",[]),
    read(User),
    nl.

print(Name,Age,User):-
    format("your name is ~w, you are ~w years old, and your username is ~w ~n", [Name,Age,User]).
    
    
