package mememe.ddd.character {
	import mememe.ddd.ApplicationSignals;
	import mememe.ddd.assets.HeroAssets;
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
			ApplicationSignals.keypressSignal.add (keypressSignalHandler);
			
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 20);
			heroArt.pivotX = 0;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
		private function keypressSignalHandler(key:uint):void 
		{
			trace("Hero:: key pressed: " + key);
		}
		
	}	
}