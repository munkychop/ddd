package mememe.ddd.controls 
{
	import flash.ui.Keyboard;
	import mememe.ddd.ApplicationSignals;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardInput 
	{
		private static var _stage : Stage;
		private static var _upKeyIsPressed:Boolean;
		private static var _downKeyIsPressed:Boolean;
		private static var _leftKeyIsPressed:Boolean;
		private static var _rightKeyIsPressed:Boolean;
		
		public static function init (stageForKeyboard:Stage):void
		{
			_stage = stageForKeyboard;
			_stage.addEventListener(KeyboardEvent.KEY_UP, KeyboardInput.keyUpHandler);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyboardInput.keyDownHandler);
		}
		
		private static function keyDownHandler(event:KeyboardEvent):void 
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					_upKeyIsPressed = true;
					break;
				case Keyboard.DOWN :
					_downKeyIsPressed = true;
					break;
				case Keyboard.LEFT :
					_leftKeyIsPressed = true;
					break;
				case Keyboard.RIGHT :
					_rightKeyIsPressed = true;
					break;
			}
		}

		private static function keyUpHandler(event:KeyboardEvent) : void
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					_upKeyIsPressed = false;
					break;
				case Keyboard.DOWN :
					_downKeyIsPressed = false;
					break;
				case Keyboard.LEFT :
					_leftKeyIsPressed = false;
					break;
				case Keyboard.RIGHT :
					_rightKeyIsPressed = false;
					break;
			}
		}

		static public function get upKeyIsPressed() : Boolean {
			return _upKeyIsPressed;
		}

		static public function get downKeyIsPressed() : Boolean {
			return _downKeyIsPressed;
		}

		static public function get leftKeyIsPressed() : Boolean {
			return _leftKeyIsPressed;
		}

		public static function get rightKeyIsPressed() : Boolean {
			return _rightKeyIsPressed;
		}

		public static function set rightKeyIsPressed(rightKeyIsPressed : Boolean) : void {
			_rightKeyIsPressed = rightKeyIsPressed;
		}
	}

}