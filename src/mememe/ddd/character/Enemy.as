package mememe.ddd.character {

	import flash.geom.Rectangle;
	import flash.geom.Point;
	import mememe.ddd.assets.EnemyAssets;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author deanwhitehouse
	 */
	public class Enemy extends Sprite
	{
		private var _enemySprite:MovieClip;
		
		public var movementSpeed:int = 3;
		public var attackCooldown:int = 1;
		public var posX:Number;
		public var posY:Number;
		
		//health
		public var startHealth:int;
		public var currentHealth:int;
		
		public var moving:Boolean = false;
		
		//integer of how far the enemy can 'see'
		public var range:int;
		
		//multipliers to adjust difficulty 
		public var damageMultiplier:int;
		public var healthMultiplier:int;
		
		private var _target : Hero;
		private var _shouldMove : Boolean;
		private var _targetPoint : Point;
		private var _zeroPoint : Point;
		private var _globalHeroPoint : Point;
		private var _globalEnemySpritePoint : Point;
		private var _globalEnemySpriteRect : Rectangle;
		private var _globalHeroRect : Rectangle;
		private var _shouldAttack : Boolean;
	
		
		public function Enemy(target:Hero)
		{
			super();
			
			_target = target;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			startHealth = 100;
			currentHealth = 100;
			
			range = 1000;
			
			damageMultiplier = 1;
			healthMultiplier = 1;
			
			_zeroPoint = new Point ();
			_globalHeroPoint = new Point ();
			_globalEnemySpritePoint = new Point ();
			_targetPoint = new Point ();
			
			_globalEnemySpriteRect = new Rectangle();
			_globalHeroRect = new Rectangle();
			
			_shouldMove = true;
			
			spawnEnemy();
		}
		
		public function updateEnemy ():void
		{
			if (_shouldMove) moveToPoint (_enemySprite, setTarget (), movementSpeed);
		}
		
		public function spawnEnemy():void{
			_enemySprite = new MovieClip(EnemyAssets.getAtlasEnemy().getTextures("dino_anim_mc"), 9);
		
			_enemySprite.stop();
			_enemySprite.pivotX = _enemySprite.width >> 1;
			_enemySprite.pivotY = _enemySprite.height;
			_enemySprite.x = posX;
			_enemySprite.y = posY;
			
			starling.core.Starling.juggler.add(_enemySprite);
			this.addChild(_enemySprite);

			//return _enemySprite;
		}
		
		public function destroy():void
		{
			starling.core.Starling.juggler.remove(_enemySprite);
			this.removeChild(_enemySprite);
		}
		
		private function setTarget () : Point
		{
				_targetPoint.x = _target.x;
				_targetPoint.y = _target.y;
				
				return _targetPoint;	
		}
		
		private function attack():void
		{
			//var curAttack:CharacterAttackVO = new CharacterAttackVO();
			//ApplicationSignals.enemyAttackSignal.dispatch(curAttack);
		}
		
		private function moveToPoint (obj:MovieClip, target:Point, speed:Number = 1, objRot:Boolean = false):void
		{
			// get the difference between obj and target points.
			var diff:Point = target.subtract(new Point(obj.x, obj.y)); 
			var dist:Number = diff.length;
			
			if (dist <= speed)  // if we will go past when we move just put it in place.
			{
				obj.x = target.x;
				obj.y = target.y;
				
				trace ("target reached");
			}
			else // If we are not there yet. Keep moving.
			{ 
				// get global rectangles for hit detection.
				
				trace ("moving");
				
				_globalEnemySpritePoint = _enemySprite.localToGlobal (new Point (_enemySprite.x, _enemySprite.y));
				
				_globalEnemySpriteRect.x = _globalEnemySpritePoint.x;
				_globalEnemySpriteRect.y = _globalEnemySpritePoint.y;
				_globalEnemySpriteRect.width = _globalEnemySpritePoint.x + _enemySprite.width;
				_globalEnemySpriteRect.height = _globalEnemySpritePoint.y + _enemySprite.height;
				
				_globalHeroPoint = _target.localToGlobal (new Point (_target.x, _target.y));
				
				_globalHeroRect.x = _globalHeroPoint.x;
				_globalHeroRect.y = _globalHeroPoint.y;
				_globalHeroRect.width = _globalHeroPoint.x + _target.width;
				_globalHeroRect.height = _globalHeroPoint.y + _target.height;
				
				// if enemy rect overlaps hero rect stop moving and allow attacking.
				if (_globalEnemySpriteRect.intersects(_globalHeroRect))
				{
					trace ("collision!!!");
					_shouldMove = false;
					_shouldAttack = true;
				}
				
				diff.normalize(1);
				obj.x += diff.x * speed;
				obj.y += diff.y * speed;
				
				if (objRot) // If we want to rotate with our movement direction.
				{ 
					obj.rotation = Math.atan2(diff.y, diff.x) * (180 / Math.PI) + 90;
				}
			}
		}
	}
}
