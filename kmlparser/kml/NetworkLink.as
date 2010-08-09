/*
* Copyright 2008 Google Inc. 
* Licensed under the Apache License, Version 2.0:
*  http://www.apache.org/licenses/LICENSE-2.0
*/
package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	//import com.esri.solutions.flexviewer.widgets.kmlparser.atom.Link;
	import com.esri.solutions.flexviewer.widgets.kmlparser.KMLUtil;
	import com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces;
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
	/**
	*	Class that represents the &lt;Folder&gt; element.
	* 
	* 	@see http://code.google.com/apis/kml/documentation/kmlreference.html#folder
	*/
	public class NetworkLink extends Container
	{
		private var _url:Link;
		/**
		* Constructor for the class.
		*  
		* @param x
		*/	
		public function NetworkLink(x:XMLList)
		{
			super(x);
			
			if (ParsingTools.nullCheck(this.x.kml::Link)) {
				this._url = new Link(this.x.kml::Link);
			}
			
			if (ParsingTools.nullCheck(this.x.kml::Url)) {
				this._url = new Link(this.x.kml::Url);
			}
		}
	
		public function get url():Link {
			return this._url;
		}
		
		public override function toString():String {
			return "NetworkLink: " + super.toString();
		}
	}
}
