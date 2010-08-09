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
	*	Class that represents a &lt;Data&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#data
	*/
	public class Data extends Feature
	{
		private var _name:String;
		private var _displayName:String;
    private var _value:String;
		
		/**
		*	Constructor for class.
		* 
		*	@param x
		*/	
		public function Data(x:XMLList)
		{
			super(x);
      this._name = ParsingTools.nullCheck(this.x.attribute(new QName(kml, "name")));
      this._displayName = ParsingTools.nullCheck(this.x.kml::displayName);
      this._value = ParsingTools.nullCheck(this.x.kml::value);
		}	

		/**
		*	Represents the &lt;name&gt; child element.
		*/
		public override function get name():String {
			return this._name;
		}

		/**
		*	Represents the &lt;displayName&gt; child element.
		*/
		public function get displayName():String {
			return this._displayName;
		}
		
		/**
		*	Represents the &lt;value&gt; child element.
		*/
		public function get value():String {
			return this._value;
		}

		public override function toString():String {
			return "Data: " + " name: " + this._name + ", value: " + this._value;
		}
	}
}
