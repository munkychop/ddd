package mememe.ddd 
{
	import starling.core.Starling;
	/**
	 * ...
	 * @author Radu Chiriac
	 */
	public final class DDDConstants 
	{
		
		public static const UNAVAILABLITY_AREA:uint = 550;
		
		public static const isHardwareRendering:Boolean = Starling.context.driverInfo.toLowerCase().indexOf("software") == -1;
		
	}

}