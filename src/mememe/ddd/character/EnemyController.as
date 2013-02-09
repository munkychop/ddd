package mememe.ddd.character {
	import flash.geom.Rectangle;
	import starling.display.Stage;
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	/**
	 * @author deanwhitehouse
	 */
	public class EnemyController extends Sprite{
		private var _hero:Hero;
		private var _gameArea:Rectangle;
		
		private var _enemies:Dictionary = new Dictionary();
		
		public function EnemyController(hero:Hero, gameArea:Rectangle){
			_hero = hero;
			_gameArea = gameArea;
			
			startWave(1);
		}
		
		private function startWave(level:int){
			var spawnPoints:Dictionary = new Dictionary();
			
			//offset so characters start off screen
			var enemOffsetX = 200;
			var enemOffsetY = 100;
			
			//top left
			spawnPoints[Array] = new Array(-enemOffsetX, enemOffsetY);
			
			//top right
			spawnPoints[Array] = new Array(_gameArea.width + enemOffsetX, -enemOffsetY);
			
			//bottom left
			spawnPoints[Array] = new Array(-enemOffsetX, _gameArea.height - enemOffsetY);
			
			//bottom right
			spawnPoints[Array] = new Array(_gameArea.width + enemOffsetX, _gameArea.height - enemOffsetY);
			
			createEnemy(spawnPoints[Math.round((Math.random() * spawnPoints.length))]);
		}
		
		public function createEnemy(spawnPoint:Array){
			var enem = new Enemy(_hero);
			//enem.x = spawnPoint[0];
			//enem.y = spawnPoint[1];
			//_enemies[Enemy] = enem;
			//addChild(enem);
		}
		
		public function tick(){
			moveEnemies();
		}
		
		private function moveEnemies(){
			for each (var enemy: Enemy in _enemies) {
				trace(enemy.movementSpeed);
			}
		}
	}
}
