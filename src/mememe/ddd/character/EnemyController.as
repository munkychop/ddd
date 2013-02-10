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
	public class EnemyController extends Sprite{
		private var _hero:Hero;
		private var _ticker:StarlingTicker;
		private var _gameArea:Rectangle;
		
		private var _leftCollisionBounds:Rectangle;
		private var _rightCollisionBounds:Rectangle;
		
		private var _enemies:Array = new Array();
		
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
			ApplicationSignals.heroAttackSignal.add(heroAttacked);
			
			_leftCollisionBounds = new Rectangle(0, 0, _gameArea.width / 2, _gameArea.height);
			_rightCollisionBounds = new Rectangle(_gameArea.width / 2, 0, _gameArea.width / 2, _gameArea.height);
			
			_ticker = Ticker.getInstance();
			_ticker.add(tick);
		}
		
		private function heroAttacked(vo:CharacterAttackVO){
			//check if it gets enemy
		}
		
		private var _zeroPointX:int;
		private var _zeroPointY:int;
		
		private function startWave(level:int){
			var spawnPoints:Array = new Array();
			
			//offset so characters start off screen
			var enemOffsetX:int = int(0);
			var enemOffsetY:int = int(0);
			
			
			//zero is the middle of screen
			_zeroPointX = _gameArea.width / 2;
			_zeroPointY = stage.stageHeight / 2;
			
			//top left
			spawnPoints[0] = new Array((-_zeroPointX) - enemOffsetX, enemOffsetY);
			
			//top right
			spawnPoints[1] = new Array(_zeroPointX + enemOffsetX, -enemOffsetY);
			
			//bottom left
			spawnPoints[2] = new Array((-_zeroPointX) - enemOffsetX, _zeroPointY - enemOffsetY);
			
			//bottom right
			spawnPoints[3] = new Array(_zeroPointX + enemOffsetX, _zeroPointY - enemOffsetY);
			
			for(var i = 0; i < 1; i++){
				createEnemy(spawnPoints[Math.round((Math.random() * 3))]);
			}
		}
		
		private var _enemyCounter = 0;
		
		public function createEnemy(spawnPoint:Array){
			var enem = new Enemy(_hero);
			enem.x = spawnPoint[0];
			enem.y = spawnPoint[1];
			enem.zeroX = _zeroPointX;
			enem.zeroY = _zeroPointY;
			_enemies[_enemyCounter] = enem;
			addChild(enem);
			
			_enemyCounter++;
		}
		
		public function tick(){
			moveEnemies();
		}
	
		
		private function moveEnemies(){
			for (var i = 0;i < _enemies.length; i++){
				var enemy:Enemy = _enemies[i];
				
				//get the range radius (aka its range)
				var RangeDist = (enemy.range);
				
				//Get the distance from the players x to the enemys x
				var EnemXDistFromTarget = _hero.x - enemy.x;
				
				//Get the distance from the players y to the enemys y
				var EnemYDistFromTarget = _hero.y - enemy.y;	
				
				//Get the distance between the player and enemy
				var EnemDist = Math.sqrt((EnemXDistFromTarget * EnemXDistFromTarget) + (EnemYDistFromTarget * EnemYDistFromTarget));
				
				
				//if the enemy is attacking (following player)
				if(enemy.attack){
					//check if the target is out of range
					if(EnemDist > RangeDist){
						//if not then attack mode
						enemy.attack = false;
						
						//return to position --- to do
						enemy.moving = false;
					}
				}
				
				//check if player is in range 
				if(EnemDist <= RangeDist){
					
					//rotate enemy to face?
					
					//work out the angle differnce
					//var angleDif:Number = enemy.rotation - newRotation;
					
					//Round the angle dif
					//angleDif = Math.round(angleDif);*/
	
					enemy.attack = true;
					
					//move to player --- to do
					//if(!enemy.moving)
						enemy.followHero();
				}

				if(enemy.moving){
					//Move enemies 
					
					if(enemy.velX != 0)
						enemy.x += enemy.velX;
					
					if(enemy.velY != 0)
						enemy.y += enemy.velY;
				}
			}
		}
	}
}
