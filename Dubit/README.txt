I have never used Flash Builder or ActionScript more than stop and start timeline cantrol in Flash. I really enjoyed doing this challenge, i wish i had more time to learn how to add sound to the game.




1. Add a game over/scores screen

This should appear after the game is over and the moles have stopped appearing. It should contain text telling the player the game is over and a label displaying the player's score.

It should also include a button labelled 'Play again' that will start a new game for the player



Your comments:
I did that part last, it took the longest of 2 days. This was due to the fact i was attempting to do this by changing a the state in ActionScript. As far as i know this cant actually be done.




2. Add difficulty levels

Modify the Introduction screen to allow the user to choose one of three difficulty levels: easy, medium and hard. Make the main game easier or more difficult based on the user's choice. The difficulty level should modify both the rate at which the moles appear and the time they spend on screen before disappearing.



Your comments:
the way i did this was by having a extra time variable in MoleHole and MainGame and when you click start on the intro page it assigns an integer. Easy with the lowest integer and Hard with the highest integer. I also added a error message if you dont choose a difficulty when clicking start.




3. Add new types of mole

Currently there is only one type of mole that uses the standard_mole.png asset. Create two more types of mole with the following properties:

Fire Mole
  Points awarded for killing: 100
  Time showing on screen (ms): 1800
  Asset to use: fire_mole.png
  Number of clicks required to kill: 2

Zombie Mole
  Points awarded for killing: 400
  Time showing on screen (ms): 1200
  Asset to use: zombie_mole.png
  Number of clicks required to kill: 3

When spawning a new mole, have a 60% chance of creating a standard mole, a 25% chance of creating a fire mole, and a 15% chance of creating a zombie mole.



Your comments:
This wasnt too difficult i could copy your code and tweek it, then i ad to add the #% chance of spawning which is the same in JavaScript so i knew it




4. Build in achievements/awards

This task requires creating a feature from scratch, and as such it gives you the most freedom to decide how to accomplish it.

Acheivements have become a standard feature of games over the past few years. They are awarded to the player when they meet a certain set of criteria. For example, the user might be awarded an achievement for breaking a score threshold for the first time. Add the following acheivements into the game, and have them appear in the section titled 'Achievements' to the right of the main game area:


Achievement name: Apprentice
Criteria required: Kill over 15 moles during a single game

Achievement name: Master
Criteria required: Kill more than 40 zombie moles in a single game

Achievement name: Mole massacre
Criteria required: Kill over 55 moles during a game

Achievement name: Fireman
Criteria required: Kill more than 10 fire moles in a single game

Achievement name: Apocolyptica
Criteria required: Kill more than 5 zombie moles in a game

Achievement name: Soft touch
Criteria required: Miss more than 30 moles during a game



Your comments:
i put this function at the end of the gameTimer because i dont know of and default function that gets called every frame or late frame like in JavaScript. Also i dont know if this is a mistake but your acheievement Master is to kill 40 zombies but you have also said give zombies a 15% chance of spawning. With 60 moles per game 15% of 60 is 9, you would need to be extremely lucky to ever get this achievement




Thanks for your interest, and once again - good luck!