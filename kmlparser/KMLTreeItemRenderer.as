/*package events
	
{
	import flash.events.Event;
	
	public class LocateEvent extends Event {
		
		public var formatSelected:String;
		
		public function LocateEvent(type:String){
			
			super(type);
			
		} } }*/

package com.esri.solutions.flexviewer.widgets.kmlparser
{
	// itemRenderers/tree/myComponents/MyTreeItemRenderer.as
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.*;
	import mx.controls.CheckBox;
	import mx.controls.Image;
	import mx.controls.treeClasses.*;
	
	public class KMLTreeItemRenderer extends TreeItemRenderer
	{
		private var visibleCheck:CheckBox;
		
		// Define the constructor.      
		public function KMLTreeItemRenderer() {
			super();
		}
		
		private  function visibleCheckEvent(event:Event):void
			
		{
			
			var e:Event = new Event("visible",true,true);
			event.stopPropagation();
			dispatchEvent(e);
			
		}
		
		override  protected function createChildren():void
			
		{
			
			super.createChildren();
			
			visibleCheck = new CheckBox();
			visibleCheck.addEventListener(MouseEvent.CLICK,visibleCheckEvent);
			
			
			
			this.addChild(visibleCheck);
			
		}
		
		// Override the set method for the data property
		// to set the font color and style of each node.        
		override public function set data(value:Object):void {
			
			super.data = value;
			if (value != null)
			{
			if(TreeListData(super.listData).hasChildren)
			{
				//setStyle("color", 0xff0000);
				setStyle("fontWeight", 'bold');
			}
			else
			{
				//setStyle("color", 0x000000);
				setStyle("fontWeight", 'normal');
			}  
			}
		}
		
		// Override the updateDisplayList() method 
		// to set the text for each tree node.      
		override protected function updateDisplayList(unscaledWidth:Number, 
													  unscaledHeight:Number):void {
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			
			visibleCheck.x=label.textWidth+label.x+10;
			visibleCheck.y = label.y + 8;
			
			if(super.data)
			{
				this.toolTip = super.data.description;
				visibleCheck.selected = super.data.visible;
				if (super.data.visible)
				{
					setStyle("color", 0xffffff);
					
				}
				else
				{
					setStyle("color", 0x666666);
				}
			}
		}
	}
}
// ActionScript file