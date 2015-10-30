% compile: ['2.pl']
% start with: start.


%Alphabetic caesar cipher: left shift with 5.  (Only alphabetic chars: ASCII 65-122)

encrypt([],[]).

encrypt([X|Xs],[Y|Ys]):-
    X < 70,
    Y is (123 - (5-(X - 65))),
    encrypt(Xs,Ys).

encrypt([X|Xs],[Y|Ys]):-
    X >= 70,
    Y is X - 5,
    encrypt(Xs,Ys).

decrypt([],[]).

decrypt([X|Xs],[Y|Ys]):-
    X > 117,
    Y is (64 + (5-(122 - X))),
    decrypt(Xs,Ys).

decrypt([X|Xs],[Y|Ys]):-
    X =< 117,
    Y is X + 5,
    decrypt(Xs,Ys).
    
    
    

%% Second version. Only shift within string. Right shift with 5.

encrypt_2(List,Res):-
    encrypt_2(List,Res,List).

encrypt_2([],[],_).

encrypt_2([X|Xs],[Y|Ys],List):-
    get_elem([X|Xs],5,0,List,Y),
    encrypt_2(Xs,Ys,List).


get_elem([X|Xs],N,I,List,E):-
    I < N,
    I1 is I + 1,
    get_elem(Xs,N,I1,List,E).

get_elem([],N,I,List,E):-
    get_elem(List,N,I,List,E).

get_elem([X|Xs],N,N,List,X).


decrypt_2(List,Res):-
    reverse(List,Rev),
    encrypt_2(List,RevRes,Rev),
    reverse(RevRes,Res).
