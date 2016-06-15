-module('32').

-export([start/1]).


start({bet, Amount, Number}) ->
    Result = getResult(),
    if 
        Result == Number ->
            printWin(Result, Number, Amount);
        true ->
            printLoss(Result, Number, Amount)
    end.

getResult()->
    random:uniform(38) -1.

printWin(Result, Result, Amount)->
    io:format("You won! Correct number: ~p , you receive ~p dollars ~n", [Result, Amount * 35]).

printLoss(Result, _, Amount)->
    io:format("You lost. Correct number is: ~p, you loose ~p dollars ~n", [Result, Amount]).

