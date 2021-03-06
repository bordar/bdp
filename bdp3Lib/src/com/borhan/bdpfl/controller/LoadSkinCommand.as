package com.borhan.bdpfl.controller
{
	import com.borhan.bdpfl.model.type.NotificationType;
	import com.borhan.bdpfl.style.KStyleManager;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.AsyncCommand;

	/**
	 * This class is responsible for loading BDP skin file 
	 */
	public class LoadSkinCommand extends AsyncCommand implements IResponder
	{
		/**
		 * load BDP skin 
		 * @param notification
		 */		
		override public function execute(notification:INotification):void
		{
			var styleManager:KStyleManager = new KStyleManager(this);
			styleManager.loadStyles();
		}

		/**
		 * notify app that load succeeded
		 * @param data
		 */		
		public function result(data:Object):void
		{
			facade.sendNotification( NotificationType.SKIN_LOADED );
			commandComplete();
		}
		
		/**
		 * notify app that load failed 
		 * @param data
		 */		
		public function fault(data:Object):void
		{
			facade.sendNotification( NotificationType.SKIN_LOAD_FAILED );
			//commandComplete();
		}

	}
}