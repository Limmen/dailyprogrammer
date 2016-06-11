-module('30').

-export([start/2]).

start(Sum, List)->
    find_numbers(Sum,List,List).

find_numbers(_,_,[])->
    false;

find_numbers(Sum,[H|T],[H2|T2])->
    case find_sum(Sum,H,T) of
        false ->
            find_numbers(Sum,[H|T],T2);
        Res ->
            Res
    end.

find_sum(_,_,[]) ->
    false;

find_sum(Sum,E,[H|T])->
    if
        (E + H) == Sum ->
            {true, {E,H}};
        true ->
            find_sum(Sum,E,T)
    end.




    

