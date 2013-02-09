package mememe.ddd.character {
	import flash.geom.Point;
	import mememe.ddd.ApplicationSignals;
	import mememe.ddd.assets.HeroAssets;
	import mememe.ddd.graphics.PoolParticle;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.Ticker;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import mememe.ddd.controls.KeyboardInput;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Hero extends Sprite
	{
		private var heroArt:MovieClip;
		
		private var fireParticlesPool:PoolParticle;
		private var ticker:StarlingTicker;
		private var direction:Point;
		
		public function Hero()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			init();
		}
		
		private function init():void
		{
			ticker = Ticker.getInstance();
			ApplicationSignals.keyDownSignal.add(keyDownSignalHandler);
			ApplicationSignals.keyUpSignal.add(keyUpSignalHandler);
			fireParticlesPool = new PoolParticle();
			
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 22);
			heroArt.pivotX = heroArt.width >> 1;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
		private function keyUpSignalHandler(key:uint):void 
		{
			switch(key) {
				case 37:
					// LEFT
					ticker.remove(heroMovementLeft)
					break;
				case 38:
					//UP
					ticker.remove(heroMovementUp)
					break;
				case 39:
					//RIGHT
					ticker.remove(heroMovementRight)
					break;
				case 40:
					//DOWN
					ticker.remove(heroMovementDown)
					break;
				default:
					break;
			}
		}
		
		private function keyDownSignalHandler(key:uint):void 
		{
			direction = new Point();
			switch(key) {
				case 37:
					// LEFT
					direction.x = -1; direction.y = 0;
					ticker.add(heroMovementLeft)
					break;
				case 38:
					//UP
					direction.x = 0; direction.y = -1;
					ticker.add(heroMovementUp)
					break;
				case 39:
					//RIGHT
					direction.x = 1; direction.y = 0;
					ticker.add(heroMovementRight)
					break;
				case 40:
					//DOWN
					direction.x = 0; direction.y = 1;
					ticker.add(heroMovementDown)
					break;
				default:
					break;
			}
		}
		
		private function heroMovementDown():void 
		{
			this.y += direction.y;
		}
		
		private function heroMovementRight():void 
		{
			this.x += direction.x;
			this.scaleX = 1;
		}
		
		private function heroMovementUp():void 
		{
			this.y += direction.y;
		}
		
		private function heroMovementLeft():void 
		{
			this.x += direction.x;
			this.scaleX = -1;
		}
		
	}	
}