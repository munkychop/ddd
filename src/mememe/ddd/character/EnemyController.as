package mememe.ddd.character {
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
	public class EnemyController extends Sprite {
		private static const TOTAL_ENEMIES_IN_WAVE : uint = 1;
		
		private var _hero:Hero;
		private var _ticker:StarlingTicker;
		private var _gameArea:Rectangle;
		
		private var _leftCollisionBounds:Rectangle;
		private var _rightCollisionBounds:Rectangle;
		
		private var _enemies : Vector.<Enemy> = new Vector.<Enemy>();
		private var _enemyCounter : uint;
		private var _spawnPoints : Vector.<Point>;
		private var _centrePoint : Point;
		
		public function EnemyController(hero:Hero, gameArea:Rectangle){
			_hero = hero;
			_gameArea = gameArea;
			_enemyCounter = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}

		private function addedToStageHandler(event : Event) : void
		{
			startWave(1);
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			ApplicationSignals.heroAttackSignal.add(heroAttacked);
			
			_leftCollisionBounds = new Rectangle(0, 0, _gameArea.width / 2, _gameArea.height);
			_rightCollisionBounds = new Rectangle(_gameArea.width / 2, 0, _gameArea.width / 2, _gameArea.height);
			
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
		}
		
		private function levelStopped(vo:EnemyDifficultyVO){
			//vo.difficulty;
		}  
		
		private function heroAttacked(vo:CharacterAttackVO){
			//check if it gets enemy
			trace('attacked');
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
			_spawnPoints[0] = new Point (0, enemOffsetY);
			
			/*
			//top right
			_spawnPoints[1] = new Point (_gameArea.width, -enemOffsetY);
			
			//bottom left
			_spawnPoints[2] = new Point ((-_zeroPointX) - enemOffsetX, _zeroPointY - enemOffsetY);
			
			//bottom right
			_spawnPoints[3] = new Point (_zeroPointX + enemOffsetX, _zeroPointY - enemOffsetY);
			
			var i:int = 0;
			var numSpawnPoints:uint = _spawnPoints.length;
			for(i; i < TOTAL_ENEMIES_IN_WAVE; i++)
			{
				createEnemy (_spawnPoints[Math.round((Math.random() * (numSpawnPoints - 1)))]);
			}
			 * 
			 *
			 */
			 
			 createEnemy (new Point (600, 400));
		}
		
		public function createEnemy (spawnPoint:Point):void
		{
			var enemy:Enemy = new Enemy (_hero);
			enemy.posX = spawnPoint.x;
			enemy.posY = spawnPoint.y;
			_enemies[_enemyCounter] = enemy;
			addChild (enemy);
			
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
