/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	
	public class LineStyle extends ColorStyle
	{
		private var _width:Number;
		
		public function LineStyle(list:XMLList)
		{
			var x:XMLList = XMLList(list[0]);
			super(x);
			this._width = ParsingTools.nanCheck(this.x.kml::width);
		}
		
		public function get width():Number{
			return this._width;
		}
		
	}
}