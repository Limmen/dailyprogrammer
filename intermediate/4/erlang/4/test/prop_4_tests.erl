%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Property tests suite for '4'.erl
%%% @end
%%% Created : 25 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module(prop_4_tests).

%% API
-compile(export_all).
%% Includes
-include_lib("proper/include/proper.hrl").

%%Types
-type env() :: [{atom(), integer()}].

%% Tests
prop_lookup() ->
    ?FORALL({Var, Env},{atom(),env()}, is_in_env(Var, Env,'4':lookup(Var,Env))).


%% Helper functions

is_in_env(Var, Env, Result)->
    case lists:keyfind(Var, 1, Env) of
        {Var, Val} ->
            Val =:= Result;
        Else ->
            Else =:= Result
    end.




