package mememe.ddd.assets {
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import flash.utils.Dictionary;
	/**
	 * @author munky
	 */
	public class LevelAssets {
		[Embed(source="../../../../media/SpriteSheets/Testing/levelBa.png")]
		public static const AtlasTextureLevelBg:Class;
		
		[Embed(source="../../../../media/SpriteSheets/Testing/levelBg.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlLevelBg:Class;
		
		
		private static var levelTextures:Dictionary = new Dictionary();
		private static var levelTextureAtlas:TextureAtlas;
		
		public static function getAtlasLevelBg():TextureAtlas
		{
			if (levelTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureHero");
				var xml:XML = XML(new AtlasXmlLevelBg());
				levelTextureAtlas=new TextureAtlas(texture, xml);
			}
			
			return levelTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (levelTextures[name] == undefined)
			{
				var bitmap:Bitmap = new HeroAssets[name]();
				levelTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return levelTextures[name];
		}
	}
}
