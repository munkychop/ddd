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
		private var _dino:Hero;
		private var _gameArea:Rectangle;
		
		
		// THIS IS THE FIRST LEVEL
		public function GamePlay() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			_gameArea = new Rectangle(300, 0, stage.stageWidth, stage.stageHeight-500);
			init();
		}
		
		private function init():void {
			_dino = new Hero();
			addChild(_dino);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			addEventListener(Event.ENTER_FRAME, onTickEvent);
		}
		
		private function onTickEvent(e:Event):void {
			if (_dino.x < _gameArea.left) {
				_dino.x = _gameArea.left;
			}
			if (_dino.y < _gameArea.top) {
				_dino.y = _gameArea.top;
			}
		}
		
		protected function onKey(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 37:
					// LEFT
					_dino.x -= 10;
					break;
				case 38:
					// UP
					_dino.y -= 10;
					break;
				case 39:
					// RIGHT
					_dino.x += 10;
					break;
				case 40:
					// DOWN
					_dino.y += 10;
					break;
				default:
					break;
			}
		}		
		
	}

}