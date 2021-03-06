package com.borhan.bdpfl.style
{
	import com.borhan.bdpfl.ApplicationFacade;
	import com.borhan.bdpfl.controller.IResponder;
	import com.borhan.bdpfl.events.StyleEvent;
	import com.borhan.bdpfl.model.ConfigProxy;
	import com.borhan.bdpfl.model.LayoutProxy;
	import com.borhan.bdpfl.util.URLUtils;
	
	public class KStyleManager
	{
		private var _facade : ApplicationFacade = ApplicationFacade.getInstance();
		
		private var _styleLoader:KStyleLoader;
		
		private var _responder:IResponder;
		
		public function KStyleManager(responder:IResponder)
		{
			_responder = responder;
		}
		
		public function loadStyles():void
		{
			_styleLoader = KStyleLoader.getInstance();
			_styleLoader.addEventListener(StyleEvent.COMPLETE, onSkinLoaded);
			_styleLoader.addEventListener(StyleEvent.ERROR, onSkinLoadError);
			
			var layoutProxy : LayoutProxy = _facade.retrieveProxy( LayoutProxy.NAME ) as LayoutProxy;
			var flashvars : Object = (_facade.retrieveProxy( ConfigProxy.NAME ) as ConfigProxy).vo.flashvars;
			//TODO change the path to a calculated path derived from the current path (for appstudio skin changing) 
			var skinPath:String = layoutProxy.vo.layoutXML.@skinPath;
			if(flashvars.fileSystemMode) //if this is debug mode load the style localy
			{
				if (!skinPath)
				{
					_styleLoader.loadSkin( "assets/skin.swf" , true );
				}
				else
				{
					//This check is necessary for users running the bdp from their file system, if the skin path begins with "/"
					//the skin loader automatically loads the skin from this location, instead of the locaion which is relative to the bdp3.swf
					if (skinPath.indexOf("/") == 0)
					{
						skinPath = skinPath.substring(1);
					}
					_styleLoader.loadSkin(skinPath, true);

				}
			}	
			else
			{
				//var skinPath:String = layoutProxy.vo.layoutXML.@skinPath;				
				if(!URLUtils.isHttpURL(skinPath))
					skinPath = flashvars.httpProtocol + flashvars.cdnHost + skinPath;
				
				_styleLoader.loadSkin( skinPath );
			}
		}
		
		private function onSkinLoaded( event :StyleEvent ):void
		{
			_responder.result(null);
		}
		
		private function onSkinLoadError ( event : StyleEvent ) : void
		{
			_responder.fault( null );
		}
	}
}