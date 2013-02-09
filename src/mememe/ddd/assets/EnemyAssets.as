package mememe.ddd.assets
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class EnemyAssets
	{
		
		[Embed(source="../../../../media/SpriteSheets/Testing/knight.png")]
		public static const AtlasTextureEnemy:Class;
		
		[Embed(source="../../../../media/SpriteSheets/Testing/knight.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlEnemy:Class;
		
		
		private static var _gameTextures:Dictionary = new Dictionary();
		private static var _gameTextureAtlas:TextureAtlas;
		private static var _enemyTextureAtlas:TextureAtlas;
		
		public static function getAtlasEnemy():TextureAtlas
		{
			if (_enemyTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureEnemy");
				var xml:XML = XML(new AtlasXmlEnemy());
				_enemyTextureAtlas=new TextureAtlas(texture, xml);
			}
			
			return _enemyTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (_gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new EnemyAssets[name]();
				_gameTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return _gameTextures[name];
		}
	}
}
