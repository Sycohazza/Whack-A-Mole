package uk.co.dubit.whackamole.views
{
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.effects.Sequence;
	import mx.events.FlexEvent;
	import mx.utils.OnDemandEventDispatcher;
	
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.DataGroup;
	import spark.components.Label;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.framework.View;
	import uk.co.dubit.whackamole.models.MainGame;
	import uk.co.dubit.whackamole.views.MainGameView;
	
	public class MainGameOverViewBase extends View
	{
		[Bindable]
		static public var score:int = 0;
		
		[Bindable]
		static public var normalKills:int = 0;
		[Bindable]
		static public var fireKills:int = 0;
		[Bindable]
		static public var zombieKills:int = 0;
		
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
		
		
		public function MainGameOverViewBase() 
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);

		}
		
		protected function onCreationComplete(event:FlexEvent) : void
		{
			if(normalKills + fireKills + zombieKills >= 15){
				Apprentice.selected = true;
			}
			if(zombieKills >= 40){
				Master.selected = true;
			}
			if(normalKills + fireKills + zombieKills >= 40){
				Massacre.selected = true;
			}
			if(fireKills > 10){
				Fireman.selected = true;
			}
			if(zombieKills > 5){
				Apocolyptica.selected = true;
			}
			if(60 - (normalKills + fireKills + zombieKills) >= 30){
				Soft.selected = true;
			}
		}
		
		
		protected function onPlayButtonClick() : void
		{
			Apprentice.selected = false;
			Master.selected = false;
			Massacre.selected = false;
			Fireman.selected = false;
			Apocolyptica.selected = false;
			Soft.selected = false;	
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