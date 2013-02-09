package mememe.ddd.controls 
{
	import flash.display.Stage;
	import org.osflash.signals.Signal;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class KeyboardInput 
	{		
		public static var keypress:Signal;
		private static var _mysprite:Sprite = new Sprite();
		
		private static function onKey(e:KeyboardEvent):void {
			trace(e.keyCode);
			keypress.dispatch(e.keyCode);
		}
		
		public static function set mystage(value:Sprite):void 
		{
			_mysprite = value;
			trace(_mysprite)
			_mysprite.addEventListener(KeyboardEvent.KEY_DOWN, KeyboardInput.onKey);
			keypress = new Signal(uint);
		}
		
	}

}