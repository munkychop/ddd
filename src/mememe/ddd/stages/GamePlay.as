package mememe.ddd.stages 
{
	import flash.geom.Rectangle;
	import mememe.ddd.character.Hero;
	import mememe.ddd.controls.KeyboardInput;
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
		//private var enemy:Enemy;
		
		
		// THIS IS THE FIRST LEVEL
		public function GamePlay() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			gameArea = new Rectangle(0, 500, stage.stageWidth, stage.stageHeight - 500);
			init();
		}
		
		private function init():void {
			KeyboardInput.mystage = this;
			dino = new Hero();
			//enemy = new Enemy();
			
			addChild(dino);
			//addChild(enemy);
			
			dino.x = int(0);
			dino.y = int(stage.stageHeight);
			//gameArea.bottom -= dino.height;
			addEventListener(Event.ENTER_FRAME, onTickEvent);
			
		}
		//switch(e.keyCode) {
				//case 37:
					// LEFT
					//dino.x -= 10;
					//break;
				//case 38:
					// UP
					//dino.y -= 10;
					//break;
				//case 39:
					// RIGHT
					//dino.x += 10;
					//break;
				//case 40:
					// DOWN
					//dino.y += 10;
					//break;
				//default:
					//break;
			//}
		
		private function onTickEvent(e:Event):void {
			//trace(dino.x, dino.y, gameArea.bottom);
			if (dino.x < gameArea.left) {
				dino.x = gameArea.left;
			}
			if (dino.y > gameArea.bottom) {
				dino.y = gameArea.top;
			}
		}
		
		
		
	}

}