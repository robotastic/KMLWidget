/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;

	public class IconStyle extends ColorStyle
	{
		private var _scale:Number;
		private var _heading:Number;
		private var _icon:com.esri.solutions.flexviewer.widgets.kmlparser.kml.Icon;
		private var _hotSpot:com.esri.solutions.flexviewer.widgets.kmlparser.kml.HotSpot;
		
		public function IconStyle(list:XMLList)
		{
			var x:XMLList = XMLList(list[0]);
			
			super(x);
			this._scale = ParsingTools.nanCheck(this.x.kml::scale);
			this._heading = ParsingTools.nanCheck(this.x.kml::heading);
			
			if (ParsingTools.nullCheck(this.x.kml::Icon) != null) {
				this._icon = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.Icon(this.x.kml::Icon);
			}
			if (ParsingTools.nullCheck(this.x.kml::hotSpot) != null) {
				this._hotSpot = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.HotSpot(this.x.kml::hotSpot);
			}
		}
		
		public function get scale():Number
		{
			return this._scale;
		}
		
		public function get heading():Number
		{
			return this._heading;
		}
		
		public function get icon():com.esri.solutions.flexviewer.widgets.kmlparser.kml.Icon{
			return this._icon;
		}
		
		public function get hotSpot():com.esri.solutions.flexviewer.widgets.kmlparser.kml.HotSpot{
			return this._hotSpot;
		}
	}
}