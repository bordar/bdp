package
{
	import com.borhan.bdpfl.plugin.IPlugin;
	import com.borhan.bdpfl.plugin.IPluginFactory;
	
	import flash.display.Sprite;
	import flash.system.Security;
	
	public class freeWheelPlugin extends Sprite implements IPluginFactory
	{
		private static const VERSION:String = "test";//BUILD::Version;
		private static const RDK_VERSION:String = "test rdk";//BUILD::RDK_Version;
		
		public function freeWheelPlugin()
		{
			Security.allowDomain("*");			
			trace("new BDPPlugin() - Version: " + VERSION + " RDK Version: " + RDK_VERSION);
		}
		
		public function create(pluginName : String = null) : IPlugin
		{
			trace("FreeWheelPlugin create");
			return new freeWheelPluginCode();
		}
	}
}
