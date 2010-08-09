package com.esri.solutions.flexviewer.widgets.kmlparser
{
	import com.esri.solutions.flexviewer.widgets.zip.ZipFile;
	import com.esri.solutions.flexviewer.widgets.zip.ZipOutput;
	
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.utils.ByteArray;

	

	
	public class KmzFile extends ZipFile
	{
		var files:Array; 
		//private var imageCache:Dictionary = new Dictionary(true);
		var images:Array = new Array();
		public function get fileNum():int{
			return files.length;
		}
		
		public function GetImage(search:String):BitmapData
		{
			
				return images[search];//imageCache.getValue(search);
				
		}
		
		
		public function GetFile(search:String):ByteArray
		{
			var i:int;
			
			for (i = 0; i < files.length; i++) //var f:ZipEntry in files)
			{
				if (files[i].name.search(search) >= 0)
				{
					//zipOutput = new ZipOutput;
					//zipOutput.putNextEntry(files[i]);
					return this.getInput(files[i]);
				}
			}
			
			return null;
		}
		
		private function CreateCache():ByteArray
		{
			var i:int;
			var pattern:RegExp = /((png)|(jpg)|(gif))/i;
			var loader:Loader;
			var ba:ByteArray;
			for (i = 0; i < files.length; i++) //var f:ZipEntry in files)
			{
				if ((files[i].name.search(pattern) >= 0) && (files[i].name.search("__MACOSX") < 0))
				{
				
					loader = new Loader();
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
					loader.name = files[i].name;
					//zipOutput = new ZipOutput;
					//zipOutput.putNextEntry(files[i]);
					try
					{
					ba = this.getInput(files[i]);
					}
					catch (error:Error)
					{
						trace(error.message);
					}
					try
					{
					loader.loadBytes(ba);
					}
					catch (error:Error)
					{
						trace(error.message);
					}
					
				}
			}
			
			return null;
		}
		
		private function onLoaderComplete (event : Event) : void
		{
			var loader:Loader = event.target.loader as Loader;
			
			{
				var bitmapData : BitmapData = new BitmapData
					(loader.content.width, loader.content.height, true);
				
				bitmapData.draw (loader.content);
				images[loader.name] = bitmapData;
			}
		}
		
		public function KmzFile(data:ByteArray)
		{
			super(data);
			files = this.entries;
			CreateCache();
		}
	}
}