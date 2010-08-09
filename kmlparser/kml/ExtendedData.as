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
	*	Class that represents the &lt;Extendeddata&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#extendeddata
	*/
	public class ExtendedData extends Container
	{
    private var _data: Array;
		
		/**
		* Constructor for the class.
		*  
		* @param x
		*/	
		public function ExtendedData(x:XMLList)
		{
			super(x);
      this._data = new Array();
      var i:XML;
      for each (i in this.x.kml::Data) {
        this._data.push(new com.esri.solutions.flexviewer.widgets.kmlparser.kml.Data(XMLList(i)));
      }
		}
		
		public override function toString():String {
			return "ExtendedData: " + super.toString();
		}

    /**
    *       Represents the &lt;data&gt; child element.
    */ 
    public function get data():Array {
      return this._data;
    }
	}
}
