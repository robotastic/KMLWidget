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

	/**
	*	Class that represents a &lt;Polygon&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#polygon
	*/
	public class KmlPolygon extends Geometry
	{
		// Can contain: <extrude>, <tessellate>, <altitudeMode>, <coordinates>, <outerBoundaryIs>, <innerBoundaryIs>*
		// We support coordinates only
		// @todo add innerBoundaryIs support
		
		private var _outerBoundaryIs:OuterBoundaryIs;		
		private var _innerBoundaryIs:InnerBoundaryIs;		
		
  		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/
		public function KmlPolygon(x:XMLList)
		{
			super(x);
			
			this._outerBoundaryIs = new OuterBoundaryIs(this.x.kml::outerBoundaryIs);
			this._innerBoundaryIs = new InnerBoundaryIs(this.x.kml::innerBoundaryIs);
			
		}
		
		/**
		*	Represents the &lt;outerBoundaryIs&gt; child element.
		*/
		public function get outerBoundaryIs():OuterBoundaryIs {
			return this._outerBoundaryIs;
		}
		
		public function get innerBoundaryIs():InnerBoundaryIs {
			return this._innerBoundaryIs;
		}
		
		public override function toString():String {
			return "Polygon: " + "outerBoundaryIs: " + this._outerBoundaryIs;
		}
	}
}
