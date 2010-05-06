package com.telecoms.media.charts.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.telecoms.media.charts.control.delegates.LoadAppYearDelegate;
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
			Alert.show('No XML file was found...');
		}
		private function onResults(event:ResultEvent):void
		{
			model.appYearData = event.token.result as XML;
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