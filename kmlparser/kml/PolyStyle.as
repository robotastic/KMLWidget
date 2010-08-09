/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	
	public class PolyStyle extends ColorStyle
	{
		private var _fill:Boolean;
		private var _outline:Boolean;
		
		public function PolyStyle(list:XMLList)
		{
			var x:XMLList = XMLList(list[0]);
			super(x);
			this._fill = true;
			this._outline = true;
			
			var fill:Number = ParsingTools.nanCheck(this.x.kml::fill);
			if (fill == 1) {
				this._fill = true;
			} else if (fill == 0) {
				this._fill = false;
			}
			
			var outline:Number = ParsingTools.nanCheck(this.x.kml::outline);
			if (outline == 1) {
				this._outline = true;
			} else if (outline == 0) {
				this._outline = false;
			}
			
		}
		
		public function get fill():Boolean{
			return this._fill;
		}
		
		public function get outline():Boolean{
			return this._outline;
		}
	}
}