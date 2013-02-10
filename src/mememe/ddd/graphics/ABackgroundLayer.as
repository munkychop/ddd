package mememe.ddd.graphics 
{
	import mememe.ddd.assets.BackgroundAssets;
	import starling.core.Starling;
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
		// TYPE
		private var _layer:int;
		
		private var image1:Image;
		private var image2:Image;
		
		private var mcBlock:MovieClip;
		
		private var sp1:Image
		private var sp2:Image;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function ABackgroundLayer(_layer:int)
		{
			super();
			
			this._layer = _layer;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (_layer == 1) {
				// SKY, MOON, CLOUDS
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
			} else if (_layer == 2) {
				// HILLS ?
			} else if (_layer == 3) {
				// BLOCKS, BUILDINGS
				for (var i:int = 0; i < 5; i++) 
				{
					mcBlock = new MovieClip(BackgroundAssets.getBgAtlas().getTextures("building_mc"),9);
					mcBlock.x = this.width;
					//mcBlock.advanceTime(int(Math.random() * 9));
					this.addChild(mcBlock); 
					mcBlock.scaleX = mcBlock.scaleY = Math.random() * 0.3 + 0.7; 
					//mcBlock.width = int(mcBlock.width); mcBlock.height = int(mcBlock.height);
					mcBlock.y = stage.stageHeight - mcBlock.height;
				}				
			} else if (_layer == 4) {
				// FLOOR HERE, SAND, GRASS, STREET
			}
		}

		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
	}
	
}