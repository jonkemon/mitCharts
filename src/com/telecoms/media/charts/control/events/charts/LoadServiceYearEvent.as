package com.telecoms.media.charts.control.events.charts
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoadServiceYearEvent extends CairngormEvent
	{
		static public var EVENT_ID:String = "LoadService";
		public function LoadServiceYearEvent()
		{
			super(EVENT_ID);
			trace(this);
		}
		
	}
}