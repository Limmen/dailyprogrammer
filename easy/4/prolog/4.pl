%% ['4.pl'].
%% start.

:- use_module(library(random)).

start(Pwd):-
    format("Enter length of password ~n"),
    read(Length),
    gen_password(Length, Pwd).

gen_password(0, []).

gen_password(Length, [X|Y]):-
    random(33, 127, X),
    Length1 is Length -1,
    gen_password(Length1, Y).