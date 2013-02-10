package mememe.ddd.stages 
{
	import mememe.ddd.Ticker;
	import flash.geom.Rectangle;
	import mememe.ddd.character.EnemyController;
	import mememe.ddd.character.Hero;
	import mememe.ddd.controls.KeyboardInput;
	import mememe.ddd.DDDConstants;
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
		public var hero:Hero;
		private var gameArea:Rectangle;
		private var bg:GameBackground;		
		private var _enemyController:EnemyController;
		
		// THIS IS THE LEVEL CREATOR
		public function GamePlay(_levelID:uint = 1) 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			gameArea = new Rectangle(0, DDDConstants.UNAVAILABLITY_AREA, stage.stageWidth, stage.stageHeight - DDDConstants.UNAVAILABLITY_AREA);
			init();
		}
		
		private function init():void {
			
			hero = new Hero();
			bg = new GameBackground(hero);
			
			// add bg first so it is at the back.
			addChild(bg);						
			
			_enemyController = new EnemyController(hero, gameArea, this);
			
			// add hero last so he is on top ;)
			addChild(hero);
			

			
			hero.x = hero.width * 2;
			hero.y = int(stage.stageHeight);
			Ticker.getInstance ().add (tick);
		}
		
		private function tick ():void
		{
			// WON'T FALL OFF THE STAGE TEST
			if ((hero.x - (hero.width / 2)) < gameArea.left) {
				hero.x = gameArea.left + hero.width / 2;
			}
			else if ((hero.x + (hero.width / 2)) > gameArea.right) {
				hero.x = gameArea.right - (hero.width / 2);
			}
			
			if (hero.y > gameArea.bottom) {
				hero.y = gameArea.bottom;
			} else if (hero.y < gameArea.top) {
				hero.y = gameArea.top;
			}
		}
	}

}