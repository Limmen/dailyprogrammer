%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% 
%%% Challenge 1 Difficult
%%% We all know the classic "guessing game" with higher or lower prompts. 
%%% Lets do a role reversal; you create a program that will guess numbers between 1-100, 
%%% and respond appropriately based on whether users say that the number is too high or too low. 
%%% Try to make a program that can guess your number based on user input and great code!
%%%
%%% @end
%%% Created : 29 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('1').

%% API
-export([challenge/0]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
challenge()->
    Facts = #{smaller_than => 100, larger_than => 1},
    repl(Facts).
%%%===================================================================
%%% Internal functions
%%%===================================================================

repl(Facts)->
    io:format("THe map : ~p ~n", [Facts]),
    Guess = make_guess(Facts),
    io:format("I guess ~p, is it correct? y/n ~n", [Guess]),
    {ok, Input} = io:read(">"),
    io:format("~n"),
    case Input of
        y ->
            io:format("Yay ~n");
        n ->
            io:format("Is the number to high? y/n ~n"),
            {ok,Input2} = io:read(">"),
            io:format("~n"),
            case Input2 of
                y ->
                    repl(maps:update(smaller_than,Guess,Facts));
                n ->
                    repl(maps:update(larger_than,Guess,Facts))
            end
    end.


make_guess(Facts)->
    (maps:get(smaller_than, Facts) - maps:get(larger_than, Facts)) div 2 + maps:get(larger_than, Facts).
