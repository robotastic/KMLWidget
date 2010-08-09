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
	*	Class that represents any generic KML object. Extended by all KML elements.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#object
	*/
	public class KmlObject extends XmlElement
	{
		public var kml:Namespace = Namespaces.KML_NS;
		
		public var _id:String;
		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function KmlObject(x:XMLList)
		{
			super(x);
			var idQN:QName = new QName(kml, "id");
            this._id = ParsingTools.nullCheck(this.x.attribute(idQN));		}

		/**
		*	Represents the id attribute of the element.
		*/	
		public function get id():String
		{
			return this._id;
	 	}
	 	
	 	public function toString():String {
	 		return "KmlObject with id: " + this._id;
	 	}
	}
}
