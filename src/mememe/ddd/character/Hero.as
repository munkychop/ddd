package mememe.ddd.character {
	import mememe.ddd.vo.EnemyDifficultyVO;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import mememe.ddd.assets.ParticleAssets;
	import mememe.ddd.assets.SoundAssets;
	import mememe.ddd.controls.KeyboardInput;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	import mememe.ddd.ApplicationSignals;
	import mememe.ddd.assets.HeroAssets;
	import mememe.ddd.DDDConstants;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.Ticker;
	import mememe.ddd.vo.CharacterAttackVO;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class Hero extends Sprite
	{
		public var heroFireParticles:PDParticleSystem;
		public var HERO_SPEED:uint = 4;
		
		private var heroArt:MovieClip;
		
		private var _ticker:StarlingTicker;
		private var areParticlesRunning:Boolean;
		private var heroSoundFile:Sound;
		private var heroSoundChannel:SoundChannel;
		
		public var killingArea:Rectangle;
		
		public function Hero()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			init();
		}
		
		private function init():void
		{
			// PROBABLY POINT{} WOULD WORK BETTER
			killingArea = new Rectangle(0, 0, 0, 50);
			
			_ticker = Ticker.getInstance();
			
			_ticker.add (checkKeys);
			
			heroArt = new MovieClip(HeroAssets.getAtlasHero().getTextures("anim"), 22);
			heroArt.pivotX = heroArt.width >> 1;
			heroArt.pivotY = heroArt.height;
			
			starling.core.Starling.juggler.add(heroArt); heroArt.stop();
			this.addChild(heroArt);
			
			//FIRE PARTICLES
			heroFireParticles = new PDParticleSystem(XML(new ParticleAssets.firePEX()), Texture.fromBitmap(new ParticleAssets.ParticleTexture()));
			heroFireParticles.scaleX = heroFireParticles.scaleY = 1.2;
			heroFireParticles.y = -this.height + 40;
			heroFireParticles.x = 10;
			Starling.juggler.add(heroFireParticles); heroFireParticles.stop();
			addChild(heroFireParticles);
			areParticlesRunning = false;
			
			heroSoundChannel = new SoundChannel();
			ApplicationSignals.levelStoppedSignal.add(levelStopped);
			ApplicationSignals.allCurrentEnemiesDefeatedSignal.add(levelStarted);
			_enemyStart = 4000;
		}
		
		public var levelRolling:Boolean = true;
		
		private function levelStarted(){
			levelRolling = true;
		}
		
		private function levelStopped(vo:EnemyDifficultyVO){
			levelRolling = false;
		}
		
		public function hide ():void
		{
			_ticker.remove (checkKeys);
			heroArt.stop();
		}
		
		private var _steps:int = 0;
		private var _enemyStart;
		private var _difficulty = 1;
		private var _vo:EnemyDifficultyVO = new EnemyDifficultyVO ();
		
		private function takeStep():void{
			if(_steps == _enemyStart){
				_vo.difficulty = (Math.floor(_difficulty));
				ApplicationSignals.levelStoppedSignal.dispatch(_vo);
				_steps = 0;
				_enemyStart  = Math.round((Math.random() * 100));
				_difficulty += 0.5;
			}
			_steps++;
		}
		
		private function checkKeys ():void 
		{
			
			if (KeyboardInput.leftKeyIsPressed)
			{
				this.scaleX = -1;
				heroArt.play();
				this.x -= HERO_SPEED;
			} else {
				
			}
			
			if (KeyboardInput.rightKeyIsPressed)
			{
				this.scaleX = 1;
				heroArt.play();

				if(levelRolling){
					if(this.x < stage.stageWidth / 2){
						this.x += HERO_SPEED;	
					}
					takeStep();
				}
				else{
					this.x += HERO_SPEED;
				}
			} else {
				
			}
			
			if (KeyboardInput.upKeyIsPressed)
			{
				this.y += -HERO_SPEED;
			} else {
				
			}
			
			if (KeyboardInput.downKeyIsPressed)
			{
				this.y += HERO_SPEED;
			} else {
				
			}
			
			// STOP HERO WHEN NOT WALKING
			if (KeyboardInput.globalNoKeyDown) {
				heroArt.stop();
			}
			
			if (KeyboardInput.spaceBarIsPressed) {
				if (DDDConstants.isHardwareRendering) { 
					if (!areParticlesRunning) {
						heroSoundFile = SoundAssets.heroFire as Sound;
						heroSoundChannel = heroSoundFile.play();
						heroFireParticles.start(); 
						areParticlesRunning = true;
					}
					// FIGURED IT OUT THAT PARTICLES DON'T GET ANY BIGGER THAN 190px
					killingArea.width = int(heroFireParticles.numParticles * 190 / 233);
					
					var myHeroAttackDetails:CharacterAttackVO = new CharacterAttackVO();		
					myHeroAttackDetails.attackAreaRect = killingArea;
					
					// BETWEEN 0 AND 1
					myHeroAttackDetails.damage = killingArea.width / 190 * 100;
					ApplicationSignals.heroAttackSignal.dispatch(myHeroAttackDetails);
				}
			} else {
				heroSoundChannel.stop();
				killingArea.width = 0;
				heroFireParticles.stop();
				areParticlesRunning = false;				
			}
		}
	}	
}