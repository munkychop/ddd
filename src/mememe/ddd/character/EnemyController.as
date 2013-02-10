package mememe.ddd.character {
	import starling.display.DisplayObjectContainer;
	import mememe.ddd.vo.CharacterAttackVO;
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
	public class EnemyController extends Sprite
	{
		private static const TOTAL_ENEMIES_IN_WAVE : uint = 20;
		
		private var _hero:Hero;
		private var _ticker:StarlingTicker;
		private var _gameArea:Rectangle;
		
		private var _enemies : Vector.<Enemy> = new Vector.<Enemy>();
		private var _enemyCounter : uint;
		private var _spawnPoints : Vector.<Point>;
		private var _centrePoint : Point;
		private var _containerForEnemies : DisplayObjectContainer;
		
		public function EnemyController(hero:Hero, gameArea:Rectangle, containerForEnemies:DisplayObjectContainer){
			_hero = hero;
			_gameArea = gameArea;
			_containerForEnemies = containerForEnemies;
			_enemyCounter = 0;
			
			init ();
		}

		private function init () : void
		{
			startWave(1);
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			ApplicationSignals.heroAttackSignal.add(heroAttacked);
			
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
		}
		
		private function levelStopped(vo:EnemyDifficultyVO){
			//vo.difficulty;
		}  
		
		private function heroAttacked(vo:CharacterAttackVO):void
		{
			//check if it gets enemy
			trace('attacked');
			
			var enemy:Enemy;
			var attackAreaRect:Rectangle = vo.attackAreaRect;
			for each (enemy in _enemies)
			{
				if (attackAreaRect.intersects (enemy.enemySprite.bounds))
				{
					trace ("flame hitting enemy!!!");
					enemy.destroy ();
					_containerForEnemies.removeChild(enemy);
					
					_enemyCounter--;
				}		
			}
			
			if (_enemyCounter == 0)
			{
				ApplicationSignals.allCurrentEnemiesDefeatedSignal.dispatch ();
			}
		}
		
		private function startWave(level:int):void
		{			
			//offset so characters start off screen
			var enemOffsetX:int = 0;
			var enemOffsetY:int = 0;
			
			
			//the middle of screen
			
			_centrePoint = new Point (_gameArea.width >> 1, _gameArea.height >> 1);
			_spawnPoints = new Vector.<Point>(4);
			
			//top left
			_spawnPoints[0] = new Point (_gameArea.left, _gameArea.top);
			_spawnPoints[1] = new Point (_gameArea.left, _gameArea.bottom);
			_spawnPoints[2] = new Point (_gameArea.right, _gameArea.top);
			_spawnPoints[3] = new Point (_gameArea.right, _gameArea.bottom);
			
			
			var i:int = 0;
			var numSpawnPoints:uint = _spawnPoints.length;
			for(i; i < TOTAL_ENEMIES_IN_WAVE; i++)
			{
				createEnemy (_spawnPoints[Math.round((Math.random() * (numSpawnPoints - 1)))]);
			}
		}
		
		public function createEnemy (spawnPoint:Point):void
		{
			var enemy:Enemy = new Enemy (_hero);
			enemy.posX = spawnPoint.x;
			enemy.posY = spawnPoint.y;
			_enemies[_enemyCounter] = enemy;
			_containerForEnemies.addChild (enemy);
			
			_enemyCounter++;
		}
		
		public function tick ():void
		{
			var enemy:Enemy;
			for each (enemy in _enemies)
			{
				enemy.updateEnemy ();
			}
		}	
	}
}
