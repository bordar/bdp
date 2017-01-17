package
{
	import com.borhan.bdpfl.plugin.IPlugin;
	import com.borhan.bdpfl.plugin.IPluginFactory;
	import flash.system.Security;
	import flash.display.Sprite;
	
	public class nielsenVideoCensusPlugin extends Sprite implements IPluginFactory
	{
		/**
		 * Constructor
		 * **/
		public function nielsenVideoCensusPlugin()
		{
			Security.allowDomain("*");
		}
		
		/**
		 * create "real" plugin 
		 */		
		public function create(pluginName : String = null) : IPlugin	
		{
			return new nielsenVideoCensusPluginCode();
		}
	}
}