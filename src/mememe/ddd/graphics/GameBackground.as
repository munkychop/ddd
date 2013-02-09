package mememe.ddd.graphics 
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public class GameBackground extends Sprite
	{
		
		private var bgLayer1:ABackgroundLayer;
		//private var bgLayer2:ABackgroundLayer;
		private var bgLayer3:ABackgroundLayer;
		//private var bgLayer4:ABackgroundLayer;
		
		/** Current speed of animation of the background. */
		private var _speed:Number = 0;
		
		/** State of the game. */		
		private var _state:int;
		
		/** Game paused? */
		private var _gamePaused:Boolean = false;
		
		public function GameBackground()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			bgLayer1 = new ABackgroundLayer(1);
			bgLayer1.parallaxDepth = 0.02;
			this.addChild(bgLayer1);
			
			bgLayer3 = new ABackgroundLayer(3);
			bgLayer3.parallaxDepth = 0.4;
			this.addChild(bgLayer3);
			
			// Start animating the background.
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void	{
			if (!gamePaused)
			{
				// Background 1 - Sky
				bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallaxDepth);
				// Hero flying left
				if (bgLayer1.x > 0) bgLayer1.x = -stage.stageWidth;
				// Hero flying right
				if (bgLayer1.x < -stage.stageWidth ) bgLayer1.x = 0;
				
				// Background 2 - Hills
				
				// Background 3 - Buildings
				
				// Background 4 - Trees				
			}
		}
		
		public function get gamePaused():Boolean { return _gamePaused; }
		public function set gamePaused(value:Boolean):void { _gamePaused = value; }
		

		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }

		public function get speed():Number { return _speed; }
		public function set speed(value:Number):void { _speed = value; }
		
	}

}