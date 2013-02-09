package mememe.ddd {
	import org.osflash.signals.Signal;
	/**
	 * @author munky
	 */
	public class ApplicationSignals {
		
		public static var levelStoppedSignal:Signal = new Signal ();
		public static var keyDownSignal:Signal = new Signal (uint);
		public static var keyUpSignal:Signal = new Signal (uint);
	}
}