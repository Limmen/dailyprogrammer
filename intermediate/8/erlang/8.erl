%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 8, Intermediate
%%% Write a program that will print the english name of a value. 
%%% for example, "1211" would become "one-thousand, two hundred, eleven".
%%% for extra credit, allow it to read the english value of a number and output the integer.
%%% input: one-hundred, four output: 104
%%%
%%% @end
%%% Created : 27 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('8').

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
challenge(Number)->
    Digits = #{0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
               5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"},
    Teen = #{10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen",
             14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
             18 => "eighteen", 19 => "nineteen"},
    Decade = #{2 => "twenty", 3 => "thirty", 4 => "fourty", 5 => "fifty",
               6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"},
    Maps = #{digits => Digits, teen => Teen, decade => Decade},
    parse_number(Number, Maps).
%%%===================================================================
%%% Internal functions
%%%===================================================================

parse_number(X, Maps) ->
    case X =:= 0 of 
        true ->
            "zero";
        false ->
            [H|T] = integer_to_list(X),
            parse(list_to_integer([H]),T, Maps)
    end.

parse(X,[H|T],Maps) when X =:= 0 ->
    parse(list_to_integer([H]), T, Maps);

parse(X,[H|T],Maps) when X =:= 1->
    case length([H|T]) of
        0 -> 
            [maps:get(X, maps:get(digits, Maps))];
        1 ->
            [maps:get(list_to_integer(integer_to_list(X) ++ [H]), maps:get(teen, Maps))];
        2 -> 
            [maps:get(X, maps:get(digits, Maps)) ++ " hundred"| parse(list_to_integer([H]),T,Maps)];
        3 -> 
            [maps:get(X, maps:get(digits, Maps)) ++ " thousand"| parse(list_to_integer([H]),T,Maps)]
    end;

parse(X,[H|T],Maps) ->
    case length([H|T]) of
        0 -> 
            [maps:get(X, maps:get(digits, Maps))];
        1 ->
            [maps:get(X, maps:get(decade, Maps))| parse(list_to_integer([H]),T,Maps)];
        2 -> 
            [maps:get(X, maps:get(digits, Maps)) ++ " hundred"| parse(list_to_integer([H]),T,Maps)];
        3 -> 
            [maps:get(X, maps:get(digits, Maps)) ++ " thousand"| parse(list_to_integer([H]),T,Maps)]
    end;

parse(X, [], Maps) ->
    case X =:= 0 of
        true ->
            [];
        false ->
            [maps:get(X, maps:get(digits, Maps))]
    end.
