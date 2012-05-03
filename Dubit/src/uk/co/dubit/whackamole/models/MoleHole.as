package uk.co.dubit.whackamole.models
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.models.moles.FireMole;
	import uk.co.dubit.whackamole.models.moles.Mole;
	import uk.co.dubit.whackamole.models.moles.ZombieMole;
	import uk.co.dubit.whackamole.models.MainGame;
	
	/**
	 * Models a hole which may or may not
	 * be filled by a mole. It's empty if
	 * the mole property is null.
	 *  
	 **/
	public class MoleHole extends Model
	{
		[Bindable]
		public var mole:Mole;
		
		[Bindable]
		public var firemole:FireMole;
		
		[Bindable]
		public var zombiemole:ZombieMole;
		
		public var mainGame:MainGame;
		
		private var showTimer:Timer;

		static public var EXTRA_TIME : int = 0;
		
		public function MoleHole()
		{
			//This time controls the amount of time
			//a mole fills this hole for
			showTimer = new Timer(1000, 1);
			showTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onShowTimerComplete);
		}
		
		[Bindable]
		public function get occupantDead() : Boolean
		{
			return (mole && mole.dead && firemole && firemole.dead && zombiemole && zombiemole.dead); 
		}
	
		public function set occupantDead(value:Boolean) : void
		{
			if(mole) mole.dead = value; 
			if(firemole) firemole.dead = value; 
			if(zombiemole) zombiemole.dead = value; 
		}
		
		public function populateMole(mole:Mole) : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			
			this.mole = mole;
			
			showTimer.reset();
			showTimer.delay = mole.showtime + EXTRA_TIME;
			showTimer.start();
		}
		
		public function populateFireMole(firemole:FireMole) : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			
			this.firemole = firemole;
			
			showTimer.reset();
			showTimer.delay = firemole.showtime + EXTRA_TIME;
			showTimer.start();
		}
		
		public function populateZombieMole(zombiemole:ZombieMole) : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			
			this.zombiemole = zombiemole;
			
			showTimer.reset();
			showTimer.delay = zombiemole.showtime + EXTRA_TIME;
			showTimer.start();
		}
		
		
		
		public function hit() : void
		{
			if(zombiemole && !zombiemole.dead)
			{
				//Whack the mole, and if it results in a
				//kill, rack up the score
				zombiemole.hit();
				if(zombiemole.dead){
					mainGame.addScore(zombiemole.points);
					mainGame.zombieKills ++;
				}
			}
			
			if(firemole && !firemole.dead)
			{
				//Whack the mole, and if it results in a
				//kill, rack up the score
				firemole.hit();
				if(firemole.dead){
					mainGame.addScore(firemole.points);
					mainGame.fireKills ++;
				}
			}
			
			if(mole && !mole.dead)
			{
				//Whack the mole, and if it results in a
				//kill, rack up the score
				mole.hit();
				if(mole.dead){
					mainGame.addScore(mole.points);
					mainGame.normalKills ++;
				}
			}
		}
		
		private function onShowTimerComplete(event:TimerEvent) : void
		{
			//Empty the hole
			mole = null;
			firemole = null;
			zombiemole = null;
		}
	}
}