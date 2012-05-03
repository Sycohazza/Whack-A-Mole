package uk.co.dubit.whackamole.models.moles
{
	public class FireMole
	{
		public var points:int = 100;
		public var showtime:int = 1800;
		[Bindable] public var dead:Boolean;
		public var health : int = 2;
		
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