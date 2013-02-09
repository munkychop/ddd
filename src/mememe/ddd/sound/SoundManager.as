package mememe.ddd.sound
{
	import flash.media.SoundMixer;
	import flash.media.SoundChannel;
	import flash.media.Sound;

	/**
	 * @author munkychop
	 */
	public class SoundManager
	{
		public var menuSounds:MenuSounds;
		public var levelSounds:LevelSounds;
		public var heroSounds:HeroSounds;
		public var enemySounds:EnemySounds;

		private var _soundChannel:SoundChannel;

		public function SoundManager ()
		{
			init ();
		}

		public function playSound (sound:Sound):void
		{
			_soundChannel = sound.play ();
		}

		public function stopAllSounds ():void
		{
			SoundMixer.stopAll ();
		}

		private function init ():void
		{
			menuSounds = new MenuSounds ();
			levelSounds = new LevelSounds ();
			heroSounds = new HeroSounds ();
			enemySounds = new EnemySounds ();
		}
	}
}
