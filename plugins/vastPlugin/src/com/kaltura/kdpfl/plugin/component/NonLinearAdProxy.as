package com.borhan.bdpfl.plugin.component
{
	
	import com.borhan.bdpfl.plugin.model.UniformVastNonLinearAd;
	import com.borhan.bdpfl.util.Cloner;
	
	import flash.events.Event;
	
	import org.osmf.events.LoaderEvent;
	import org.osmf.media.MediaElement;
	import org.osmf.media.URLResource;
	import org.osmf.traits.LoadState;
	import org.osmf.vast.loader.VASTLoadTrait;
	import org.osmf.vast.loader.VASTLoader;
	import org.osmf.vast.media.VASTMediaGenerator;
	import org.osmf.vast.model.VAST3Translator;
	import org.osmf.vast.model.VASTDataObject;
	import org.osmf.vast.model.VASTTrackingEvent;

	public class NonLinearAdProxy
	{
		public var nonLinearAds : Array;
		public var vastPlugin : vastPluginCode;
		public function NonLinearAdProxy(vast : vastPluginCode)
		{
			
			vastPlugin = vast;
		}
		
		
		public function loadNonLinearAds (nonLinearVastUrl : String) : void
		{
			nonLinearVastUrl = nonLinearVastUrl;
			var nonLinearAdResource : URLResource = new URLResource (nonLinearVastUrl);
			var vastLoader : VASTLoader = new VASTLoader(MAX_NUM_REDIRECTS);
			var vastLoadTrait : VASTLoadTrait = new VASTLoadTrait( vastLoader, nonLinearAdResource );
			vastLoader.addEventListener(LoaderEvent.LOAD_STATE_CHANGE, onVastAdStateChange);
			vastLoader.load(vastLoadTrait);
		}
		
		public function onVastAdStateChange ( e : LoaderEvent ) : void
		{
			if (e.newState == LoadState.READY)
			{
				
				var vastDocument : VASTDataObject  = (e.loadTrait as VASTLoadTrait).vastDocument;
				loadNonLinear(vastDocument);
				
			}

		}
		
		private function loadNonLinear(vastDocument:VASTDataObject) : void
		{
			var vastMediagenerator : VASTMediaGenerator = new VASTMediaGenerator()
			
			var vector :  Vector.<MediaElement> = vastMediagenerator.createMediaElements(vastDocument,VASTMediaGenerator.PLACEMENT_NONLINEAR);; 
			//var vector : Vector.<MediaElement> = vastMediagenerator.createMediaElements(vastDocument,VASTMediaGenerator.PLACEMENT_NONLINEAR);
			
			//vastPlugin.overlays = new Object();
			
			var overlayObject : Object = new Object();
			
			var urls : Vector.<String>;
			if (vastDocument.vastVersion == 3)
			{
				var vast3T:VAST3Translator = vastDocument as VAST3Translator;
				if (vast3T && vast3T.vastObjects)
				{
					for each (var vastObj:VASTDataObject in vast3T.vastObjects)
					{
						loadNonLinear(vastObj);
					}
				}
			}
			else if(vastDocument.vastVersion == 2)
			{
				for (var i:int =0; i < vastDocument["nonlinearArray"].length; i++)
				{
					overlayObject[i] = new UniformVastNonLinearAd( vastDocument["nonlinearArray"][i], 2); 
					
					var trackingData : Object = Cloner.describeObject(vastDocument["nonlinearArray"][i]["trackingData"]);
					
					for each(var tracking:Object in trackingData)
					{
						for(var z:int =0; z<tracking.length; z++)
						{
							if(tracking[z].event)
							{
								var eventType : String = tracking[z].event[0].toString();
								
								urls = new Vector.<String>;
								
								for (var b : int = 0; b < (tracking[z].url as XMLList).length(); b++ )
								{
									urls.push(tracking[z].url[b].toString() );
								}
								
								(overlayObject[i] as UniformVastNonLinearAd).trackingEvents["eventName"] = urls;
							}
						}
					}
					var impressionsArr:Array = new Array();
					if (vastDocument["impressionArray"] && vastDocument["impressionArray"].length > 0)
					{
						for each(var impressionObj:Object in vastDocument["impressionArray"])
						{
							impressionsArr.push(impressionObj.url.toString());
						}
					}
					overlayObject[i].impressions = impressionsArr;
				}
			}
			else if (vastDocument.vastVersion == 1 && vastDocument["ads"].length > 0)
			{
				for (var j:int =0; j < vastDocument["ads"][0]["inlineAd"]["nonLinearAds"].length; j++)
				{
					overlayObject[j] = new UniformVastNonLinearAd(vastDocument["ads"][0]["inlineAd"]["nonLinearAds"][j], 1); 
					for each(var event: VASTTrackingEvent in vastDocument["ads"][0]["inlineAd"]["trackingEvents"])
					{
						urls = new Vector.<String>;
						for (var h:int = 0; h < event.urls.length; h++)
						{
							urls.push(event.urls[h].url);
						}
						(overlayObject[j] as UniformVastNonLinearAd).trackingEvents[event.type] = urls;
					}
					
				}
			}
			vastPlugin.overlays = overlayObject;
			vastPlugin.dispatchEvent(new Event("overlaysLoaded"));
		}
		
		
		private static var MAX_NUM_REDIRECTS : int = 5;

	}
}