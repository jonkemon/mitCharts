package com.telecoms.media.charts.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.telecoms.media.charts.control.delegates.LoadServiceYearDelegate;
	import com.telecoms.media.charts.model.ChartsModelLocator;
	
	import flash.external.ExternalInterface;
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;
	import mx.utils.ArrayUtil;

	public class LoadServiceYearCommand implements ICommand
	{		
		private var model:ChartsModelLocator = ChartsModelLocator.getInstance();
		private	var c:int = 0;
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onResults,onFault);
			var delegate:LoadServiceYearDelegate = new LoadServiceYearDelegate(responder);
			delegate.loadPhotos();
		}
		private function onFault(event:FaultEvent):void
		{
			Alert.show('No XML file was found...');
		}
		private function onResults(event:ResultEvent):void
		{
			model.serviceYearData = event.token.result as XML;
			model.convertedServiceXML = convertXmlToArrayCollection(model.serviceYearData);
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