package mememe.ddd.stages 
{
	import flash.events.Event;
	import starling.display.Stage;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Hero extends Stage 
	{
		
		public function Hero() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
	}

}