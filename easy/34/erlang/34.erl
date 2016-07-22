%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%% Dailyprogrammer 34 - Easy
%%% 
%%% A very basic challenge:
%%% In this challenge, the
%%% input is are : 3 numbers as arguments
%%% output: the sum of the squares of the two larger numbers.
%%% Your task is to write the indicated challenge.
%%%
%%% commands:
%%% c('34').  %%compile
%%% '34':challenge(number(),number(),number()). %% run
%%% proper:module('34').
%%% @end
%%% Created : 21 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('34').

%% API
-export([challenge/3]).

%% Includes
-include_lib("proper/include/proper.hrl").

%%%===================================================================
%%% API
%%%===================================================================
-spec(challenge(number(), number(), number())-> number()).
challenge(First, Second, Third) when Third =< First, Third =< Second ->
    First * First + Second * Second;

challenge(First, Second, Third) when Second =< First, Second =< Third ->
    First * First + Third * Third;

challenge(_, Second, Third) ->
    Second * Second + Third * Third.

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================

prop_challenge()->
    ?FORALL({First,Second,Third}, {number(), number(), number()}, 
            begin 
                Expected = if
                               Third =< First andalso Third =< Second ->
                                   Second*Second + First*First;
                               Second =< First andalso Second =< Third ->
                                   First*First + Third*Third;
                               true ->
                                   Second*Second + Third*Third
                           end,
                Expected =:= challenge(First,Second,Third)
            end
           ).
