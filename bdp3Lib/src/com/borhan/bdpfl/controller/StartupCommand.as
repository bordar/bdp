package com.borhan.bdpfl.controller
{
	import com.borhan.bdpfl.model.ConfigProxy;
	import com.borhan.bdpfl.model.ExternalInterfaceProxy;
	import com.borhan.bdpfl.model.FuncsProxy;
	import com.borhan.bdpfl.model.LayoutProxy;
	import com.borhan.bdpfl.model.MediaProxy;
	import com.borhan.bdpfl.model.PlayerStatusProxy;
	import com.borhan.bdpfl.model.SequenceProxy;
	import com.borhan.bdpfl.model.ServicesProxy;
	import com.borhan.bdpfl.model.type.NotificationType;
	import com.borhan.bdpfl.util.Functor;
	import com.borhan.bdpfl.view.CuePointsMediator;
	import com.borhan.bdpfl.view.RootMediator;
	import com.borhan.bdpfl.view.controls.AlertMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * This class is responsible for pre-initialization activities. 
	 */	
	public class StartupCommand extends SimpleCommand
	{
		/**
		 * Register all Proxies and Mediators before calling Application initialization  
		 * @param note
		 */		
		override public function execute(notification:INotification):void
		{
			//trace("StartupCommand - execute - notification: " + notification.getBody());
			
			//we set the current flashvar first and override them with stage flashvars if needed
			facade.registerProxy( new ConfigProxy( (notification.getBody()).root.loaderInfo.parameters) ); //register the config proxy
			facade.registerProxy( new ServicesProxy() ); //register the services proxy
			facade.registerProxy( new LayoutProxy() ); //register the layout proxy
			facade.registerProxy( new MediaProxy() ); //register the media proxy
			facade.registerProxy( new SequenceProxy() );
			facade.registerProxy( new ExternalInterfaceProxy() ); //register the external interface proxy
			facade.registerProxy( new PlayerStatusProxy()); 
			facade.registerMediator(new CuePointsMediator() );
			Functor.globalsFunctionsObject = new FuncsProxy(); 
			
			//register the first view mediator to non other then the root mediator
            facade.registerMediator( new RootMediator( (notification.getBody()).root ) );
            facade.registerMediator(new AlertMediator());
            //send notification to start the macro command process
            sendNotification( NotificationType.INITIATE_APP );
		}

	}
}