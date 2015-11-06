-module('5').

-compile(export_all).


start()->
    io:format("Enter username: ~n "),
    Username = hd(string:tokens(io:get_line("> "), "\r\n")),
    io:format("Enter password: ~n"),
     Password = hd(string:tokens(io:get_line("> "), "\r\n")),
    Credentials = readlines("auth.txt"),
    case auth([Username,Password],Credentials) of
        true ->
            io:format("Välkommen in i värmen! you entered the correct password combination ~n ");
        false ->
            io:format("Wrong password combination ~n")
                end.

auth([],[])->
    true;

auth([H|T], [X|Xs])->
    case string:tokens(X, "\r\n") of
        [] ->
            case H == X of
                true ->
                    auth(T,Xs);
                false ->
                    false
            end;
        Y -> 
            case H == hd(Y) of
                true ->
                    auth(T,Xs);
                false ->
                    false
            end
                end.


readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_lines(Device, []).

get_all_lines(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> file:close(Device), Accum;
        Line -> get_all_lines(Device, Accum ++ [Line])
    end.
