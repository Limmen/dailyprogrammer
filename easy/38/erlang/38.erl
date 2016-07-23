%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 38
%%% Implement Dijkstra's algorithm in any way you can :)
%%% Inspired by: http://rosettacode.org/wiki/Dijkstra%27s_algorithm#Erlang
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('38').

%% includes
-include_lib("eunit/include/eunit.hrl").

%% API
-export([dijkstra/3]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================

dijkstra(Graph, Start, End) when is_map(Graph) ->
	shortest_path(Graph, [{0, [Start]}], End, #{}).

shortest_path(_Graph, [], _End, _Visited) ->
	{0, []};

shortest_path(_Graph, [{Cost, [End | _] = Path} | _ ], End, _Visited) ->
	{Cost, lists:reverse(Path)};

shortest_path(Graph, [{Cost, [Node | _ ] = Path} | Routes], End, Visited) ->
	NewRoutes = [{Cost + NewCost, [NewNode | Path]}
                 || {NewCost, NewNode} <- maps:get(Node, Graph),
                    not maps:get(NewNode, Visited, false)],
	shortest_path(
      Graph,
      lists:sort(NewRoutes ++ Routes),
      End,
      Visited#{Node => true}
     ).

basic_test() ->
	Graph = #{
      a => [{7,b},{9,c},{14,f}],
      b => [{7,a},{10,c},{15,d}],
      c => [{10,b},{9,c},{11,d},{2,f}],
      d => [{15,b},{6,e},{11,c}],
      e => [{9,f},{6,d}],
      f => [{14,f},{2,c},{9,e}]
     },
	{Cost, Path}   = dijkstra(Graph, a, e),
	{20,[a,c,f,e]} = {Cost, Path}.
