package
{
	import org.flixel.*;
	import org.flixel.system.FlxPreloader;

	public class Preloader extends FlxPreloader
	{
		public function Preloader()
		{
			className = "SandBox";
			super();
		}
		
		override protected function create():void
		{
			super.create();
		}
	}
}
