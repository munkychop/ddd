package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);	
			var da:Sprite = new Sprite();
			with (da) {
				graphics.beginFill(0x000111)
				graphics.drawRect(10, 10, 100, 100);
				graphics.endFill();
			}
			addChild(da);
			trace(Capabilities.version);
		}
		
	}
	
}