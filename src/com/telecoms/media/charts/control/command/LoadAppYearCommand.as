package com.telecoms.media.charts.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.telecoms.media.charts.control.delegates.LoadAppYearDelegate;
	import com.telecoms.media.charts.model.ChartsModelLocator;
	
	import flash.external.ExternalInterface;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAppYearCommand implements ICommand
	{		
		private var model:ChartsModelLocator = ChartsModelLocator.getInstance();
		private	var c:int = 0;
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onResults,onFault);
			var delegate:LoadAppYearDelegate = new LoadAppYearDelegate(responder);
			delegate.loadPhotos();
		}
		private function onFault(event:FaultEvent):void
		{
			Alert.show('No XML file was found...');
		}
		private function onResults(event:ResultEvent):void
		{
			model.appYearData = event.token.result as XML;
			//fillYearDataArray();
		}
		/*private function fillYearDataArray():void
		{
			for(var i:int=0;i<model.appYearData.Year.length();i++){
				var year:String = model.appYearData.Year[i].@date;
				//var country:String = model.appYearData.Year[i].elements();
				var traffic:String = model.appYearData.Year[i].child(c);
				var tempArray:Array = [year,traffic];
				model.yearRegion.addItem(tempArray);
			}
			incrementCountry();
			//traceXML();
		}
		private function incrementCountry():void
		{
			c++;
			if(c>4){
				c == 0;
				traceXML();
			}
			else
			{
				fillYearDataArray();
			}
		}
		private function traceXML():void
		{
			trace('Final Output is '+model.yearRegion);
		}*/
	}
}