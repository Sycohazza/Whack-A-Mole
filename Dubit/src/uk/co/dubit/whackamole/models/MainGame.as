package uk.co.dubit.whackamole.models
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.models.MoleHole;
	import uk.co.dubit.whackamole.models.moles.Mole;
	import uk.co.dubit.whackamole.models.moles.FireMole;
	import uk.co.dubit.whackamole.models.moles.ZombieMole;
	import uk.co.dubit.whackamole.views.MainGameViewBase;
	import uk.co.dubit.whackamole.views.MainGameOverViewBase;
	/**
	 * Contains all the logic for the game itself; controls
	 * the addition of moles, keeps track of the player's
	 * score
	 * 
	 **/
	public class MainGame extends Model
	{
		[Bindable]
		public var moleHoles:ArrayCollection = new ArrayCollection();

		[Bindable]
		protected var mainGameViewBase:MainGameViewBase;
		
		[Bindable]
		public var score:int = 0;
		
		[Bindable]
		public var normalKills:int = 0;
		[Bindable]
		public var fireKills:int = 0;
		[Bindable]
		public var zombieKills:int = 0;
		
		static public var difficulty : int;
		
		private var chooseMole : int;
		
		private var gameTimer:Timer;
		private var delayTimer:Timer;
		private const delayTime:int = 2000;
		private const GAME_TIMER_DELAY:int = 400;
		private const TOTAL_MOLES:int = 60;
		
		static public var EXTRA_TIME : int;
		
		
		public function MainGame()
		{
			//Set up the game timer; when it fires a new
			//mole is added

			gameTimer = new Timer(GAME_TIMER_DELAY + EXTRA_TIME, TOTAL_MOLES);
			gameTimer.addEventListener(TimerEvent.TIMER, onGameTimer);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onGameTimerComplete);
		}
		
		public function start() : void
		{
			//There are currently nine MoleHoles; create and
			//add them to the moleHoles ArrayCollection
			for(var i:int = 0; i < 9; i++)
			{
				var moleHole:MoleHole = new MoleHole();
				
				//A moleHole needs a reference to the game
				//so it can react appropriately to clicks
				moleHole.mainGame = this;
				moleHoles.addItem(moleHole);
			}
			
			gameTimer.start();
		}
		
		public function addScore(points:int) : void
		{
			score += points;
		}
			
		private function getFreeMoleHole() : MoleHole
		{
			//Pick a random hole until we find one without
			//an mole already in there
			var moleHole:MoleHole = null;
			
			while(moleHole == null || moleHole.mole)
			{
				moleHole = moleHoles[ Math.floor(Math.random() * moleHoles.length) ];
			}
			
			return moleHole;
		}
		
		private function onGameTimer(event:TimerEvent) : void
		{
			//Every time the timer fires, add a new mole
			var moleHole:MoleHole = getFreeMoleHole();
			
			chooseMole = Math.random()*101;
			
			if(chooseMole >= 1 && chooseMole <= 60){
				moleHole.populateMole(new Mole());
			}
			else if(chooseMole > 60 && chooseMole <= 85){
				moleHole.populateFireMole(new FireMole());
			}
			else {
				moleHole.populateZombieMole(new ZombieMole());
			}
			
		}
		
		private function onGameTimerComplete(event:TimerEvent) : void
		{
			Delay();
		}
		
		//give time for final moles to disapear.
		public function Delay() : void
		{
			delayTimer = new Timer(delayTime, 1);
			delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onDelayTimerComplete);
			delayTimer.start();
		}
		
		private function onDelayTimerComplete(event:TimerEvent) : void
		{
			MainGameOverViewBase.score = score;
			MainGameOverViewBase.normalKills = normalKills;
			MainGameOverViewBase.fireKills = fireKills;
			MainGameOverViewBase.zombieKills = zombieKills;
			controller.loadGameOver();
		}
	}
}