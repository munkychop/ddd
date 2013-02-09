package mememe.ddd {
	//import mememe.ddd.stages.GamePlay;
	import starling.display.Sprite;
	import starling.events.Event;

	public class DrugDealingDino extends Sprite
	{
		// MAIN STARLING CLASS. HERE ALL STARTS
		public function DrugDealingDino ()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			//test
			//gamePlay = new GamePlay();
			//this.addChild(gamePlay);
		}
	}
}
