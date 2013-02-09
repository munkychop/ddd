package mememe.ddd {
	import org.osflash.signals.Signal;
	/**
	 * @author munky
	 */
	public class ApplicationSignals {
		
		public static var levelStoppedSignal:Signal = new Signal ();
		public static var keypressSignal:Signal = new Signal (uint);
	}
}
