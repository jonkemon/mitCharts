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
			var tempRegionService:String = model.tempCheckBoxData;
			var empty:String = "";
			var tempXMLNode:XMLNode = new XMLNode(1, tempRegionService);
			//tempXMLNode.nodeName = tempRegionService;

			for(var i:int = 0; i<model.appYearData.Year.length(); i++){
				model.appYearData.Year[i].replace(tempRegionService, empty);
				//model.appYearData.Year[i].tempXMLNode = 0;
			}
			model.appYearData.normalize();
			trace(model.appYearData);
			
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