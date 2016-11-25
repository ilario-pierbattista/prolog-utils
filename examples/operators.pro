/*
 * Esercizi in aula: 12/10/2016
 */

% Si vuole scrivere:
% "aldo suona chitarra e tastiera"
% Bisogna definire gli operatori "suona" e "e"

% Operatore non associativo
:- op(400, xfx, 'suona').
% Operatore associativo a destra
:- op(300, xfy,	'e').

aldo suona chitarra e tastiera.
ugo suona chitarra e basso e tastiera.
