/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	
	public class LabelStyle extends ColorStyle
	{
		private var _scale:Number;
		
		public function LabelStyle(list:XMLList)
		{
			var x:XMLList = XMLList(list[0]);
			super(x);
			this._scale = ParsingTools.nanCheck(this.x.kml::scale);
		}
		
		
		public function get scale():Number{
			return this._scale;
		}
	}
}