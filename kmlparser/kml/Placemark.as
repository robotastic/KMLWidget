/*
* Copyright 2008 Google Inc. 
* Licensed under the Apache License, Version 2.0:
*  http://www.apache.org/licenses/LICENSE-2.0
*/
package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
    import com.esri.ags.geometry.Geometry;
    import com.esri.ags.geometry.Polygon;
    import com.esri.solutions.flexviewer.widgets.kmlparser.KMLUtil;
    import com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces;
    import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
    import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
    
    import mx.collections.ArrayCollection;

	
	/**
	*	Class that represents a &lt;Placemark&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#placemark
	*/
	public class Placemark extends Feature
	{
		private var _geometry:ArrayCollection; //com.esri.ags.geometry.Geometry;
		private var _extended_data:ExtendedData;
		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function Placemark(x:XMLList)
		{
			super(x);
			
			// Features are: <Point>, <LineString>, <LinearRing>, <Polygon>, <MultiGeometry>, <Model>
			// We'll only support <Point>, <LineString>, <LinearRing>, <Polygon>, <MultiGeometry>
			if (ParsingTools.nullCheck(this.x.kml::Point)) {
				this._geometry = new ArrayCollection([KMLUtil.parseKMLPoint(this.x.kml::Point)]);
			}
			if (ParsingTools.nullCheck(this.x.kml::LineString)) {
				this._geometry = new ArrayCollection([KMLUtil.parseKMLLineString(this.x.kml::LineString)]);
			}
			if (ParsingTools.nullCheck(this.x.kml::LinearRing)) {
			
				
					this._geometry = new ArrayCollection([new Polygon([KMLUtil.parseKMLLinearRing(this.x.kml::LinearRing)])]);
				
			}
			if (ParsingTools.nullCheck(this.x.kml::Polygon)) {
				
					this._geometry = new ArrayCollection([KMLUtil.parseKMLPolygon(this.x.kml::Polygon)]);
				
			}
			if (ParsingTools.nullCheck(this.x.kml::MultiGeometry)) {
        			this._geometry =  new ArrayCollection(KMLUtil.parseKMLMultiGeometry(this.x.kml::MultiGeometry));
      }
		/*	if (ParsingTools.nullCheck(this.x.kml::ExtendedData)) {
        this._extended_data = new ExtendedData(this.x.kml::ExtendedData);
      }   */
		}
		
		/**
		*	Represents the child geometry element (there can be only one).
		*/
		public function get geometry():ArrayCollection {
			return this._geometry;
		}
		
		public function get extendedData():ExtendedData {
			return this._extended_data;
		}
		
		public override function toString():String {
			return "Placemark: " + " geometry: " + this._geometry;
		}
	}
}
