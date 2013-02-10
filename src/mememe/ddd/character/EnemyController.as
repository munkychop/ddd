package mememe.ddd.character {
	import starling.events.Event;
	import starling.display.MovieClip;
	import mememe.ddd.vo.EnemyDifficultyVO;
	import mememe.ddd.ApplicationSignals;
	import flash.geom.Point;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.Ticker;
	import flash.geom.Rectangle;
	import starling.display.Stage;
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	/**
	 * @author deanwhitehouse
	 */
	public class EnemyController extends Sprite{
		private var _hero:Hero;
		private var _ticker:StarlingTicker;
		private var _gameArea:Rectangle;
		
		private var _leftCollisionBounds:Rectangle;
		private var _rightCollisionBounds:Rectangle;
		
		private var _enemies:Dictionary = new Dictionary();
		
		public function EnemyController(hero:Hero, gameArea:Rectangle){
			_hero = hero;
			_gameArea = gameArea;
			
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function levelStopped(vo:EnemyDifficultyVO){
			//vo.difficulty;
		}
		
		private function init(){
			startWave(1);
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			
			_leftCollisionBounds = new Rectangle(0, 0, _gameArea.width / 2, _gameArea.height);
			_rightCollisionBounds = new Rectangle(_gameArea.width / 2, 0, _gameArea.width / 2, _gameArea.height);
			
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
		}
		
		private function startWave(level:int){
			var spawnPoints:Array = new Array();
			
			//offset so characters start off screen
			var enemOffsetX:int = int(0);
			var enemOffsetY:int = int(0);
			
			
			//zero is the middle of screen
			var zeroPointX:int = _gameArea.width / 2;
			var zeroPointY:int = stage.stageHeight / 2;
			
			//top left
			spawnPoints[0] = new Array((-zeroPointX) - enemOffsetX, enemOffsetY);
			
			//top right
			spawnPoints[1] = new Array(zeroPointX + enemOffsetX, -enemOffsetY);
			
			//bottom left
			spawnPoints[2] = new Array((-zeroPointX) - enemOffsetX, zeroPointY - enemOffsetY);
			
			//bottom right
			spawnPoints[3] = new Array(zeroPointX + enemOffsetX, zeroPointY - enemOffsetY);
			
			for(var i = 0; i < 5; i++)
				createEnemy(spawnPoints[Math.round((Math.random() * 4))]);
		}
		
		public function createEnemy(spawnPoint:Array){
			var enem = new Enemy(_hero);
			enem.x = spawnPoint[0];
			enem.y = spawnPoint[1];
			_enemies[Enemy] = enem;
			addChild(enem);
		}
		
		//_enemyController = new EnemyController(dino, gameArea);
		//	addChild(_enemyController);
		
		public function tick(){
			moveEnemies();
		}
		
		private var enemy:Enemy; 
		
		private function moveEnemies(){
			for each (var enemy: Enemy in _enemies){
				//trace(enemy.movementSpeed);
			}
		}
	}
}
