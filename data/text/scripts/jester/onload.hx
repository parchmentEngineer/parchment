/*
This script is called when the episode continuesave.json file is loaded in Jester Reunion,
all it does is fixes some Deck variables that would otherwise get overwritten.

This script is set up in the Jester Episode "startgame" script, in episodes.csv. You can also
create an onsave script in the same way! This gives you a handy place to serialise episode
specific data, to make sure everything you need is included in the save file.
*/
var Deck = args[0];
var self = args[1];

Deck.lookahead = 0; 
Deck.sethandsize(4); 
Deck.drawlimit = 4;
Deck.deckbuilderstyle = true;