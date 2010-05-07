package com.telecoms.media.charts.control.events.charts
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class CheckBoxEvent extends CairngormEvent
	{
		static public var EVENT_ID:String = "CheckBoxClicked";
		public function CheckBoxEvent()
		{
			super(EVENT_ID);
			trace(this);
		}
		
	}
}