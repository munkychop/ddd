package mememe.ddd.character {

	import mememe.ddd.vo.CharacterAttackVO;
	import mememe.ddd.ApplicationSignals;
	import flash.geom.Point;
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
		
		public var movementSpeed:int = 3;
		public var attackCooldown:int = 1;
		
		//health
		public var startHealth:int;
		public var currentHealth:int;
		
		public var moving:Boolean = false;
		
		//integer of how far the enemy can 'see'
		public var range:int;
		
		//multipliers to adjust difficulty 
		public var damageMultiplier:int;
		public var healthMultiplier:int;
		
		//defines
		private var ATTACKS: Dictionary = new Dictionary();
		private var ENEMIES : Dictionary = new Dictionary();
		
		//user given list of possible attacks
		private var _avaliableAttacks: Dictionary; 
		
		public var attack:Boolean = false;
		
		public var velX, velY;
		
		private var _target:Hero;
	
		
		public function Enemy(target:Hero){
			super();
			
			_target = target;
			
			ATTACKS[String] = 'punch';
			ATTACKS[String] = 'kick';
			
			ENEMIES[String] = 'standard';
			
			startHealth = 100;
			currentHealth = 100;
			
			range = 1000;
			
			damageMultiplier = 1;
			healthMultiplier = 1;
			
			_avaliableAttacks = new Dictionary();
			_avaliableAttacks[String] = 'punch';
			_avaliableAttacks[String] = 'kick';
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function killMe(){
			
		}
		
		private function init(e:Event){
			spawnEnemy();
		}
		
		private function attackPlayer():void{
			//var curAttack:CharacterAttackVO = new CharacterAttackVO();
			//ApplicationSignals.enemyAttackSignal.dispatch(curAttack);
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
		
		public function followHero(){
			//trace(this.x + " " + _target.x + ' ' + this.y + ' ' + _ta);
			//var global = localToGlobal(new Point(_target.x, _target.y));
			//global.x -= _target.width;
			moveTo(_target.x, _target.y);
		}
		
		public var zeroX, zeroY;
		
		public function moveTo(locX, locY){	
			var myPos = localToGlobal(new Point(this.x, this.y));
			myPos.x -= (-zeroX);
			//myPos.x += this.width;
			//locX -= _target.width;
			var closeEnough = 0.6;

			var closeX = (myPos.x <= locX + closeEnough && myPos.x >= locX - closeEnough) ? true : false;
			var closeY = (myPos.y <= locY + closeEnough && myPos.y >= locY - closeEnough) ? true : false;
			
			if(!closeX || !closeY){
				moving = true;
				
				//Get the distance from the players x to the enemys x
				var EnemXDistFromTarget = locX - myPos.x;

				//Get the distance from the players y to the enemys y
				var EnemYDistFromTarget = locY - myPos.y;	
				
				//Get the distance between the player and enemy
				var EnemDist = Math.sqrt((EnemXDistFromTarget * EnemXDistFromTarget) + (EnemYDistFromTarget * EnemYDistFromTarget));
					
				var newRotation:int = Math.atan2(EnemYDistFromTarget, EnemXDistFromTarget) * 180 / Math.PI; 
				
				//this.rotation = newRotation;
				
				//Get radions for movement direction
				var direction:Number = (newRotation * Math.PI) / 180;	
					
				//Set the X velocity 
				velX = movementSpeed * (Math.cos(direction));

				//Set the Y velocity 
				velY = movementSpeed * (Math.sin(direction));
			}
			else
				moving = false;
			
			if(closeX)
				velX = 0;
			if(closeY)
				velY = 0;
		}
	}
}
