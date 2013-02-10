package mememe.ddd.character {
	import mememe.ddd.assets.ParticleAssets;
	import mememe.ddd.controls.KeyboardInput;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	import mememe.ddd.ApplicationSignals;
	import mememe.ddd.assets.HeroAssets;
	import mememe.ddd.DDDConstants;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.Ticker;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Hero extends Sprite
	{
		public var heroFireParticles:PDParticleSystem;
		private static const HERO_SPEED:uint = 4;
		
		private var heroArt:MovieClip;
		
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
			
			_ticker.add (checkKeys);
			
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 22);
			heroArt.pivotX = heroArt.width >> 1;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt); heroArt.stop();
			this.addChild(heroArt);
			
			//FIRE PARTICLES
			heroFireParticles = new PDParticleSystem(XML(new ParticleAssets.firePEX()), Texture.fromBitmap(new ParticleAssets.ParticleTexture()));
			heroFireParticles.scaleX = heroFireParticles.scaleY = 1.2;
			heroFireParticles.y = -this.height + 40;
			heroFireParticles.x = 10;
			Starling.juggler.add(heroFireParticles); heroFireParticles.stop();
			addChild(heroFireParticles);
		}
		
		public function hide ():void
		{
			_ticker.remove (checkKeys);
			heroArt.stop();
		}
		
		private function checkKeys ():void 
		{
			
			if (KeyboardInput.leftKeyIsPressed)
			{
				this.scaleX = -1;
				heroArt.play();
				this.x -= HERO_SPEED;
			} else {
				
			}
			
			if (KeyboardInput.rightKeyIsPressed)
			{
				this.scaleX = 1;
				heroArt.play();
				this.x += HERO_SPEED;
			} else {
				
			}
			
			if (KeyboardInput.upKeyIsPressed)
			{
				this.y += -HERO_SPEED;
			} else {
				
			}
			
			if (KeyboardInput.downKeyIsPressed)
			{
				this.y += HERO_SPEED;
			} else {
				
			}
			
			// STOP HERO WHEN NOT WALKING
			if (KeyboardInput.globalNoKeyDown) {
				heroArt.stop();
			}
			
			if (KeyboardInput.spaceBarIsPressed) {
				if (DDDConstants.isHardwareRendering) { heroFireParticles.start(); }
			} else {
				heroFireParticles.stop();
			}
		}
	}	
}