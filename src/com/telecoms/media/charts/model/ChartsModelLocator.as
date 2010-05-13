package com.telecoms.media.charts.model
{
	import com.telecoms.media.charts.view.charts.CheckBoxLegend;
	
	import mx.charts.ColumnChart;
	import mx.charts.PieChart;
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ChartsModelLocator
	{
		static public var __instance:ChartsModelLocator=null;
		public var appYearData:XML = new XML;
		public var appYearDataClone:XML = new XML;
		public var serviceYearData:XML = new XML;
		public var serviceYearDataClone:XML = new XML;
		public var dataState:Boolean = true;
		public var dataNumberSwitch:int;
		public var convertedXML:ArrayCollection = new ArrayCollection;
		public var convertedServiceXML:ArrayCollection = new ArrayCollection;
		public var explodingArray:Array = [0,0,0,0,0,0];
		public var refactoredPieData:ArrayCollection = new ArrayCollection;
		public var tempCheckBoxData:String;
		public var tempNameStore:XML = new XML;
		public var storedKeyData:ArrayCollection = new ArrayCollection([
			{Country:"one"}, 
			{Country:"two"}, 
			{Country:"three"}, 
			{Country:"four"}, 
			{Country:"five"}, 
			{Country:"six"}]);
		public var storedKeys:Array = ["none"];
		public var tempRegionService:String = new String;
		
		public var stackedColumnChart:ColumnChart = new ColumnChart;
		public var servicesColumnChart:ColumnChart = new ColumnChart;
		public var as3ChartLegend:CheckBoxLegend = new CheckBoxLegend;
		
		public var chart:PieChart = new PieChart;
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