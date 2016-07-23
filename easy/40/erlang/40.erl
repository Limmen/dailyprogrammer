%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 40
%%% Print the numbers from 1 to 1000 without using any loop or conditional statements.
%%% Don’t just write the printf() or cout statement 1000 times.
%%% Be creative and try to find the most efficient way!
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------

-module('40').

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
    lists:map(fun(E)-> io:format("~p ", [E]) end, lists:seq(1,1000)).
%%%===================================================================
%%% Internal functions
%%%===================================================================
