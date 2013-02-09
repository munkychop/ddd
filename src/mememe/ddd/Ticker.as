package mememe.ddd
{
	
	/**
	 * @author munky
	 */
	public class Ticker
	{
		private static var _tickerSprite:StarlingTicker;
		
		public static function getInstance ():StarlingTicker
		{
			if (_tickerSprite == null) _tickerSprite = new StarlingTicker ();
			
			return _tickerSprite;
		}
	}
}