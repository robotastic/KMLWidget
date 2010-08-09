/* Added by Cecil M. Reid
 * cecilmreid@gmail.com	
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.kml
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	

	
	public class ColorStyle extends KmlObject
	{
		private var _color:uint;
		private var _alpha:Number;
		private var _colorMode:String;
		
		private  function setKmlColor(kmlColor:String):void
		{
			
			var abgr:uint = parseInt(kmlColor,16);
			var alphaUint:uint =(abgr>> 24) & 0xFF;
			var blueUint:uint = (abgr >> 16) & 0xFF;
			var greenUint:uint = (abgr >> 8) & 0xFF;
			var redUint:uint = abgr  & 0xFF;

			var colorUint:uint = (redUint << 16);
			colorUint += (greenUint << 8);
			colorUint += (blueUint);
			
			this._color = colorUint;
			this._alpha = alphaUint / 255;
			
		}
		
		public function ColorStyle(x:XMLList)
		{
			super(x);
			
			var colorStr:String = ParsingTools.nullCheck(this.x.kml::color);
			
			if (colorStr)
			{
				/*colorStr = colorStr.substring(2,colorStr.length);
				this._color = parseInt("0x" + colorStr);*/
				setKmlColor(colorStr);
				}
			this._colorMode = ParsingTools.nullCheck(this.x.kml::colorMode);
		}
		
		public function get color():uint{
			return this._color;
		}
		
		public function get alpha():Number{
			return this._alpha;
		}
		
		public function get colorMode():String{
			return this._colorMode;
		}
	}
}