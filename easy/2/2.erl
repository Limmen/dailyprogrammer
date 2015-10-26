% c('2.erl').
% '2'.start().

-module('2').

-compile(export_all).


start()->
    io:format("What would you like to find? type Type F for force, M for mass, or A for Acceleration: ~n"),
    Choice = hd(string:tokens(io:get_line("> "),"\r\n")),
    case Choice of
        "A" ->
            F = hd(string:tokens(io:get_line("What is the force? "),"\r\n")),
            M = hd(string:tokens(io:get_line("What is the mass? "),"\r\n")),
            acc(list_to_integer(F),list_to_integer(M));
        "F" ->
            A = hd(string:tokens(io:get_line("What is the acceleration? "),"\r\n")),
            M = hd(string:tokens(io:get_line("What is the mass? "),"\r\n")),
            force(M,A);
        "M" ->
            F = hd(string:tokens(io:get_line("What is the force? "),"\r\n")),
            A = hd(string:tokens(io:get_line("What is the acceleration? "),"\r\n")),
            mass(list_to_integer(F),list_to_integer(A));
        true -> io:format("Invalid input ~n")
                end.


mass(F,A)->
    M = F/A,
    io:format("The mass is: ~w ~n", [M]).

acc(F,M)->
    A = F/M,
    io:format("The acceleration is: ~w ~n", [A]).

force(M,A)->
    F = M*A,
    io:format("The force is: ~w ~n", [F]).
