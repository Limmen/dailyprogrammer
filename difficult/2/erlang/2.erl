%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% 
%%% Challenge difficult 2
%%% Your mission is to create a stopwatch program. 
%%% This program should have start, stop, and lap options, 
%%% And it should write out to a file to be viewed later. 
%%%
%%% @end
%%% Created : 29 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('2').

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
    loop(not_started, 1).

%%%===================================================================
%%% Internal functions
%%%===================================================================

loop(not_started, LapCount)->
    case io:read("> ") of
        {ok, start} ->
            Start = erlang:timestamp(),
            loop(Start, LapCount);
        {ok, stop} ->
            io:format("Clock not started ~n"),
            loop(not_started, LapCount);
        {ok,lap} ->
            file:write_file("stopwatch.txt", "Lap " ++ LapCount ++ "\n"),
            loop(not_started, LapCount + 1)
    end;

loop(Start, LapCount)->
    case io:read("> ") of
        {ok,start} ->
            Start = erlang:timestamp(),
            loop(Start, LapCount);
        {ok,stop} ->
            Stop = erlang:timestamp(),
            file:write_file("stopwatch.txt", "Time: " ++ float_to_list(timer:now_diff(Stop, Start)/1000000) ++ " seconds \n"),
            loop(not_started, LapCount);
        {ok,lap} ->
            file:write_file("stopwatch.txt", "Lap " ++ [LapCount] ++ "\n"),
            loop(Start, LapCount + 1)
    end.
