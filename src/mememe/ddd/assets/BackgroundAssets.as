package mememe.ddd.assets 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class BackgroundAssets 
	{
		[Embed(source = "../../../../media/SpriteSheets/bg1.png")]
		public static const Background1:Class;
		
		[Embed(source = "../../../../media/SpriteSheets/bg2.png")]
		public static const Background2:Class;
		
		[Embed(source = "../../../../media/SpriteSheets/bg3.png")]
		public static const Background3:Class;
		
		[Embed(source="../../../../media/SpriteSheets/buildings/buildings.png")]
		public static const AtlasBackground:Class;
		
		[Embed(source="../../../../media/SpriteSheets/buildings/buildings.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlBackground:Class;		
		
		
		private static var bgTextures:Dictionary = new Dictionary();
		private static var buildingsTextureAtlas:TextureAtlas;
		
		public static function getBgAtlas():TextureAtlas
		{
			if (buildingsTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasBackground");
				var xml:XML = XML(new AtlasXmlBackground());
				buildingsTextureAtlas = new TextureAtlas(texture, xml);
			}
			
			return buildingsTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (bgTextures[name] == undefined)
			{
				var bitmap:Bitmap = new BackgroundAssets[name]();
				bgTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return bgTextures[name];
		}
		
	}

}