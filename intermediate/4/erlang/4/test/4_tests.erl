%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Test suite for '4'.erl
%%% @end
%%% Created : 25 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('4_tests').

%% API exports
-compile(export_all).
%% Includes
-include_lib("eunit/include/eunit.hrl").

print_test_()->
    [
     ?_assertMatch("4",'4':print({num,4})),
     ?_assertMatch("x",'4':print({var,x})),
     ?_assertMatch("(4+x)",'4':print({add, {num,4},{var,x}})),
     ?_assertMatch("(a+(2*b))",'4':print({add,{var,a},{mul,{num,2},{var,b}}})), 
     ?_assertMatch("(a*(2*b))",'4':print({mul,{var,a},{mul,{num,2},{var,b}}}))
    ].

parse_test_()->
    [
     ?_assertMatch({{num,4},[]}, '4':parse("4")),
     ?_assertMatch({{var,x},[]}, '4':parse("x")),
     ?_assertMatch({{add,{num,4},{var,x}},[]}, '4':parse("(4+x)")),
     ?_assertMatch({{mul,{var,a},{mul,{num,2},{var,b}}},[]}, '4':parse("(a*(2*b))")),
     ?_assertMatch({{add,{var,a},{mul,{num,2},{var,b}}},[]}, '4':parse("(a+(2*b))")),
     ?_assertMatch({{add,{num,2},{mul,{num,3},{num,4}}},[]}, '4':parse("(2+(3*4))"))
    ].

eval_test_()->
    [
     ?_assertMatch(14,'4':eval([],{add,{num,2},{mul,{num,3},{num,4}}})),
     ?_assertMatch(18,'4':eval([],{add,{num,2},{mul,{num,4},{num,4}}})),
     ?_assertMatch(1,'4':eval([],{num,1})),
     ?_assertMatch(1,'4':eval([{x,1}],{var,x}))
    ].

compile_test_()->
    [
     ?_assertMatch([{push,4}], '4':compile({num,4})),
     ?_assertMatch([{fetch,x}], '4':compile({var,x})),
     ?_assertMatch([{push,4},{push,9},{add2}], '4':compile({add,{num,4},{num,9}})),
     ?_assertMatch([{push,4},{push,9},{mul2}], '4':compile({mul,{num,4},{num,9}})),
     ?_assertMatch([{fetch,x},{fetch,y},{mul2}], '4':compile({mul,{var,x},{var,y}}))
    ].
run_test_()->
    [
     ?_assertMatch(1, '4':run([{push,1}],[])),
     ?_assertMatch(1, '4':run([{fetch,x}],[{x,1}])),
     ?_assertMatch(16, '4':run([{push,4},{push,4},{mul2}],[])),
     ?_assertMatch(8, '4':run([{push,4},{push,4},{add2}],[]))
    ].

execute_test_()->
    [
     ?_assertMatch(14,'4':execute([],{add,{num,2},{mul,{num,3},{num,4}}})),
     ?_assertMatch(18,'4':execute([],{add,{num,2},{mul,{num,4},{num,4}}})),
     ?_assertMatch(1,'4':execute([],{num,1})),
     ?_assertMatch(1,'4':execute([{x,1}],{var,x}))
    ].

simplify_test_()->
    [
     ?_assertMatch({num,4}, '4':simplify({add, {num,4},{num,0}})),
     ?_assertMatch({num,4}, '4':simplify({mul, {num,4},{num,1}})),
     ?_assertMatch({num,0}, '4':simplify({mul, {num,4},{num,0}}))
    ].
