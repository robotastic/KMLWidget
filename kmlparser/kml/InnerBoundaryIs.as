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
	*	Class that represents the &lt;InnerBoundaryIs&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#groundoverlay
	*/
	public class InnerBoundaryIs extends BoundaryCommon
	{
		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function InnerBoundaryIs(x:XMLList)
		{
			super(x);
		}
		
		public override function toString():String {
			return "InnerBoundaryIs: " + super.toString();
		}
	}
}
