package com
{
	import com.borhan.BorhanClient;
	import com.borhan.commands.MultiRequest;
	import com.borhan.commands.baseEntry.BaseEntryAnonymousRank;
	import com.borhan.commands.baseEntry.BaseEntryGet;
	import com.borhan.controls.Stars;
	import com.borhan.events.BorhanEvent;
	import com.borhan.vo.BorhanBaseEntry;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.patterns.proxy.Proxy;

	/**
	 * Class starsMediator manages the communication between the BDP and the Stars component. 
	 * @author Hila
	 * 
	 */	
	public class starsMediator extends Mediator
	{
		/**
		 * The view component of the plugin. 
		 */		
		public var stars : Stars;
		/**
		 * Flag indicating whether the stars are static or editable (can be used to rank the entry). 
		 */		
		public var editable : Boolean;
		/**
		 * Parameter holds the initial rank the stars are showing. 
		 */		
		public var rating : Number;
		/**
		 * Parameter holds the BDP's MediaProxy. 
		 */		
		public var mediaProxy : Proxy;
		/**
		 *Name of the optional, external rating function 
		 */		
		public var externalSetRatingFunction : String;
		/**
		 * Name of the optional, external function which returns the current rank of the entry 
		 */		
		public var externalGetRatingFunction : String;
		/**
		 * This parameter holds the entryId of the last entry rated. 
		 */		
		private var lastEntryId : String = "";
		
		private var _useExternalRatingSystem : Boolean = false;
		/**
		 * Name of the mediator. 
		 */		
		private static var NAME:String = "starsMediator";
		/**
		 * Constructor
		 * @param newStars a new view component for the plugin.
		 * @param isEditable boolean indicating whether the stars are static or open for ranking.
		 * @param startRank the initial rank the stars should display.
		 * 
		 */			
		public function starsMediator( newStars : Stars, isEditable : Boolean, startRank : Number )
		{
			super(NAME, viewComponent);
			stars = newStars;
			rating = startRank;
			editable = isEditable;
		}
		/**
		 * Getter for the view component. 
		 * @return 
		 * 
		 */		
		public function get view () : DisplayObject
		{
			return viewComponent as DisplayObject;
		}
		/**
		 * Function returns the array of BDP notifications that are of interest to the plugin. 
		 * @return 
		 * 
		 */		
		override public function listNotificationInterests():Array
		{
			var intNotes:Array = ["mediaReady"];
			return intNotes;
		}
		/**
		 * Noitifcation handler of the Plugin. 
		 * @param notification the BDP notification intercepted by the mediator.
		 * 
		 */		
		override public function handleNotification(notification:INotification):void
		{
			mediaProxy = getProxy();
			var currId : String = mediaProxy["vo"]["entry"]["id"];
			if(lastEntryId !=  currId){
				lastEntryId = currId;
				var entry : BorhanBaseEntry = mediaProxy["vo"]["entry"] as BorhanBaseEntry;
				stars.rebuildStars();
				stars.editable = editable;
				if (rating == 0)
				{
					stars.rating = mediaProxy["vo"]["entry"]["rank"];
				}else{
					stars.rating = rating;
				}
				stars.addEventListener("rated" , onStarsRated);
			}
		}
	
		private function getProxy() : Proxy
		{
			return (facade.retrieveProxy("mediaProxy") as Proxy);
		}
		private function onStarsRated ( e: Event) :void
		{
			trace("rated")
			var kClient : Object = facade.retrieveProxy("servicesProxy")["borhanClient"];
			var mr:MultiRequest = new MultiRequest();
			var entryId : String = mediaProxy["vo"]["entry"]["id"];
			if (!useExternalRatingSystem)
			{
	 			var starsRate : BaseEntryAnonymousRank = new BaseEntryAnonymousRank(entryId , stars.rating);
				mr.addAction(starsRate);
				var getEntry : BaseEntryGet = new BaseEntryGet(entryId);
				mr.addAction(getEntry);
				mr.addEventListener(BorhanEvent.COMPLETE , onRateComplete);
				mr.addEventListener(BorhanEvent.FAILED , onRateFailed);
				(kClient as BorhanClient).post(mr);
			}
			else
			{
				ExternalInterface.call(externalSetRatingFunction , [mediaProxy["vo"]["entry"]["id"], stars.rating]);
			}
		}
		
		private function onRateComplete (e : BorhanEvent) : void
		{
			trace("rate successful");
		}
		private function onRateFailed ( e: BorhanEvent ) : void
		{
			trace("Rate failed");
		}  

		/**
		 * Flag indicating whether the rating request should be opposite the Borhan CMS or an external data base. 
		 */
		public function get useExternalRatingSystem():Boolean
		{
			return _useExternalRatingSystem;
		}

		/**
		 * @private
		 */
		public function set useExternalRatingSystem(value:Boolean):void
		{
			_useExternalRatingSystem = value;
		}

	}
}