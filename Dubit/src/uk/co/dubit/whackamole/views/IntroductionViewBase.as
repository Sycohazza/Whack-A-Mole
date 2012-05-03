package uk.co.dubit.whackamole.views
{
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.Label;
	

	import uk.co.dubit.whackamole.models.MainGame;
	import uk.co.dubit.whackamole.models.MoleHole;
	import uk.co.dubit.whackamole.framework.View;
	
	public class IntroductionViewBase extends View
	{		
		public var startButton:Button;
		public var easy:CheckBox;
		public var medium:CheckBox;
		public var hard:CheckBox;
		public var error:Label;
		
		protected function onStartButtonClick() : void
		{
			if(easy.selected || medium.selected || hard.selected){
				if(easy.selected){
					// difficulty
					MainGame.difficulty = 1;
					MainGame.EXTRA_TIME = 400;
					MoleHole.EXTRA_TIME = 200;
					//Skip straight to the main game
					controller.loadMainGame();
					
				}
				else if(medium.selected){
					//Skip straight to the main game
					// difficulty
					MainGame.difficulty = 2;
					MainGame.EXTRA_TIME = 200;
					MoleHole.EXTRA_TIME = 300;
					controller.loadMainGame();
				}
				else if(hard.selected){
					// difficulty
					MainGame.difficulty = 3;
					//Skip straight to the main game
					controller.loadMainGame();
				}
			}
			else {
				error.text = "Please select a difficulty!";
			}
		}
	}
}