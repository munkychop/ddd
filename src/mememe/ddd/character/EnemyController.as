package mememe.ddd.character {
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
		
		private var _enemies:Dictionary = new Dictionary();
		
		public function EnemyController(hero:Hero, gameArea:Rectangle){
			_hero = hero;
			_gameArea = gameArea;
			
			startWave(1);
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
		}
		
		private function levelStopped(vo){
			//vo.difficulty;
		}
		
		private function startWave(level:int){
			var spawnPoints:Dictionary = new Dictionary();
			
			//offset so characters start off screen
			var enemOffsetX = 200;
			var enemOffsetY = 100;
			
			//top left
			spawnPoints[Array] = new Point(-enemOffsetX, enemOffsetY);
			
			//top right
			spawnPoints[Array] = new Point(_gameArea.width + enemOffsetX, -enemOffsetY);
			
			//bottom left
			spawnPoints[Array] = new Point(-enemOffsetX, _gameArea.height - enemOffsetY);
			
			//bottom right
			spawnPoints[Array] = new Point(_gameArea.width + enemOffsetX, _gameArea.height - enemOffsetY);
			
			createEnemy(spawnPoints[Math.round((Math.random() * spawnPoints.length))]);
		}
		
		public function createEnemy(spawnPoint:Array){
			var enem = new Enemy(_hero);
			//enem.x = spawnPoint.x;
			//enem.y = spawnPoint.y;
			//_enemies[Enemy] = enem;
			//addChild(enem);
		}
		
		//_enemyController = new EnemyController(dino, gameArea);
		//	addChild(_enemyController);
		
		public function tick(){
			moveEnemies();
		}
		
		private var enemy:Enemy; 
		
		private function moveEnemies(){
			for each (var enemy: Enemy in _enemies){
				trace(enemy.movementSpeed);
			}
		}
	}
}
