package mememe.ddd.controls 
{
	import flash.utils.Dictionary;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardInput 
	{
		private static var _stage : Stage;
		private static var _upKeyStateVO:KeyStateVO;
		private static var _downKeyStateVO:KeyStateVO;
		private static var _leftKeyStateVO:KeyStateVO;
		private static var _rightKeyStateVO:KeyStateVO;
		private static var _spaceBarStateVO:KeyStateVO;
		private static var _allKeyStatesVector:Vector.<KeyStateVO>;
		
		public static function init (stageForKeyboard:Stage):void
		{
			_upKeyStateVO = new KeyStateVO (Keyboard.UP);
			_downKeyStateVO = new KeyStateVO (Keyboard.DOWN);
			_leftKeyStateVO = new KeyStateVO (Keyboard.LEFT);
			_rightKeyStateVO = new KeyStateVO (Keyboard.RIGHT);
			_spaceBarStateVO = new KeyStateVO (Keyboard.SPACE);
			
			_allKeyStatesVector = new Vector.<KeyStateVO>();
			_allKeyStatesVector.push (_upKeyStateVO, _downKeyStateVO, _leftKeyStateVO, _rightKeyStateVO, _spaceBarStateVO);
			
			_stage = stageForKeyboard;
			_stage.addEventListener(KeyboardEvent.KEY_UP, KeyboardInput.keyUpHandler);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyboardInput.keyDownHandler);
		}
		
		private static function keyDownHandler(event:KeyboardEvent):void 
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					_upKeyStateVO.pressed = true;
					break;
				case Keyboard.DOWN :
					_downKeyStateVO.pressed = true;
					break;
				case Keyboard.LEFT :
					_leftKeyStateVO.pressed = true;
					break;
				case Keyboard.RIGHT :
					_rightKeyStateVO.pressed = true;
					break;
				case Keyboard.SPACE :
					_spaceBarStateVO.pressed = true;
					break;
			}
		}

		private static function keyUpHandler(event:KeyboardEvent) : void
		{			
			switch (event.keyCode)
			{
				case Keyboard.UP :
					_upKeyStateVO.pressed = false;
					break;
				case Keyboard.DOWN :
					_downKeyStateVO.pressed = false;
					break;
				case Keyboard.LEFT :
					_leftKeyStateVO.pressed = false;
					break;
				case Keyboard.RIGHT :
					_rightKeyStateVO.pressed = false;
					break;
				case Keyboard.SPACE :
					_spaceBarStateVO.pressed = false;
					break;
			}
			
		}

		static public function get upKeyIsPressed() : Boolean {
			return _upKeyStateVO.pressed;
		}

		static public function get downKeyIsPressed() : Boolean {
			return _downKeyStateVO.pressed;
		}

		static public function get leftKeyIsPressed() : Boolean {
			return _leftKeyStateVO.pressed;
		}

		public static function get rightKeyIsPressed() : Boolean {
			return _rightKeyStateVO.pressed;
		}
		
		static public function get spaceBarIsPressed():Boolean 
		{
			return _spaceBarStateVO.pressed;
		}

		static public function get allKeysReleased() : Boolean
		{
			var keyStateVO:KeyStateVO;
			for each (keyStateVO in _allKeyStatesVector)
			{
				if (keyStateVO.pressed) return false;
			}
			
			return true;
		}
	}
}

internal class KeyStateVO
{
	private var _keyCode:uint;
	private var _pressed:Boolean;
	
	public function KeyStateVO (keyCode:uint)
	{
		_keyCode = keyCode;
	}

	public function get pressed() : Boolean {
		return _pressed;
	}

	public function set pressed(pressed : Boolean) : void {
		_pressed = pressed;
	}
}