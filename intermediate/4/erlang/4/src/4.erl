%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 4
%%% Create a calculator program that will take an input, following normal calculator input (5*5+4) and give an answer (29). 
%%% This calculator should use all four operators.
%%% For extra credit, add other operators (6(4+3), 3 ** 3, etc.)
%%%
%%% @end
%%% Created : 25 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('4').

%% API
-export([print/1, eval/2, lookup/2, parse/1, run/2, compile/1, simplify/1, execute/2]).

%% Types

%%
%% Expressions are represented like this
%%
%%     {num, N}
%%     {var, A}
%%     {add, E1, E2}
%%     {mul, E1, E2}
%%
%% where N is a number, A is an atom,
%% and E1, E2 are themselves expressions,
%% For example,
%%   {add,{var,a},{mul,{num,2},{var,b}}
%% represents the mathematical expression
%%   (a+(2*b))
-type expr() :: {'num', integer()}
              | {'var', atom()}
              | {'add', expr(), expr()}
              | {'mul', expr(), expr()}.

-type env() :: [{atom(), integer()}].

-type instr() :: {'push', integer()}
               | {'fetch', atom()}
               | {'add2'}
               | {'mul2'}.

-type program() :: [instr()].

-type stack() :: [integer()].

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Pretty prints a structured representation of a mathematical expression.
%% For example,
%%   {add,{var,a},{mul,{num,2},{var,b}}
%% represents the mathematical expression
%%   (a+(2*b))
%% @spec
%% print(Expr) -> String.
%% @end
%%--------------------------------------------------------------------
-spec print(expr()) -> string().

print({num,N}) ->
    integer_to_list(N);
print({var,A}) ->
    atom_to_list(A);
print({add,E1,E2}) ->
    "("++ print(E1) ++ "+" ++ print(E2) ++")";
print({mul,E1,E2}) ->
    "("++ print(E1) ++ "*" ++ print(E2) ++")".



%%--------------------------------------------------------------------
%% @doc
%% Parses a string expression into a structured representation.
%%
%% parsing
%%
%%                                                %
%% recognise expressions
%% deterministic, recursive descent, parser.
%%                                                %
%% the function returns two things
%%   - an expression recognised at the beginning of the string
%%     (in fact, the longers such expression)
%%   - whatever of the string is left
%%
%% for example, parse("(-55*eeee)+1111)") is             
%%   {{mul,{num,-55},{var,eeee}} , "+1111)"}
%%
%%
%% recognise a fully-bracketed expression, with no spaces etc.
%%
%% @spec
%% parse(String) -> Expr.
%% @end
%%--------------------------------------------------------------------
-spec parse(string()) -> {expr(), string()}.

parse([$(|Rest]) ->                          % starts with a '('
    {E1,Rest1}     = parse(Rest),            % then an expression
    [Op|Rest2]     = Rest1,                  % then an operator, '+' or '*'
    {E2,Rest3}     = parse(Rest2),           % then another expression
    [$)|RestFinal] = Rest3,                  % starts with a ')'
    {case Op of
         $+ -> {add,E1,E2};
         $* -> {mul,E1,E2}
     end,
     RestFinal};

%% recognise an integer, a sequence of digits
%% with an optional '-' sign at the start

parse([Ch|Rest]) when ($0 =< Ch andalso Ch =< $9) orelse Ch==$- ->
    {Succeeds,Remainder} = get_while(fun is_digit/1,Rest),
    {{num, list_to_integer([Ch|Succeeds])}, Remainder};


%% recognise a variable: an atom built of small letters only.

parse([Ch|Rest])  when $a =< Ch andalso Ch =< $z ->
    {Succeeds,Remainder} = get_while(fun is_alpha/1,Rest),
    {{var, list_to_atom([Ch|Succeeds])}, Remainder}.


%%--------------------------------------------------------------------
%% @doc
%% Evaluates an expression in a given environment.
%% @spec
%% eval(Env, Expr) -> Integer.
%% @end
%%--------------------------------------------------------------------
-spec eval(env(),expr()) -> integer().

eval(_Env,{num,N}) ->
    N;
eval(Env,{var,A}) ->
    lookup(A,Env);
eval(Env,{add,E1,E2}) ->
    eval(Env,E1) + eval(Env,E2);
eval(Env,{mul,E1,E2}) ->
    eval(Env,E1) * eval(Env,E2).


%%--------------------------------------------------------------------
%% @doc
%% Looks up the value of a variable in a given environment.
%% @spec
%% lookup(Var, Env) -> Integer.
%% @end
%%--------------------------------------------------------------------
-spec lookup(atom(), env()) -> integer().
lookup(_A, [{_A,V}|_])->
    V;

lookup(A, [_|Rest]) ->
    lookup(A,Rest);

lookup(_, [])->
    false.
%%
%% Compiler and virtual machine
%%
%% Instructions
%%    {push, N} - push integer N onto the stack
%%    {fetch, A} - lookup value of variable a and push the result onto the stack
%%    {add2} - pop the top two elements of the stack, add, and push the result
%%    {mul2} - pop the top two elements of the stack, multiply, and push the result

%%--------------------------------------------------------------------
%% @doc
%% Compiles a given expression into a program (a list of instructions) for a absrtact stack machine.
%% @spec
%% compile(Expr) -> Program.
%% @end
%%--------------------------------------------------------------------
-spec compile(expr()) -> program().

compile({num,N}) ->
    [{push, N}];
compile({var,A}) ->
    [{fetch, A}];
compile({add,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{add2}];
compile({mul,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{mul2}].


%%--------------------------------------------------------------------
%% @doc
%% Run a code sequence in given environment and empty stack
%% @spec
%% run(Program, Env) -> Integer.
%% @end
%%--------------------------------------------------------------------
-spec run(program(),env()) -> integer().
run(Code,Env) ->
    run(Code,Env,[]).

%%--------------------------------------------------------------------
%% @doc
%% Execute an instruction, and when the code is exhausted,
%% return the top of the stack as result.
%% Classic tail recursion
%% @spec
%% run(Program, Env) -> Integer.
%% @end
%%--------------------------------------------------------------------
-spec run(program(), env(), stack()) -> integer().
run([{push, N} | Continue], Env, Stack) ->
    run(Continue, Env, [N|Stack]);

run([{fetch, A} | Continue], Env, Stack) ->
    run(Continue, Env, [lookup(A,Env)|Stack]);

run([{add2} | Continue], Env, [N1,N2|Stack]) ->
    run(Continue, Env, [(N1+N2)|Stack]);

run([{mul2} | Continue], Env, [N1,N2|Stack]) ->
    run(Continue, Env, [(N1*N2)|Stack]);
run([], _Env, [N]) ->
    N.

%%--------------------------------------------------------------------
%% @doc
%% compile and run ...
%% should be identical to eval(Env,Expr)
%% @spec
%% execute(Env, Expr) -> Integer.
%% @end
%%--------------------------------------------------------------------
-spec execute(env(),expr()) -> integer().

execute(Env,Expr) ->
    run(compile(Expr),Env).


%%--------------------------------------------------------------------
%% @doc
%% Simplifies an expression
%% @spec
%% simplify(Expr) -> SimpExpr 
%% @end
%%--------------------------------------------------------------------
-spec simplify(expr()) -> expr().
simplify(E) ->
    simp(compose(rules()),E).
%%%===================================================================
%%% Internal functions
%%%===================================================================

%% recognise a digit

-spec is_digit(integer()) -> boolean().

is_digit(Ch) ->
    $0 =< Ch andalso Ch =< $9.

%% recognise a small letter

-spec is_alpha(integer()) -> boolean().

is_alpha(Ch) ->
    $a =< Ch andalso Ch =< $z.

%% the longest initial segment of a list in which all
%% elements have property P. Used in parsing integers
%% and variables

-spec get_while(fun((T) -> boolean()),[T]) -> {[T],[T]}.    

get_while(P,[Ch|Rest]) ->
    case P(Ch) of
        true ->
            {Succeeds,Remainder} = get_while(P,Rest),
            {[Ch|Succeeds],Remainder};
        false ->
            {[],[Ch|Rest]}
    end;
get_while(_P,[]) ->
    {[],[]}.


%%
%% Simplify an expression
%%

%% Adding 0 gives the same result
zeroA({add,E,{num,0}}) ->
    E;
zeroA({add,{num,0},E}) ->
    E;
zeroA(E) ->
    E.

%% Multiply by 1 gives the same result
mulO({mul,E,{num,1}}) ->
    E;
mulO({mul,{num,1},E}) ->
    E;
mulO(E) ->
    E.

%% Multiply by 0 gives 0
mulZ({mul,_,{num,0}}) ->
    {num,0};
mulZ({mul,{num,0},_}) ->
    {num,0};
mulZ(E) ->
    E.

%% Combines simplification rules to a single rule. 
compose([]) ->
    fun (E) -> E end;
compose([Rule|Rules]) ->
    fun (E) -> (compose(Rules))(Rule(E)) end.

%% List of simplification rules
rules() ->
    [ fun zeroA/1, fun mulO/1, fun mulZ/1].

%% Function to simplify a expression bottom up with a simplification rule
simp(F,{add,E1,E2}) ->
    F({add,simp(F,E1),simp(F,E2)});
simp(F,{mul,E1,E2}) ->
    F({mul,simp(F,E1),simp(F,E2)});
simp(_F,E) -> E.

