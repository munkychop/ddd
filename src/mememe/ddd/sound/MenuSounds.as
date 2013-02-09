package mememe.ddd.sound
{
	import mememe.ddd.assets.SoundAssets;
	import flash.net.URLRequest;
	import flash.media.Sound;
	/**
	 * @author munkychop
	 */
	public class MenuSounds
	{
		private const BACKGROUND_SOUND_NAME:String = "bg.mp3";
		private const ITEM_SELECTED_SOUND_NAME:String = "item_selected.mp3";
		
		public var backgroundSoundURLRequest:URLRequest;
		public var backgroundSound:Sound;
		
		public var itemSelectedSoundURLRequest:URLRequest;
		public var itemSelectedSound:Sound;
		
		public function MenuSounds ()
		{
			init (); 
		}

		private function init ():void
		{
			/*
			backgroundSoundURLRequest = new URLRequest (SoundAssets.getSound (BACKGROUND_SOUND_NAME));
			backgroundSound = new Sound (backgroundSoundURLRequest);
			
			itemSelectedSoundURLRequest = new URLRequest (SoundAssets.getSound (ITEM_SELECTED_SOUND_NAME));
			itemSelectedSound = new Sound (itemSelectedSoundURLRequest);
			 * 
			 */	
		}
	}
}
