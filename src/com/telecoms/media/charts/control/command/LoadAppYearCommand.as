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
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onResults,onFault);
			var delegate:LoadAppYearDelegate = new LoadAppYearDelegate(responder);
			delegate.loadPhotos();
		}
		private function onFault(event:FaultEvent):void
		{
			Alert.show('No photos were found...');
		}
		private function onResults(event:ResultEvent):void
		{
			model.appYearData = event.token.result as XML;
			var totalApps:int =  model.appYearData.app.length();
			
			for(var i:int=0;i<totalApps;i++){
				model.appYearDataArray.addItem([{ app: "Entertainment", year: 2012, profit:987654 } ]);
				trace(model.appYearDataArray.source);
			}
		}
	}
}