%% ['5.pl'].
%% start.

:- use_module(library(pio)).
:- use_module(library(dcg/basics)).

credentials(Username, Password) --> string(Username), "\n", string(Password), "\n", eos.

start:-
    phrase_from_file(credentials(Username, Password), "auth.txt"),
    format("Enter username: ~n"),
    read(Username),
    format("Enter password: ~n"),
    read(Password),
    format("Correct ~n").