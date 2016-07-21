%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%% Write a program that will take a number and print a right triangle attempting to use all numbers from 1 to that number.
%%% Sample Run:
%%% Enter number: 10
%%% Output:
%%% 7 8 9 10
%%% 4 5 6
%%% 2 3
%%% 1
%%% %%% Enter number: 6
%%% Output:
%%% 4 5 6
%%% 2 3
%%% 1
%%% %%% Enter number: 3
%%% Output:
%%% 2 3
%%% 1
%%% %%% Enter number: 12
%%% Output:
%%% 7 8 9 10
%%% 4 5 6
%%% 2 3
%%% 1
%%% 
%%% %%% @end
%%%
%%% Commands
%%% c('35'). %%% compile
%%% '35':challenge(number()). %%% run
%%% proper:module('35'). %%% tests
%%% Created : 21 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('35').

%% API
-export([challenge/1]).

%%include
-include_lib("proper/include/proper.hrl").

%%%===================================================================
%%% API
%%%===================================================================

challenge(N)->
    print_triangle(lists:reverse(create_triangle(N,1,0,[]))),
    ok.

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================

create_triangle(N,I,C,Acc) when N - I < C ->
    Acc;
create_triangle(N,I,C,Acc) ->
    create_triangle(N,I+1,C+I,Acc ++ [lists:seq(C+1, C+I)]).

print_triangle(Triangle)->
    lists:map(fun(Row) -> lists:map(fun(Number) -> io:format("~p ",[Number]) end, Row), io:format("~n") end, Triangle).


prop_create_triangle()->
    ?FORALL(N, integer(), increase_length_of_row_with_one(create_triangle(N,1,0,[]))).


increase_length_of_row_with_one([]) ->
    true;
increase_length_of_row_with_one([_]) ->
    true;
increase_length_of_row_with_one([H,X|T]) ->
    length(H) =:= length(X) - 1 andalso increase_length_of_row_with_one(T).
