package com.telecoms.media.charts.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ChartsModelLocator
	{
		static public var __instance:ChartsModelLocator=null;
		public var appYearData:XML = new XML;
		public var serviceYearData:XML = new XML;
		public var dataState:Boolean = true;
		public var convertedXML:ArrayCollection = new ArrayCollection;
		public var convertedServiceXML:ArrayCollection = new ArrayCollection;
		public var explodingArray:Array = [0,0,0,0,0,0];
		public var refactoredPieData:ArrayCollection = new ArrayCollection;
		static public function getInstance():ChartsModelLocator
		{
			if(__instance == null)
			{
				__instance = new ChartsModelLocator();
			}
			return __instance;
		}
	}	
}