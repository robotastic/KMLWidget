/*
* Copyright 2008 Google Inc. 
* Licensed under the Apache License, Version 2.0:
*  http://www.apache.org/licenses/LICENSE-2.0
*/
package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
    import com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces;
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
	import com.esri.solutions.flexviewer.widgets.kmlparser.KMLUtil;
	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.Polygon;

	/**
	*	A container for zero or more geometry primitives associated with the same feature.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#multigeometry
	*/
	public class MultiGeometry extends Geometry
	{
		private var _geometries:Array;
		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function MultiGeometry(x:XMLList)
		{
			//super(x);
			
			this._geometries = new Array();
			// Geometries are: Point, LineString, LinearRing, Polygon, MultiGeometry, Model
			// We won't support Model
			
		
			/*var i:XML;
            for each (i in this.x.kml::KmlPoint) {
                this._geometries.push(KMLUtil.parseKMLPoint(XMLList(i)));
            }
            for each (i in this.x.kml::LineString) {
                this._geometries.push(KMLUtil.parseKMLLineString(XMLList(i)));
            }
            for each (i in this.x.kml::LinearRing) {
                this._geometries.push(new Polygon([KMLUtil.parseKMLLinearRing(XMLList(i))]));
            }
            for each (i in this.x.kml::Polygon) {
                this._geometries.push(KMLUtil.parseKMLPolygon(XMLList(i)));
            }
            for each (i in this.x.kml::MultiGeometry) {
                this._geometries = this._geometries.concat(new MultiGeometry(XMLList(i)));
            }*/
		}
		
		/**
        *   An array of child features of this container.
        */  
        public function get geometries():Array
        {
            return this._geometries;
        }
        
		public override function toString():String {
			return "MultiGeometry: " + super.toString();
		}
	}
}
