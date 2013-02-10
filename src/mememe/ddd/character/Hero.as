package mememe.ddd.character {
	import mememe.ddd.controls.KeyboardInput;
	import flash.ui.Keyboard;
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
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Hero extends Sprite
	{
		private static const HERO_SPEED:uint = 4;
		
		private var heroArt:MovieClip;
		
		private var fireParticlesPool:PoolParticle;
		private var _ticker:StarlingTicker;
		
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
			_ticker = Ticker.getInstance();
			
			fireParticlesPool = new PoolParticle();
			
			_ticker.add (checkKeys);
			
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 22);
			heroArt.pivotX = heroArt.width >> 1;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
		public function hide ():void
		{
			_ticker.remove (checkKeys);
		}
		
		private function checkKeys ():void 
		{
			if (KeyboardInput.leftKeyIsPressed)
			{
				this.scaleX = -1;
				this.x -= HERO_SPEED;
			}
			
			if (KeyboardInput.rightKeyIsPressed)
			{
				this.scaleX = 1;
				this.x += HERO_SPEED;
			}
			
			if (KeyboardInput.upKeyIsPressed)
			{
				this.y += -HERO_SPEED;
			}
			
			if (KeyboardInput.downKeyIsPressed)
			{
				this.y += HERO_SPEED;
			}
		}
	}	
}