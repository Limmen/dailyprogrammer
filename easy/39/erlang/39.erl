%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Chalenge 39
%%% You are to write a function that displays the numbers from 1 to an input
%%% parameter n, one per line, except that if the current number is divisible by 3 
%%% the function should write “Fizz” instead of the number, if the current number 
%%% is divisible by 5 the function should write “Buzz” instead of the number, and 
%%% if the current number is divisible by both 3 and 5 the function should write 
%%% “FizzBuzz” instead of the number.
%%% For instance, if n is 20, the program should write 1, 2, Fizz, 4, Buzz, Fizz,
%%% 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, and Buzz on
%%% twenty successive lines.
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('39').

%% API
-export([challenge/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

challenge(N)->
    lists:map(fun(E) -> fizz_buzz_print(E) end, lists:seq(1,N)).

%%%===================================================================
%%% Internal functions
%%%===================================================================

fizz_buzz_print(E) when E rem 3 =:= 0 andalso E rem 5 =:= 0 ->
    io:format("FizzBuzz, ");

fizz_buzz_print(E) when E rem 3 =:= 0->
    io:format("Fizz, ");

fizz_buzz_print(E) when E rem 5 =:= 0->
    io:format("Buzz, ");

fizz_buzz_print(E) ->
    io:format("~p, ", [E]).



