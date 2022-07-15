//Controls for Jester Reunion episode
var fighter = args[0];
var equipment = args[1];

//We just need to make sure that the Jester always has one dice, so let's check for unassigned dice
var totaldice = 0;
for(d in self.dicepool){
  if(d.available()) totaldice++;
}

var dicediff = (fighter.dice + fighter.bonusdice) - totaldice;

if(dicediff > 0){
  var goldendice = false;
  if(fighter.hasstatus("goldendice")){
    goldendice = true;
  }

  var lastdicewasblind = 0;
  if(equipment != null){
    if(equipment.assigneddice != null){
      if(equipment.assigneddice.length > 0){
        for (i in 0 ... equipment.assigneddice.length){
          if (equipment.assigneddice[i] != null){
            if (equipment.assigneddice[i].blind) lastdicewasblind++;
          }
        }
      }
    }
  }

  var dicearray = [];
  for(i in 0 ... dicediff){
    if(goldendice){
      dicearray.push(pick([2]));
    }else{
      dicearray.push(pick([1,2]));
    }
  }
  
  var actualdice = givedice(dicearray);

  if(lastdicewasblind > 0){
    for(d in actualdice){
      if(lastdicewasblind > 0){
        d.blind = true;
        lastdicewasblind--;
      }
    }
  }
}