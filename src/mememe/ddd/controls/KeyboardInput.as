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
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			ApplicationSignals.keyDownSignal.dispatch(e.keyCode);
		}

		private function keyUpHandler(e : KeyboardEvent) : void
		{
			ApplicationSignals.keyUpSignal.dispatch(e.keyCode);
		}
	}

}