package mememe.ddd.stages 
{
	import flash.geom.Rectangle;
	import mememe.ddd.character.Hero;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public final class GamePlay extends Sprite 
	{		
		public var dino:Hero;
		private var gameArea:Rectangle;
		
		
		// THIS IS THE FIRST LEVEL
		public function GamePlay() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			gameArea = new Rectangle(0, 500, stage.stageWidth, stage.stageHeight - 500);
			init();
		}
		
		private function init():void {
			dino = new Hero();
			addChild(dino);
			dino.x = int(100);
			dino.y = int(stage.stageHeight);
			gameArea.bottom -= dino.height;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			addEventListener(Event.ENTER_FRAME, onTickEvent);
		}
		
		private function onTickEvent(e:Event):void {
			trace(dino.x, dino.y, gameArea.top);
			if (dino.x < gameArea.left) {
				dino.x = gameArea.left;
			}
			if (dino.y > gameArea.top) {
				dino.y = gameArea.top;
			}
		}
		
		protected function onKey(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 37:
					// LEFT
					dino.x -= 10;
					break;
				case 38:
					// UP
					dino.y -= 10;
					break;
				case 39:
					// RIGHT
					dino.x += 10;
					break;
				case 40:
					// DOWN
					dino.y += 10;
					break;
				default:
					break;
			}
		}		
		
	}

}