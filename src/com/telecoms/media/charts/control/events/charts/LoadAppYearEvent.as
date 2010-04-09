package com.telecoms.media.charts.control.events.charts
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoadAppYearEvent extends CairngormEvent
	{
		static public var EVENT_ID:String = "LoadImages";
		public function LoadAppYearEvent()
		{
			super(EVENT_ID);
			trace(this);
		}
		
	}
}