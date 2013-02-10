package mememe.ddd.graphics 
{
	import mememe.ddd.assets.BackgroundAssets;
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	
	 
	public class ABackgroundLayer extends Sprite
	{
		/** Layer identification. */
		private var _layer:int;
		
		/** Primary image. */
		private var image1:Image;
		private var mc1:MovieClip;
		
		/** Secondary image. */
		private var image2:Image;
		private var mc2:MovieClip;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function ABackgroundLayer(_layer:int)
		{
			super();
			
			this._layer = _layer;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			/*
			if (_layer == 1) {
				image1 = new Image(BackgroundAssets.getTexture("Background" + _layer));
				image1.blendMode = BlendMode.NONE;
				image2 = new Image(BackgroundAssets.getTexture("Background" + _layer));
				image2.blendMode = BlendMode.NONE;
				
				image1.x = 0;
				image1.y = stage.stageHeight - image1.height;
				
				image2.x = image2.width;
				image2.y = image1.y;
				
				this.addChild(image1);
				this.addChild(image2);
			} else {
				mc1 = new MovieClip(BackgroundAssets.getBgAtlas().getTextures("building_mc"),1);
				mc1.x = 0;
				mc1.y = stage.stageHeight - mc1.height;
				
				mc2 = new MovieClip(BackgroundAssets.getBgAtlas().getTextures("building_mc"),1);
				mc2.x = mc1.width;
				mc2.y = mc1.y;
				
				this.addChild(mc2);
				this.addChild(mc2);
			}
			*/
			
			
		}

		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
	}
	
}