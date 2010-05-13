package com.telecoms.media.charts.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.telecoms.media.charts.control.delegates.LoadAppYearDelegate;
	import com.telecoms.media.charts.control.events.charts.LoadAppYearEvent;
	import com.telecoms.media.charts.control.events.charts.LoadServiceYearEvent;
	import com.telecoms.media.charts.model.ChartsModelLocator;
	
	import flash.external.ExternalInterface;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;
	import mx.utils.ArrayUtil;

	public class CheckBoxCommand implements ICommand
	{		
		private var model:ChartsModelLocator = ChartsModelLocator.getInstance();
		public function execute(event:CairngormEvent):void
		{
			model.tempRegionService = model.tempCheckBoxData;

			if(model.storedKeys.indexOf(model.tempRegionService)>0){
					restoreTakenData();
			}
			else{					
				takeData();
			}
		}
		
		private function takeData():void
		{
			var tempRegionService:String = model.tempCheckBoxData;
			var empty:String = "";

			for(var m:int = 0; m < model.appYearData.Year.length(); m++){
				var item:Object = { Country: tempRegionService};
				model.storedKeyData.addItem(item);
			}
			trace('Country is '+model.storedKeyData[0].Country);
			
			model.storedKeys.push(tempRegionService);
			
			for(var j:int = 0; j<model.appYearData.Year.length(); j++){
				model.appYearData.Year[j].replace(tempRegionService, empty);
			}

			model.appYearData.normalize();
			trace('Taking!');
			trace(model.appYearData);
			
			model.convertedXML = convertXmlToArrayCollection(model.appYearData);
		}
		
		private function restoreTakenData():void
		{
			var tempRegionService:String = model.tempCheckBoxData;
			var empty:String = "";
			for(var i:int = 0; i < model.appYearData.Year.length() ; i++){
				//trace(model.appYearDataClone.Year[i].child(tempRegionService));
				var tempNumbervalue:int = model.appYearDataClone.Year[i].child(tempRegionService);
				var tempName:XML = <{tempRegionService}>{tempNumbervalue}</{tempRegionService}>;
				model.appYearData.Year[i].appendChild(tempName);
				//trace(model.appYearData.Year[i].AfricaMiddleEast);
				//trace('Index is '+model.appYearData.Year[0].child(tempRegionService));
				//model.appYearData.childIndex()
				//model.appYearData.Year[2].AfricaMiddleEast = 3134564;
				//model.appYearData.Year[3].AfricaMiddleEast = 4234566;
			}
			

			/*for(var k:int = 0; k < model.appYearData.Year.length() ; k++){
				trace(model.storedKeyData[k].Country);
				if(tempRegionService == model.storedKeyData[k].Country){
					trace('Match!');
					//var tempName:XML = tempRegionService as XML;
				}
			}*/
			
			model.appYearData.normalize();
			trace('Returning!');
			trace(model.appYearData);
			
			var arrayNumber:int = model.storedKeys.indexOf(model.tempRegionService);
			model.storedKeys[arrayNumber] = "";
			
			model.convertedXML = convertXmlToArrayCollection(model.appYearData);
		}
		
		private function convertXmlToArrayCollection( file:String ):ArrayCollection
		{
			var xml:XMLDocument = new XMLDocument( file );
			
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder();
			var data:Object = decoder.decodeXML( xml );
			var array:Array = ArrayUtil.toArray( data.content.Year );
			
			return new ArrayCollection( array );
		}
	}
}