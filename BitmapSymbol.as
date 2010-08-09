package com.esri.solutions.flexviewer.widgets
{
	import com.esri.ags.Map;
	import com.esri.ags.geometry.Geometry;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.symbol.Symbol;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public final class BitmapSymbol extends Symbol
	{
		private var m_bitmapData:BitmapData;
		
		private var m_hotSpotX:Number;
		
		private var m_hotSpotY:Number;
		
		private const m_matrix:Matrix = new Matrix();
		
		public function BitmapSymbol(bitmapData:BitmapData, hotSpotX:Number, hotSpotY:Number)
		{
			m_bitmapData = bitmapData;
			m_hotSpotX = hotSpotX;
			m_hotSpotY = hotSpotY;
		}
		
		override public function clear(sprite:Sprite):void
		{
			sprite.graphics.clear();
		}
		
		override public function draw(sprite:Sprite, geometry:Geometry, attributes:Object, map:Map):void
		{
			const point:MapPoint = geometry as MapPoint;
			
			sprite.x = toScreenX(map, point.x);
			sprite.y = toScreenY(map, point.y);
			
			m_matrix.a = 1.0;
			m_matrix.d = 1.0;
			m_matrix.tx = 0.0 - m_hotSpotX;
			m_matrix.ty = 0.0 - m_hotSpotY;
			
			sprite.graphics.beginBitmapFill(m_bitmapData, m_matrix, false, true);
			sprite.graphics.drawRect(m_matrix.tx, m_matrix.ty, m_bitmapData.width, m_bitmapData.height);
			sprite.graphics.endFill();
		}
	}
}
	