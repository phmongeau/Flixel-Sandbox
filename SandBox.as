package
{
	import org.flixel.*;
	import flash.events.*;

	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class SandBox extends FlxGame
	{
		public function SandBox()
		{
			FlxG.debug = true;
			super(640,480,MenuState,1);
		}

		override protected function update():void
        {
            super.update();
            if(FlxG.keys.justPressed("ESCAPE")) FlxG.switchState(new MenuState());
        }
	}
}
