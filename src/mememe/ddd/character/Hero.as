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
			heroArt.x = int(stage.stageWidth >> 1)
			heroArt.y = int(400);
			heroArt.pivotX = heroArt.width >> 1;
			heroArt.pivotY = heroArt.height >> 1;
			
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
	}

}