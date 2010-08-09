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
	*	Class that represents a &lt;LatLonBox&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#latlonbox
	*/
	public class LatLonBox extends AbstractLatLonBox
	{
		//todo: add constants for the enum values?
		
		private var _rotation:Number;		
  
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function LatLonBox(x:XMLList)
		{
			super(x);
			this._rotation  = ParsingTools.nanCheck(this.x.kml::west);
		}
	 	
	 	
	 	/**
		*	Represents the &lt;rotation&gt; child element.
		*/	
		public function get rotation():Number
		{
			return this._rotation;
	 	}
	 	
	 	public override function toString():String {
	 		return "LatLonBox: " + super.toString() + " rotation: " + this._rotation;
	 	}
	}
}
