package mememe.ddd.character 
{	
	import mememe.ddd.assets.HeroAssets;
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
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 20);
			heroArt.pivotX = 0;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
	}

}