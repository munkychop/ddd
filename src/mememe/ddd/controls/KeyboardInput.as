package mememe.ddd.controls 
{
	import mememe.ddd.ApplicationSignals;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardInput 
	{
		private var _stage : Stage;
		public function KeyboardInput (stageForKeyboard:Stage)
		{
			_stage = stageForKeyboard;
			_stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		private function keyUpHandler(event : KeyboardEvent) : void
		{
			ApplicationSignals.keypressSignal.dispatch(event.keyCode);
		}
	}

}