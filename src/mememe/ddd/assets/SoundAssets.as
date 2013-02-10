package mememe.ddd.assets
{
	import flash.media.Sound;
	/**
	 * @author munkychop
	 */
	public class SoundAssets
	{
		//[Embed(source="../../../../media/sounds/menu/menu_bg.mp3")] 		 
		//private static var MenuBg:Class;
		//[Embed(source="../../../../media/sounds/menu/menu_item_selected.mp3")] 		 
		//private static var MenuItemSelected:Class;
		
		[Embed(source = "../../../../media/sounds/fire.mp3")]
		private static var HeroFire:Class;

		private static var _menuBg:Sound;
		private static var _menuItemSelected:Sound;
		private static var _heroFire:Sound;

		//public static function get menuBg ():Sound
		//{
			//if (_menuBg) return _menuBg;
			//
			//_menuBg = new MenuBg ();
			//return _menuBg;
		//}
		//
		//public static function get menuItemSelected ():Sound
		//{
			//if (_menuItemSelected) return _menuItemSelected;
			//
			//_menuItemSelected = new MenuItemSelected ();
			//return _menuItemSelected;
		//}
		
		static public function get heroFire():Sound 
		{
			var h:Sound = new HeroFire() as Sound;
			return h;
		}
	}
}
