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
		}
		
		public function spawnEnemy(){
			_enemySprite = new MovieClip(EnemyAssets.getAtlasEnemy().getTextures("anim"), 20);
			_enemySprite.pivotX = 0;
			_enemySprite.pivotY = _enemySprite.height;
			
			starling.core.Starling.juggler.add(_enemySprite);
			this.addChild(_enemySprite);	
		}
	}
}
