package mememe.ddd.character {

	import mememe.ddd.assets.EnemyAssets
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author deanwhitehouse
	 */
	public class Enemy extends Sprite{
		private var _enemySprite:MovieClip;
		
		public function Enemy() :void{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, createEnemy);
		}
		
		private function createEnemy(e:Event){
			
		}
		
		
	}
}
