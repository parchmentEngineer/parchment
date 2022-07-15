usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var reunionlocations = ['REALITYTV', 'SURVIVOR', 'BEACHHOUSE'];
reunionlocations = shuffle(reunionlocations);
var location1 = reunionlocations.pop();
var location2 = reunionlocations.pop();

var reunioncombatmusic = ['music_reunioncombat1', 'music_reunioncombat2', 'music_reunioncombat3', 'music_reunioncombat4'];
reunioncombatmusic = shuffle(reunioncombatmusic);
var music1 = reunioncombatmusic.pop();
var music2 = reunioncombatmusic.pop();

var reunionbossmusic = ['music_reunionboss1', 'music_reunionboss2'];
reunionbossmusic = shuffle(reunionbossmusic);
var bossmusic = reunionbossmusic.pop();

var piggybank = "Piggy Bank";  //Piggy Bank is too early actually, nevermind
var collateral = "Collateral";
var insidertrading = "Insider Trading";
var indexfund = "Index Fund";
var trustfund = "Trust Fund";
var nesteggitem = shuffle([collateral, insidertrading, indexfund, trustfund]).pop();

if(nesteggitem == piggybank){
  piggybank = "Nest Egg@PiggyBank2";
}else if(nesteggitem == collateral){
  collateral = "Nest Egg@Collateral2";
}else if(nesteggitem == insidertrading){
  insidertrading = "Nest Egg@InsiderTrading2";
}else if(nesteggitem == indexfund){
  indexfund = "Nest Egg@IndexFund2";
}else if(nesteggitem == trustfund){
  trustfund = "Nest Egg@TrustFund2";
}

////////////////////////////////
// 1x Floor 1 Good Item
var floor1item = shuffle([
	"Coin Toss",
	
	"Toss Up",
	"Asset Freeze"
]);

////////////////////////////////
// 1x Floor 2 Shop
var burnrateorcoldhardcash = shuffle([
	"Cold Hard Cash",
	"Burn Rate",
	
	"Lightning Capital"
]);

////////////////////////////////
// 1x Floor 2 Good Item
// 1x Floor 3 Good Item
var goldcoin = shuffle([
	"Live Wire",
	"Kickback",
	"Market Crash",
	pick(["Tax Evasion", "Capital Gains", "Hostile Takeover"]),
	
	"Goldeneye",
	"Margin Economics",
	"Bank Account",
	"Startup Venture",
	"Last in Stock"
]);

////////////////////////////////
// 1x Floor 2 Item
// 1x Floor 3 Shop
var commonlist_basic = shuffle([
	"Credit Crunch",
	"Heads Up",
	"Bungee Cord",
	piggybank,
	"Insurance Policy",
	
	"Tail Whip",
	"Deductable",
	"Subsidy",
	"Delayed Income"
]);

////////////////////////////////
// 1x Floor 2 Shop
// 2x Floor 3 Shop
// 1x Floor 4 Good Item
// 1x Floor 5 Good Item
var commonlist_advanced = shuffle([
	pick(["Private Healthcare", "Mercenary Shield"]),
	"Spiky Shield",	
	insidertrading,
	"Mechanical Arm@coin",
	"Hedge Fund",
	"Force of Nature",
	"Boolean Operator",
	indexfund,
	
	"Pawn Shop",
	"Defraud",
	"Pump and Dump",
	"Buy Low",
	"Limited Time Offer",
	"Long Term Contract"
]);

////////////////////////////////
// 1x Floor 4 Trade
// 2x Floor 5 Shop
var commonlist_endstage = shuffle([
	"Acquisition",
	"Toxic Asset",
	"Hollywood Accounting",
	"Boom and Bust",
	trustfund,
	
	"Speculation",
	"Macroeconomics",
	"Elastic Market"
]);
shuffle(commonlist_basic);


//Floor 1:
items = [];
gooditems = [floor1item.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .setlocation(location1)
  .setmusic(music1)
  .generate();
  
//Floor 2:
commonlist_advanced.push("Savings Account");
commonlist_advanced.push("Hex@coin");
shuffle(commonlist_advanced);

items = [commonlist_basic.pop()];

gooditems = [goldcoin.pop()];
otherstuff = [health(), health()];
goodotherstuff = [
  shop(shuffle([commonlist_advanced.pop(), "Upgrade", burnrateorcoldhardcash.pop()]))
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .setlocation(location1)
  .setmusic(music1)
  .generate();
  
//Floor 3:
commonlist_basic.push("Spatula@coin");
shuffle(commonlist_basic);

commonlist_advanced.push("Bailout");
commonlist_advanced.push(collateral);
shuffle(commonlist_advanced);

items = [];
gooditems = [goldcoin.pop()];

otherstuff = [
  health(), 
  health()
];
goodotherstuff = [
//TO DO
  shop([commonlist_advanced.pop(), commonlist_basic.pop(), commonlist_advanced.pop()]), 
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .setlocation(location1)
  .setmusic(music1)
  .generate();
  
//Floor 4:
items = [];
gooditems = [pick([commonlist_advanced.pop(), commonlist_advanced.pop()])];

otherstuff = [health(), health()];
goodotherstuff = [
  trade(["any"], [commonlist_endstage.pop()])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .setlocation(location2)
  .setmusic(music2)
  .generate();
  
//Floor 5:
items = [];
gooditems = [commonlist_advanced.pop()];

otherstuff = [health(), health()];
goodotherstuff = [
  shop(shuffle(["health", commonlist_endstage.pop(), commonlist_endstage.pop()])), 
  upgrade()
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .setlocation(location2)
  .setmusic(music2)
  .generate();
  
//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

if (getfinalboss() == "Drake"){
  items.push("Garlic Bread");
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .setmusic(bossmusic)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();