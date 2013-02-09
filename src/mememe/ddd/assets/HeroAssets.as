package mememe.ddd.assets
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class HeroAssets
	{
		
		[Embed(source="../../../../media/SpriteSheets/Testing/knight.png")]
		public static const AtlasTextureHero:Class;
		
		[Embed(source="../../../../media/SpriteSheets/Testing/knight.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlHero:Class;
		
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		private static var heroTextureAtlas:TextureAtlas;
		
		public static function getAtlasHero():TextureAtlas
		{
			if (heroTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureHero");
				var xml:XML = XML(new AtlasXmlHero());
				heroTextureAtlas=new TextureAtlas(texture, xml);
			}
			
			return heroTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new HeroAssets[name]();
				gameTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
	}
}
