package mememe.ddd
{
	/**
	 * @author munky
	 */
	import flash.utils.Dictionary;
	import starling.events.Event;
	import starling.display.Sprite;

	public class StarlingTicker extends Sprite
	{
		private var _callbackDictionary : Dictionary;
	
		public function StarlingTicker()
		{
		}
		
		private function onTick (event:Event):void
		{
			for each (var callback:Function in _callbackDictionary) callback ();
		}
		
		public function start ():void
		{
			this.addEventListener (Event.ENTER_FRAME, onTick);
		}
		
		public function stop ():void
		{
			this.removeEventListener (Event.ENTER_FRAME, onTick);
		}
		
		public function add (callback:Function):void
		{
			_callbackDictionary[callback] = callback;
		}
		
		public function remove (callback:Function):void
		{
			try
			{
				delete _callbackDictionary[callback];
			}
		}
	}

}
