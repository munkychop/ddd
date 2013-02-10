package mememe.ddd {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import mememe.ddd.assets.SoundAssets;
	import mememe.ddd.stages.GamePlay;
	import starling.display.Sprite;
	import starling.events.Event;

	public class DrugDealingDino extends Sprite
	{
		private var gamePlay : GamePlay;
		private var _ticker : StarlingTicker;
		// MAIN STARLING CLASS. HERE ALL STARTS
		
		private var mainSoundFile:Sound;
		private var mainSoundChannel:SoundChannel;
		private var mainSoundTransform:SoundTransform;
		
		public function DrugDealingDino ()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			gamePlay = new GamePlay();
			this.addChild(gamePlay);
			
			mainSoundFile = SoundAssets.mainBg as Sound;			
			mainSoundTransform = new SoundTransform(0);
			mainSoundChannel = mainSoundFile.play(0, 9999, mainSoundTransform);
			
			_ticker = Ticker.getInstance();
			
			gamePlay.addChild(_ticker);
			_ticker.start();
		}
	}
}
