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
	*	Class that represents a &lt;Point&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#point
	*/
	public class KmlPoint extends Geometry
	{
		private var _coordinates:Coordinates;
		
  
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function KmlPoint(x:XMLList)
		{
			super(x);
			trace("t");
			trace(this.x);
			trace("e");
			if (ParsingTools.nullCheck(this.x.kml::coordinates) != null) {
				this._coordinates = new Coordinates(ParsingTools.nullCheck(this.x.kml::coordinates));
			}
		}
	 	
		/**
		*	Represents the &lt;coordinates&gt; child element.
		*/	
		public function get coordinates():Coordinates
		{
			return this._coordinates;
	 	}
	 	
	 	public override function toString():String {
	 		return "Point: " + this._coordinates;	
	 	}
	}
}
