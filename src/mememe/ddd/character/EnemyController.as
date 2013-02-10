package mememe.ddd.character {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.DisplayObjectContainer;
	import mememe.ddd.vo.CharacterAttackVO;
	import mememe.ddd.vo.EnemyDifficultyVO;
	import mememe.ddd.ApplicationSignals;
	import flash.geom.Point;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.Ticker;
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	/**
	 * @author deanwhitehouse
	 */
	public class EnemyController extends Sprite
	{
		private static const TOTAL_ENEMIES_IN_WAVE : uint = 8;
		private static const ADD_ENEMY_DELAY : uint = 400;
		private static const ADD_ENEMY_WAVE_DELAY : uint = 4000;
		
		private var _hero:Hero;
		private var _ticker:StarlingTicker;
		private var _gameArea:Rectangle;
		
		private var _enemies : Vector.<Enemy> = new Vector.<Enemy>();
		private var _spawnPoints : Vector.<Point>;
		private var _centrePoint : Point;
		private var _containerForEnemies : DisplayObjectContainer;
		private var _addEnemyWaveTimer : Timer;
		private var _addEnemyTimer : Timer;
		private var _waitingToAddNewEnemies : Boolean;
		
		public function EnemyController(hero:Hero, gameArea:Rectangle, containerForEnemies:DisplayObjectContainer){
			_hero = hero;
			_gameArea = gameArea;
			_containerForEnemies = containerForEnemies;
			
			init ();
		}

		private function init () : void
		{
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			ApplicationSignals.heroAttackSignal.add(heroAttacked);
			
			//the middle of screen
			
			_centrePoint = new Point (_gameArea.width >> 1, _gameArea.height >> 1);
			_spawnPoints = new Vector.<Point>(4);
			
			//top left
			_spawnPoints[0] = new Point (_gameArea.left, _gameArea.top + 100);
			_spawnPoints[1] = new Point (_gameArea.left, _gameArea.bottom);
			_spawnPoints[2] = new Point (_gameArea.right, _gameArea.top + 100);
			_spawnPoints[3] = new Point (_gameArea.right, _gameArea.bottom);
			
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
			
			_addEnemyWaveTimer = new Timer (ADD_ENEMY_WAVE_DELAY, 1);
			_addEnemyTimer = new Timer (ADD_ENEMY_DELAY, TOTAL_ENEMIES_IN_WAVE);
			
			startWave();
		}
		
		private function levelStopped(vo:EnemyDifficultyVO){
			//vo.difficulty;
		}  
		
		private function heroAttacked(vo:CharacterAttackVO):void
		{
			//check if it gets enemy
			// trace('attacked');
			
			var enemy:Enemy;
			var attackAreaRect:Rectangle = vo.attackAreaRect;
			for each (enemy in _enemies)
			{
				if (attackAreaRect.intersects (enemy.enemySprite.bounds))
				{
					// trace ("flame hitting enemy!!!");
					enemy.destroy ();
					_containerForEnemies.removeChild (enemy);
					_enemies.splice (_enemies.indexOf(enemy), 1);
				}		
			}
			
			if (!_waitingToAddNewEnemies && _enemies.length == 0)
			{
				_waitingToAddNewEnemies = true;
				
				trace ("no more enemies, starting timer to add more...");
				// ApplicationSignals.allCurrentEnemiesDefeatedSignal.dispatch ();

				_addEnemyWaveTimer.addEventListener(TimerEvent.TIMER, addEnemyWaveTimerHandler);
				_addEnemyWaveTimer.start ();
			}
		}

		private function addEnemyWaveTimerHandler(event : TimerEvent) : void
		{
			_addEnemyWaveTimer.removeEventListener(TimerEvent.TIMER, addEnemyWaveTimerHandler);
			startWave ();
		}
		
		private function startWave():void
		{		
			_addEnemyTimer.addEventListener(TimerEvent.TIMER, addEnemyTimerHandler);
			_addEnemyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, addEnemyTimerCompleteHandler);
			_addEnemyTimer.start ();
		}
		
		private function addEnemyTimerHandler(event : TimerEvent) : void
		{
			trace ("addEnemyTimerHandler");
			
			createEnemy (_spawnPoints[Math.round((Math.random() * (_spawnPoints.length - 1)))]);
		}

		private function addEnemyTimerCompleteHandler(event : TimerEvent) : void
		{
			_addEnemyTimer.removeEventListener(TimerEvent.TIMER, addEnemyTimerHandler);
			_addEnemyTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, addEnemyTimerCompleteHandler);
			_addEnemyTimer.stop ();
			_addEnemyTimer.reset ();
			
			_waitingToAddNewEnemies = false;
			
			trace ("addEnemyTimerCompleteHandler");
		}

		
		
		public function createEnemy (spawnPoint:Point):void
		{
			var enemy:Enemy = new Enemy (_hero);
			enemy.posX = spawnPoint.x;
			enemy.posY = spawnPoint.y;
			_enemies.push (enemy);
			
			_containerForEnemies.addChild (enemy);			
			
			if (enemy.posX < _centrePoint.x) enemy.flipScale ();
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
