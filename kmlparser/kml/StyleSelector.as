/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces;
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
	
	public class StyleSelector extends KmlObject
	{
		public function StyleSelector(x:XMLList)
		{
			super(x);
	    }
		
		public override function toString():String{
			return "StyleSelector: " + super.toString();
		}
	}
}