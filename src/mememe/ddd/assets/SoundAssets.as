package mememe.ddd.assets
{
	import flash.media.Sound;
	/**
	 * @author munkychop
	 */
	public class SoundAssets
	{
		[Embed(source = "../../../../media/sounds/fire.mp3")]
		private static var HeroFire:Class;
		
		[Embed(source = "../../../../media/sounds/mainloop.mp3")]
		private static var BGMusicGame:Class;

		private static var _mainBg:Sound;
		private static var _heroFire:Sound;
		
		static public function get heroFire():Sound 
		{
			var h:Sound = new HeroFire() as Sound;
			return h;
		}
		
		static public function get mainBg():Sound 
		{
			var h:Sound = new BGMusicGame() as Sound;
			return h;
		}
	}
}
