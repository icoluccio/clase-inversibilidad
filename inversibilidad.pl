
video(unTitulo, unUsuario, 15, 2020).
video(otroTitulo, otroUsuario, 45, 2022).

tema(unTitulo, politica).
tema(otroTitulo, animales).
tema(otroTitulo, otroTema).

likes(unTitulo, []).
likes(otroTitulo, [unUsuario, otroUsuario]).
likes(otroTitulo2, [otroUsuario]).

followers(unUsuario, 100).
followers(otroUsuario, 200000000).

publicidad(politica).
siempreDeModa(gatos).
controversial(politica).
controversial(religion).


deModa(Tema, Anio) :-
  video(Titulo, Usuario, _, Anio),
  tema(Titulo, Tema),
  influencer(Usuario).

deModa(Tema, Anio) :-
  video(_, _, _, Anio),
  siempreDeModa(Tema).

influencer(Usuario) :-
  followers(Usuario, Seguidores),
  Seguidores > 1000000.


potencialViral(Titulo, Potencial) :-
  video(Titulo, Usuario, Duracion, _),
  followers(Usuario, Seguidores),
  Potencial is 100 + (Seguidores / Duracion).



deModa2(Tema, Anio) :-
  video(Titulo, _, _, Anio),
  tema(Titulo, Tema),
  not(controversial(Tema)),
  influencer(usuario).


potencialViral2(Titulo, Seguidores) :-
  video(Titulo, Usuario, _, _),
  followers(Usuario, Seguidores).

familiar(Tema) :-
     tema(_, Tema),
    not(controversial(Tema)).

dineroMinimo(Titulo, DineroMinimo):-
    video(Titulo, _, Duracion, _),
    tema(Titulo, Tema),
    publicidad(Tema),
    DineroMinimo is Duracion * 200.

dineroMinimo(Titulo, 0):-
    video(Titulo, _, _, _),
    tema(Titulo, Tema),
    not(publicidad(Tema)).

cantidadDeLikes(Titulo, Cantidad):-
  likes(Titulo, Likes),
  length(Likes, Cantidad).

videoConMasLikes(Titulo, CuantosLikes) :-
  cantidadDeLikes(Titulo, CuantosLikes),
  not((cantidadDeLikes(_, Cantidad2), Cantidad2 > CuantosLikes)).


likeDeInfluencer(Titulo) :-
  likes(Titulo, Likes),
  member(Usuario, Likes),
  influencer(Usuario).
  
soloLikesDeInfluencer(Titulo) :-
  likes(Titulo, Likes),
  not(
    (member(Usuario, Likes), not(influencer(Usuario)))
  ).
  
primerLikeDeUsuario(Titulo) :-
  likes(Titulo, Likes),
  video(Titulo, Usuario, _, _),
  nth1(1, Likes, Usuario). 
  










