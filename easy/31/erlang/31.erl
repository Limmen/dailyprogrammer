-module('31').

-export([base26_to_int/2, int_to_base26/1, start/2]).


start(Num1,Num2) ->
    multiply(Num1,Num2).

multiply(Num1,Num2)->
    Val1 = base26_to_int(lists:reverse(Num1), 0),
    Val2 = base26_to_int(Num2,0),
    Product = Val1*Val2,
    io:format("Prod: ~p ~n", [Product]),
    int_to_base26(round(Product)).

base26_to_int([],_)->
    0;

base26_to_int([H|T],Pow) ->
    (H - $A)*math:pow(26,Pow) + base26_to_int(T, Pow + 1).

int_to_base26(Int)->
    int_to_base26(Int,[]).

int_to_base26(Int, Acc) when Int < 0->
    lists:reverse(Acc);

int_to_base26(Int, Acc) when Int >= 0 ->
    if
        Int == 0 ->
            int_to_base26(-1, Acc ++ [65]);
        true ->
            int_to_base26(Int div 26, Acc ++ [(Int rem 26) + 65])

    end.

