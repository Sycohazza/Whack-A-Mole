package uk.co.dubit.whackamole.models.moles
{
	public class ZombieMole
	{
		public var points:int = 400;
		public var showtime:int = 1200;
		[Bindable] public var dead:Boolean;
		public var health : int = 3;
		
		public function hit() : void
		{
			if(health > 0){
				health -= 1;
			}
			if(health <= 0){
				dead = true;
			}
		}
	}
}