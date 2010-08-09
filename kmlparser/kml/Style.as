/* Added by Cecil M. Reid (cmR)
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	
	public class Style extends StyleSelector
	{
		private var _iconStyle:IconStyle;
		private var _labelStyle:LabelStyle;
		private var _lineStyle:LineStyle;
		private var _polyStyle:PolyStyle;
		
		public function Style(x:XMLList)
		{
			super(x);
			if (ParsingTools.nullCheck(this.x.kml::IconStyle) != null) {
				this._iconStyle = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.IconStyle(this.x.kml::IconStyle);
			}
			if (ParsingTools.nullCheck(this.x.kml::LabelStyle) != null) {
				this._labelStyle = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.LabelStyle(this.x.kml::LabelStyle);
			}
			if (ParsingTools.nullCheck(this.x.kml::LineStyle) != null) {
				this._lineStyle = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.LineStyle(this.x.kml::LineStyle);
			}
			if (ParsingTools.nullCheck(this.x.kml::PolyStyle) != null) {
				this._polyStyle = new com.esri.solutions.flexviewer.widgets.kmlparser.kml.PolyStyle(this.x.kml::PolyStyle);
			}
		}
		
		public function get iconStyle():IconStyle{
			return this._iconStyle;
		}
		
		public function get labelStyle():LabelStyle{
			return this._labelStyle;
		}
		
		public function get lineStyle():LineStyle{
			return this._lineStyle;
		}
		
		public function get polyStyle():PolyStyle{
			return this._polyStyle;
		}
	}
}