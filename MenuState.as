package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		override public function create():void
		{
			FlxG.log("Menu");
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"SandBox");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");
			t.alignment = "center";
			add(t);
			

            var b:FlxButton;
			b = new FlxButton((FlxG.width - 80)/2, 100, goToMultiTouch, "MultiTouch");
			add(b);

			b = new FlxButton((FlxG.width - 80)/2, 120, goToGridState, "Grid");
			add(b);

			b = new FlxButton((FlxG.width - 80)/2, 140, goToBubbleState, "Bubble");
			add(b);

			b = new FlxButton((FlxG.width - 80)/2, 160, goToSocketState, "Socket");
			add(b);

			b = new FlxButton((FlxG.width - 80)/2, 180, goToStrategyState, "Strategy");
			add(b);
			

			FlxG.log("menuCreated");

			FlxG.mouse.show();
		}

		override public function update():void
		{
			super.update();
			//if(FlxG.keys.justPressed("X")) FlxG.state = new MultiTouch();

			/*	
			if(FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.state = new MultiTouch();
			}
			*/

            //if(FlxG.keys.justPressed("G")) FlxG.state = new GridState();
            //if(FlxG.keys.justPressed("B")) FlxG.state = new BubbleState();


		}

        private function goToMultiTouch():void
        {
            FlxG.switchState(new MultiTouch());
        }
        private function goToGridState():void
        {
            FlxG.switchState(new GridState());
        }
        private function goToBubbleState():void
        {
            FlxG.switchState(new BubbleState());
        }
        private function goToStrategyState():void
        {
            FlxG.switchState(new StrategyState());
        }
		private function goToSocketState():void
		{
			FlxG.switchState(new SocketState());
		}
	}
}
