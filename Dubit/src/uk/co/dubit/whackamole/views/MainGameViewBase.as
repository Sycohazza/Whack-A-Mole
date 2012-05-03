package uk.co.dubit.whackamole.views
{
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.effects.Sequence;
	import mx.events.FlexEvent;
	import mx.states.*;
	import mx.utils.OnDemandEventDispatcher;
	
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.DataGroup;
	import spark.components.Label;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.framework.View;
	import uk.co.dubit.whackamole.models.MainGame;
	import uk.co.dubit.whackamole.views.MainGameView;
	
	public class MainGameViewBase extends View
	{
		
		public var startAnimation:Sequence;
		
		[Bindable]
		protected var moleHoles:ArrayCollection;
		
		[Bindable]
		static public var Apprentice:CheckBox;
		[Bindable]
		static public var Master:CheckBox;
		[Bindable]
		static public var Massacre:CheckBox;
		[Bindable]
		static public var Apocolyptica:CheckBox;
		[Bindable]
		static public var Fireman:CheckBox;
		[Bindable]
		static public var Soft:CheckBox;
		
		public var Play:Button;

		[Bindable]
		protected var mainGame:MainGame;
		
		
		public function MainGameViewBase() 
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);

		}
		
		override public function set model(value:Model) : void
		{
			//Check as the model is set that it is suitable for
			//this view, and cast it as mainGame for the view
			//to bind to
			super.model = value;
			mainGame = value as MainGame;
			if(!mainGame) throw new Error("Non MainGameModel passed to MainGameView");
			
			moleHoles = mainGame.moleHoles;
		}
		
		protected function onCreationComplete(event:FlexEvent) : void
		{
			startAnimation.play();
		}
		
		protected function startAnimationEnd() : void
		{
			mainGame.start();
		}
		
		protected function Play_clickHandler(event:MouseEvent):void
		{
			controller.loadMainGame();
		}
		
		protected function Menu_clickHandler(event:MouseEvent):void
		{
			controller.loadIntroduction();
			
		}
	}
}