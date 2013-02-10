package mememe.ddd.graphics 
{
	import mememe.ddd.controls.KeyboardInput;
	import mememe.ddd.character.Hero;
	import mememe.ddd.Ticker;
	import mememe.ddd.StarlingTicker;
	import mememe.ddd.DDDConstants;
	import starling.core.Starling;
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
		private var bgLayer3_:ABackgroundLayer;
		//private var bgLayer4:ABackgroundLayer;
		
		private var _speed:Number = 0;
		
		private var _state:int;
		
		private var _gamePaused:Boolean = false;
		private var _ticker:StarlingTicker;
		
		private var _player:Hero;
		
		public function GameBackground(hero)
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_player = hero;
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			bgLayer1 = new ABackgroundLayer(1);
			bgLayer1.parallaxDepth = 0.02;
			this.addChild(bgLayer1);
			
			var temp = bgLayer1;
			
			_cloudTiles.push(temp);
			
			bgLayer3 = new ABackgroundLayer(3);
			bgLayer3.parallaxDepth = 0.4;			
			this.addChild(bgLayer3);
			
			temp = bgLayer3;
			_buildingTiles.push(temp);
			
			bgLayer3_ = new ABackgroundLayer(3);
			bgLayer3_.parallaxDepth = 0.4;	
			bgLayer3_.x = bgLayer3.width;		
			this.addChild(bgLayer3_);
			
			temp = bgLayer3_;
			_buildingTiles.push(temp);
			
			//bgLayer4 = new ABackgroundLayer(4);
			//bgLayer4.parallaxDepth = .8;
			//this.addChild(bgLayer4);
			
			_ticker = Ticker.getInstance();
			_ticker.add (loop);
		}
		
		private var _cloudSpeed = 0.4;
		private var _bgSpeed = 1;
		private var _cloudTiles:Array = new Array();
		private var _buildingTiles:Array = new Array();
		
		private function moveBackground():void{
			var prevX = 0;
			var i = 0;
			for(i; i < _cloudTiles.length;i++){
				_cloudTiles[i].x -= _cloudSpeed * _player.HERO_SPEED;
				if(_cloudTiles[i].x + _cloudTiles[i].width <= 0){
					
					_cloudTiles[i].x = prevX; 
					
					prevX = _cloudTiles[i].x + _cloudTiles[i].width;
				}
			}
			
			i = 0;
			prevX = 0;
			prevX = _buildingTiles[0].width;
			
			for(i; i < _buildingTiles.length;i++){
				_buildingTiles[i].x -= _bgSpeed * _player.HERO_SPEED;
				//push building tile to back if it's off screen
				if(_buildingTiles[i].x + _buildingTiles[i].width <= 0){
					/*var offset = _bgSpeed * _player.HERO_SPEED;
					
					if(_buildingTiles[i].x + _buildingTiles[i].width < 0){
						offset =  _buildingTiles[i].width + _buildingTiles[i].x;
					}*/
					
					_buildingTiles[i].x = prevX; 
					
					prevX = _buildingTiles[i].x + _buildingTiles[i].width;
				}
			}
		}
		
		private function loop ():void	{
			if (!gamePaused)
			{
				// Background 1 - Sky + Clouds
				bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallaxDepth);
				
				// Background 2 - Hills
				
				// Background 3 - Buildings
				bgLayer3.y = -stage.stageHeight + DDDConstants.UNAVAILABLITY_AREA;
				bgLayer3_.y = -stage.stageHeight + DDDConstants.UNAVAILABLITY_AREA;
				
				// Background 4 - Ground
				
				if(_player.levelRolling){
					if(KeyboardInput.rightKeyIsPressed){
						if(_player.x >= stage.stageWidth / 2){
							moveBackground();
						}					
					}
				}
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