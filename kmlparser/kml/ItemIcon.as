/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	
	public class ItemIcon extends Icon
	{
		private var _state:String;
		
		public function ItemIcon(x:XMLList)
		{
			super(x);
			this._state = ParsingTools.nullCheck(this.x.kml::state);
		}
		
		public function get state():String{
			return this._state;
		}
	}
}