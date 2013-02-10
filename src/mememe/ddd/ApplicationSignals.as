package mememe.ddd {
	import mememe.ddd.vo.CharacterAttackVO;
	import mememe.ddd.vo.EnemyDifficultyVO;
	import org.osflash.signals.Signal;
	/**
	 * @author munky
	 */
	public class ApplicationSignals {
		
		public static var levelStoppedSignal:Signal = new Signal (EnemyDifficultyVO);
		public static var heroAttackSignal:Signal = new Signal (CharacterAttackVO);
		public static var enemyAttackSignal:Signal = new Signal (CharacterAttackVO);
	}
}