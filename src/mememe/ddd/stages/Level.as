package mememe.ddd.stages {
	import mememe.ddd.assets.LevelAssets;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.core.Starling;

	/**
	 * @author munky
	 */
	public class Level extends Sprite {
		private var _levelBackground : MovieClip;
		public function Level() {
			
		}
		
		public function init ():void
		{
			_levelBackground = new MovieClip (LevelAssets.getAtlasLevelBg().getTextures("bg"), 20);
			
			starling.core.Starling.juggler.add(_levelBackground);
			this.addChild(_levelBackground);
		}
	}
}
