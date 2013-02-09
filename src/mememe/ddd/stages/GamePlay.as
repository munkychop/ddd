package mememe.ddd.stages 
{
	import starling.display.Stage;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public final class GamePlay extends Stage 
	{
		private var _hero:Hero;
		
		// THIS IS THE FIRST LEVEL
		public function GamePlay() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			_hero:Hero = new Hero();
			addChild(_hero);
		}
		
	}

}