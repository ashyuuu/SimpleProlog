my_length([], 0 ).
my_length([_|T],L) :- my_length(T,N) , L is N+1.

my_member(_,[]) :- false.
my_member(A, [A|_]) :- true.
my_member(A, [_|T]) :- my_member(A,T).

my_append([],L,L).
my_append([H|T],L,[H|NewT]) :- my_append(T,L,NewT).

my_reverse([],[]).
my_reverse([H],[H]).
my_reverse([H|T] , R) :- my_reverse(T , Temp) , my_append(Temp , [H] , R).

my_nth(L,1,L).
%my_nth(L,X,[]) :- my_length(L,Length), X > Length.
my_nth([_|T] , Index , L) :- my_nth(T , NewIndex , L) , Index is NewIndex+1.

my_remove(_,[],[]).
my_remove(H,[H|T],R) :- my_remove(H,T,R). 
my_remove(X,[H|T],[H|R]) :- H\=X, my_remove(X,T,R). 

my_subst(_,_,[],[]).
my_subst(B,A,[B|T],[A|R]) :- my_subst(B,A,T,R).
my_subst(B,A,[H|T],[H|R]) :- my_subst(B,A,T,R).

my_subset(atom, [], []).
my_subset(atom, [H|T], X) :- atom(H), X=[H|NewX], my_subset(atom, T, NewX); my_subset(atom, T, X).

my_add([A],[B],[Base]) :- (A + B) < 10, Base is A+B.
my_add([A],[B],[R|Base]):- R is mod(A+B,10), my_add([0],[1],Base).
my_add([H1,S1|T1],[H2|T2],[N|R]) :- N is mod(H1 + H2,10), Carry is floor((H1+H2)/10), Add is S1+Carry, my_add([Add|T1],T2,R).

my_merge([],A,A).
my_merge(A,[],A).
my_merge([H1|T1],[H2|T2],[X|R]) :- H1 < H2, X is H1, my_merge(T1,[H2|T2],R).
my_merge(L1,[H2|T2],[H2|R]) :- my_merge(L1,T2,R).

my_sublist([A], [A|_]).
my_sublist([A], [B|T]) :- A \== B, my_sublist([A], T).
my_sublist([A,B|T1], [A,C|T2]) :- B \== C, my_sublist([A,B|T1], T2).
my_sublist([A,B|T1], [A,B|T2]) :- my_sublist(T1, T2).
my_sublist([A|T1], [H|T2]) :- A \== H, my_sublist([A|T1], T2).

%my_assoc(_,[],false).
%my_assoc(_,[A],[A]) :- false.
my_assoc(K, [K,V|_], V).
my_assoc(K, [A,B|T], R) :- my_assoc(K, T, R).

my_replace([],L,L).
my_replace([A,B|T], [A|L],[B|R]) :- my_replace(T,L,R).
my_replace(T, [A|L],[A|R]) :- my_replace(T,L,R).