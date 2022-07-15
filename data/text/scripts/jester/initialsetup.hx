//Set up the Jester's card rewards
var Rules = args[0];

function has(cardname){
  var cardlist = Deck.getcardlist("all");
  if(cardlist.indexOf(cardname) != -1 || cardlist.indexOf(cardname + "+") != -1){
    return true;
  }
  return false;
}

function synergy(tier0,tier1,tier2,tier3) {
	if(has(tier0)) {
		Rules.substitute("Tier 1 Synergy",tier1);
		Rules.substitute("Tier 2 Synergy",tier2);
		Rules.substitute("Tier 3 Synergy",tier3);
	}
}



var tier1clue = shuffle([
	"Seeker's Map",
	"Metal Engraving"
]);

var tier1standard = shuffle([
	"Tradewinds"
]);


synergy(
	"Oar",
	"Paddle Toss",
	"Scull Boat",
	"Weaken 3"
);


Rules.substitute("Tier 1 Clue",tier1clue.pop());
Rules.substitute("Tier 1 Standard",tier1standard.pop());