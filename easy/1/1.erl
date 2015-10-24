% compile with c('1.erl').
% run with '1':start().

-module('1').

-compile(export_all).


start() ->
    Name =hd(string:tokens(io:get_line("What is your Name? "),"\r\n")),
    Age = hd(string:tokens(io:get_line("What is your Age? "),"\r\n")),
    User =hd(string:tokens(io:get_line("What is your reddit username? "),"\r\n")),
    io:format("your name is ~s, you are ~s years old, and your username is ~s ~n", [Name,Age,User]).
    
