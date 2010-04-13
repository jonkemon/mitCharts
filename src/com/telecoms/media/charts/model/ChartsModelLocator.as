package com.telecoms.media.charts.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ChartsModelLocator
	{
		static public var __instance:ChartsModelLocator=null;
		public var appYearData:XML = new XML;
		public var years:ArrayCollection = new ArrayCollection( [{ Date: "2009" },{ Date: "2010" },{ Date: "2011" },{ Date: "2012" },{ Date: "2013" }]);
		public var yearRegion:ArrayCollection = new ArrayCollection;
		public var explodingArray:Array = [0,0,0,0,0,0];
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