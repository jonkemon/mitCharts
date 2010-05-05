package com.telecoms.media.charts.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.telecoms.media.charts.control.events.charts.LoadAppYearEvent;
	import com.telecoms.media.charts.control.command.LoadAppYearCommand;
	import com.telecoms.media.charts.control.command.LoadServiceYearCommand;
	import com.telecoms.media.charts.control.events.charts.LoadServiceYearEvent;
	
	public class PTController extends FrontController
	{
		public function PTController()
		{
			super();
			addCommand(LoadAppYearEvent.EVENT_ID, LoadAppYearCommand);
			addCommand(LoadServiceYearEvent.EVENT_ID, LoadServiceYearCommand);
		}
		
	}
}