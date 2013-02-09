package mememe.ddd.stages 
{
	import flash.geom.Rectangle;
	import mememe.ddd.character.Hero;
	import mememe.ddd.controls.KeyboardInput;
	import mememe.ddd.graphics.GameBackground;
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
		static public const UNAVAILABLITY_AREA:uint = 550;
		private var gameArea:Rectangle;
		private var bg:GameBackground;		
		
		// THIS IS THE FIRST LEVEL
		public function GamePlay() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			gameArea = new Rectangle(0, UNAVAILABLITY_AREA, stage.stageWidth, stage.stageHeight - UNAVAILABLITY_AREA);
			init();
		}
		
		private function init():void {
			bg = new GameBackground();
			addChild(bg);
			
			dino = new Hero();			
			addChild(dino);
			
			dino.x = int(0);
			dino.y = int(stage.stageHeight);
			addEventListener(Event.ENTER_FRAME, onTickEvent);			
		}
		
		private function onTickEvent(e:Event):void {
			if (dino.x < gameArea.left) {
				dino.x = gameArea.left;
			} else if (dino.x > gameArea.right) {
				dino.x = gameArea.right;
			}
			if (dino.y > gameArea.bottom) {
				dino.y = gameArea.bottom;
			} else if (dino.y < gameArea.top) {
				dino.y = gameArea.top;
			}
		}
		
		
		
	}

}