/*
* Copyright 2008 Google Inc. 
* Licensed under the Apache License, Version 2.0:
*  http://www.apache.org/licenses/LICENSE-2.0
*/
package com.google.maps.extras.xmlparsers.kml
{
    import com.google.maps.extras.xmlparsers.Namespaces;
	import com.google.maps.extras.xmlparsers.ParsingTools;
	import com.google.maps.extras.xmlparsers.XmlElement;

	/**
	*	Class that represents a &lt;coordinates&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#coordinates
	*/
	public class Coordinates 
	{
		private var _coordsList:Array;		
  
		/**
		*	Constructor for class.
		* 
		*	@param x
		*
		*/	
		public function Coordinates(string:String)
		{
			var re:RegExp = /(\s|\n|\r)+/;
			var stringSplit:Array = string.split(re);
			_coordsList = new Array();
			for (var i:Number = 0; i < stringSplit.length; i++) {
				if (stringSplit[i].length < 5) continue;
				var coordinate:Object = new Object();
				var coordString:Array = stringSplit[i].split(",");
				coordinate.lon = Number(coordString[0]);
				coordinate.lat = Number(coordString[1]);
				coordinate.alt = Number(coordString[2]);
				_coordsList.push(coordinate);
			}
		}
	 	
	 	
	 	/**
		*	Represents a list of coordinate objects. A coordinate object has lat, lon, and alt properties.
		*/	
		public function get coordsList():Array
		{
			return this._coordsList;
	 	}
	 	
	 	public function toString():String {
	 		var string:String = "";
	 		for (var i:uint = 0; i < this._coordsList.length; i++) {
	 		    string += this._coordsList[i].lon + ", " + this._coordsList[i].lat + ", " + this._coordsList[i].alt + ";";
	 		}	
	 		return "Coordinates: " + string;
	 	}
	}
}
