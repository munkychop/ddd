package mememe.ddd 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import mememe.ddd.DrugDealingDino;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	[SWF(width="800", height="600", frameRate="60", backgroundColor="#CCCCCC")]
	public class Main extends Sprite 
	{
		private var screenInGame:DrugDealingDino;
		private var myStarling:Starling;
		
		public function Main():void 
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			myStarling = new Starling(DrugDealingDino, stage);
			
			myStarling.antiAliasing = 1;
			
			myStarling.showStats = true;
			
			myStarling.showStatsAt("left", "top");
			
			myStarling.start();
		}
		
	}
}