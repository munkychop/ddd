package mememe.starling {
	import starling.display.MovieClip;
	import starling.textures.TextureAtlas;
	import starling.textures.Texture;
	import starling.events.Event;
	import starling.display.Sprite;

	/**
	 * @author deanwhitehouse
	 */
	public class Animation extends Sprite{
		
		[Embed(source="../../../media/SpriteSheets/Testing/knight.xml", mimeType="application/octet-stream")]
		private var AnimData:Class;
		
		[Embed(source="../../../media/SpriteSheets/Testing/knight.png")]
		private var AnimTexture:Class;
		
		public function Animation(){
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event):void {
			var texture:Texture = Texture.fromBitmap(new AnimTexture());
			var data:XML = new XML(new AnimData());
			
			var atlas:TextureAtlas = new TextureAtlas(texture, data);
			
			var mc:MovieClip = new MovieClip(atlas.getTextures("anim"), 22);
			
			addChild(mc);
		}
	}
}
