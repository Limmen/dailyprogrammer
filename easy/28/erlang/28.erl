-module('28').

-export([start/0, start/1]).

start()->
    find_duplicate(quick_sort([random:uniform(1000) || _ <- lists:seq(1, 1000)])).

start(Arr) ->
    find_duplicate(quick_sort(Arr)).

quick_sort([Pivot|T]) ->
    quick_sort([ X || X <- T, X < Pivot]) ++
        [Pivot] ++
        quick_sort([ X || X <- T, X >= Pivot]);

quick_sort([]) -> [].

find_duplicate([])->
    false;

find_duplicate([H|T])->
    find_duplicate(H,T).

find_duplicate(E,[E|_])->
    E;

find_duplicate(_,[H|T])->
    find_duplicate(H,T);

find_duplicate(_,[])->
    false.

