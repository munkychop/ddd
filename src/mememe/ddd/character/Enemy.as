package mememe.ddd.character {

	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import mememe.ddd.assets.EnemyAssets;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author deanwhitehouse
	 */
	public class Enemy extends Sprite{
		private var _enemySprite:MovieClip;
		
		public var movementSpeed:int = 1;
		public var attackCooldown:int = 1;
		
		//health
		public var startHealth:int;
		public var currentHealth:int;
		
		//multipliers to adjust difficulty 
		public var damageMultiplier:int;
		public var healthMultiplier:int;
		
		//defines
		private var ATTACKS: Dictionary = new Dictionary();
		private var ENEMIES : Dictionary = new Dictionary();
		
		//user given list of possible attacks
		private var _avaliableAttacks: Dictionary; 
		
		private var _target:Hero;
	
		
		public function Enemy(target:Hero){
			super();
			
			_target = target;
			
			ATTACKS[String] = 'punch';
			ATTACKS[String] = 'kick';
			
			ENEMIES[String] = 'standard';
			
			startHealth = 100;
			currentHealth = 100;
			
			damageMultiplier = 1;
			healthMultiplier = 1;
			
			_avaliableAttacks = new Dictionary();
			_avaliableAttacks[String] = 'punch';
			_avaliableAttacks[String] = 'kick';
			
			addEventListener(Event.ADDED_TO_STAGE, testEvent);
		}
		
		public function killMe(){
			
		}
		
		private function testEvent(e:Event){
			spawnEnemy();
		}
		
		public function spawnEnemy():void{
			_enemySprite = new MovieClip(EnemyAssets.getAtlasEnemy().getTextures("anim"), 20);
			_enemySprite.stop();
			_enemySprite.pivotX = _enemySprite.width >> 1;
			_enemySprite.pivotY = _enemySprite.height;
			_enemySprite.x = stage.stageWidth / 2;
			_enemySprite.y = stage.stageHeight / 2;
			
			starling.core.Starling.juggler.add(_enemySprite);
			this.addChild(_enemySprite);

			//return _enemySprite;
		}
		
		public function goToPlayer(avoidAI:Boolean){
			if(avoidAI){
				
			}
			else{
				//moveTo(_target.x, _target.y);
			}
		}
	}
}
