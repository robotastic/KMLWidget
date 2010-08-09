////////////////////////////////////////////////////////////////////////////////
//
// Copyright © 2008 - 2009 ESRI
//
// All rights reserved under the copyright laws of the United States.
// You may freely redistribute and use this software, with or
// without modification, provided you include the original copyright
// and use restrictions.  See use restrictions in the file:
// <install location>/FlexViewer/License.txt
//
////////////////////////////////////////////////////////////////////////////////

package com.esri.solutions.flexviewer.widgets.kmlparser
{

	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.geometry.Polygon;
	import com.esri.ags.geometry.Polyline;
	import com.esri.solutions.flexviewer.utils.Namespaces;
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
	//import com.esri.solutions.flexviewer.widgets.kmlparser.kml.Polygon;
	import com.esri.solutions.flexviewer.widgets.kmlparser.kml.MultiGeometry;
	
	import mx.utils.StringUtil;
	    
	public class KMLUtil
	{
	    
		
		private static const kml:Namespace = com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces.KML_NS;
		
	     
	    public function KMLUtil(singletonEnforcer:SingletonEnforcer)
	    {
	    }
	
	/*	
	    public static function toGeometry(x:XML):Geometry
	    {
			

			
	        var georssPoint:String = String(x.GEORSS::point);
	        if (georssPoint)
	        {
	            return parseGeoRSSPoint(georssPoint);
	        }
	        var georssLine:String = String(x.GEORSS::line);
	        if (georssLine)
	        {
	            return parseGeoRSSLine(georssLine);
	        } 
	        var georssPolygon:String = String(x.GEORSS::polygon);
	        if (georssPolygon)
	        {
	            return parseGeoRSSPolygon(georssPolygon);
	        }    
	        var pointList:XMLList = x.GEO::point;
	        if (pointList && pointList.length() > 0)
	        {
	            var geoPoint:XML = pointList[0];
	            var getLat:Number = Number(geoPoint.GEO::lat);
	            var geoLon:Number = Number(geoPoint.GEO::long);
	            return new MapPoint(geoLon, getLat);
	        }
	        var whereList:XMLList = x.GEORSS::where;
	        if (whereList && whereList.length() > 0)
	        {
	            var pos:String = whereList[0].GML::Point[0].GML::pos[0];
	            var arr:Array = pos.split(" ");
	            var gmlLat:Number = Number(arr[0]);
	            var gmlLon:Number = Number(arr[1]);
	            return new MapPoint( gmlLon, gmlLat );
	        }
	        var georssLat:String = String(x.GEOLL::lat);
	        var georssLong:Number = Number(x.GEOLL::long);
	        if ((georssLong) && (georssLat)) 
	        {
	        	return new MapPoint(Number(georssLong), Number(georssLat));
	        }                        
	        return null;
	    }
	    
	    private static function parseGeoRSSWhere(x:XML):Geometry
	    {
	        return null;
	    }*/
	    

	    
		public static function parseKMLPoint(x:XMLList):Geometry
			{
				if (ParsingTools.nullCheck(x.kml::coordinates) != null) {
					return parsePoint(ParsingTools.nullCheck(x.kml::coordinates));
				}	
				return null;
			}
		
		// Can contain: <extrude>, <tessellate>, <altitudeMode>, <coordinates>
		// We support coordinates only
		public static function parseKMLLineString(x:XMLList): Geometry
		{
			if (ParsingTools.nullCheck(x.kml::coordinates) != null) {
				return parseLine(ParsingTools.nullCheck(x.kml::coordinates));
			}	
			return null;
		}
		
		// Can contain: <extrude>, <tessellate>, <altitudeMode>, <coordinates>, <outerBoundaryIs>, <innerBoundaryIs>*
		// We support coordinates only
		public static function parseKMLPolygon(x:XMLList):com.esri.ags.geometry.Geometry
		{
			var i:XML;
			var rings:Array = new Array;
			
		if (ParsingTools.nullCheck(x.kml::outerBoundaryIs) != null) {
			
			
				
					 rings.push(parseKMLOuterBoundaryIs(x.kml::outerBoundaryIs));
				
				
			}
		
			if (ParsingTools.nullCheck(x.kml::innerBoundaryIs) != null) {
				rings = rings.concat(parseKMLInnerBoundaryIs(x.kml::innerBoundaryIs));
				
				
			}
			
			var poly:Polygon = new Polygon(rings);
			
			return poly;
		}
		
		public static function parseKMLOuterBoundaryIs(x:XMLList):Array
		{
			if (ParsingTools.nullCheck(x.kml::LinearRing)) {
				 return parseKMLLinearRing(x.kml::LinearRing);
			}
			return null;
		}
		
		public static function parseKMLMultiGeometry(x:XMLList):Array
		{
			var geometries:Array = new Array();
			// Geometries are: Point, LineString, LinearRing, Polygon, MultiGeometry, Model
			// We won't support Model	
			
			var i:XML;
			for each (i in x.kml::Point) {
				geometries.push(KMLUtil.parseKMLPoint(XMLList(i)));
			}
			for each (i in x.kml::LineString) {
				geometries.push(KMLUtil.parseKMLLineString(XMLList(i)));
			}
			for each (i in x.kml::LinearRing) {
				geometries.push(new Polygon([KMLUtil.parseKMLLinearRing(XMLList(i))]));
					}
			for each (i in x.kml::Polygon) {
				geometries.push(KMLUtil.parseKMLPolygon(XMLList(i)));
			}
			for each (i in x.kml::MultiGeometry) {
				geometries = geometries.concat(new MultiGeometry(XMLList(i)));
			}
			return geometries;
		}
		
		public static function parseKMLInnerBoundaryIs(x:XMLList) :Array
		{
			var i:XML;
			var list:XMLList;
			var rings:Array = new Array;
			if (ParsingTools.nullCheck(x.kml::LinearRing)) {
				
				for each (i in x.kml::LinearRing) {
					list = new XMLList(i);
					if (ParsingTools.nullCheck(list)) {
						rings.push(parseKMLLinearRing(list));
					}
					
				}
				return rings; // parseKMLLinearRing(x.kml::LinearRing);
			}
			return null;
		}
		
		// Can contain: <extrude>, <tessellate>, <altitudeMode>, <coordinates>
		// We support coordinates only
		public static function parseKMLLinearRing(x:XMLList):Array
		{
			if (ParsingTools.nullCheck(x.kml::coordinates) != null) {
				return parseRing(ParsingTools.nullCheck(x.kml::coordinates));
			}	
			return null;
		}
		
		public static function parsePoint(string:String):MapPoint
		{
			var re:RegExp = /(\s|\n|\r)+/;
			var stringSplit:Array = string.split(re);
			if (stringSplit[0].length < 5) return null;
			var coordString:Array = stringSplit[0].split(",");
			return new MapPoint(Number(coordString[0]), Number(coordString[1]));		
		}
		
		public static function parseRing(string:String):Array
		{
			var re:RegExp = /(\s|\n|\r)+/;
			var stringSplit:Array = string.split(re);
			var path:Array = [];
			
			
			for (var i:Number = 0; i < stringSplit.length; i++) {
				if (stringSplit[i].length < 5) continue;
				var coordString:Array = stringSplit[i].split(",");
				var lon:Number = Number(coordString[0]);
				var lat:Number = Number(coordString[1]);
				
				path.push(new MapPoint(lon, lat));   
				
			}
			return path;    
			//return new Polygon([path]);    
		}
		
		public static function parseLine(string:String):com.esri.ags.geometry.Geometry
		{
			var re:RegExp = /[-\d.]+,[-\d.]+,[-\d.]+/g;///(\s|\n|\r)+/; (\s|\n|\r|,)+
			var stringSplit:Array = string.match(re);  //split(re);
			var path:Array = [];
			
			
			for (var i:Number = 0; i < stringSplit.length; i++) {
				if (stringSplit[i].length < 5) continue;
				var coordString:Array = stringSplit[i].split(",");
				var lon:Number = Number(coordString[0]);
				var lat:Number = Number(coordString[1]);
				
				path.push(new MapPoint(lon, lat));   
				
			}
			
			return new Polyline([path]);    
		}
		
		/*
	    private static function parseGeoRSSLine(text:String):Geometry
	    {
	    	var path:Array = [];
	        var tokens:Array = StringUtil.trim(text).split(" ");
	        if (tokens.length > 3)
	        {
		        for (var i:int = 0, j:int = 1; j < tokens.length; i+=2, j+=2 )
		        {
		            var lat:Number = Number(tokens[i]);
		            var lon:Number = Number(tokens[j]);
		            path.push(new MapPoint(lon, lat));   
		        }
	        }
	        return new Polyline([path]);    
	    }
	    
	    private static function parseGeoRSSPolygon(text:String):Geometry
	    {
	        var path:Array = [];
	        var tokens:Array = StringUtil.trim(text).split(" ");
	        for (var i:int = 0, j:int = 1; j < tokens.length; i+=2, j+=2 )
	        {
	            var lat:Number = Number(tokens[i]);
	            var lon:Number = Number(tokens[j]);
	            path.push(new MapPoint(lon, lat));   
	        }
	        return new Polygon([path]);
	    }*/
	
	}
}

class SingletonEnforcer
{    
}