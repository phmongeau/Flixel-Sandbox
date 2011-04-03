package
{
    import org.flixel.*;
	public class StrategyState extends FlxState
    {
        private var player:FlxSprite;
        private var timer:Number = 0;
        private var trash:FlxGroup = new FlxGroup();

        override public function create():void
        {
            player = new FlxSprite(FlxG.width/2, FlxG.height/2);
            player.makeGraphic(1,1, 0xffffffff);
            add(player);
            add(trash);

            //FlxG.showBounds = true;
        }

        override public function update():void
        {
            timer += FlxG.elapsed;
            if(timer >= 2)
            {
                var junk:FlxSprite = new FlxSprite().makeGraphic(8,8,0xffffffff);
                junk.x = Math.random() * 250;
                junk.y = 0;
                junk.acceleration.y = 200;
                trash.add(junk);
                timer = 0;
            }

            if(FlxG.mouse.justPressed())
            {
                player.x = FlxG.mouse.x;
                player.y = FlxG.mouse.y;
                player.scale = new FlxPoint(1,1);
            }
            if(FlxG.mouse.pressed())
            {
                player.scale.x = (FlxG.mouse.x - player.x);
                player.scale.y = (FlxG.mouse.y - player.y);
            }
            FlxU.collide(trash, player);
            super.update();
        }
    }
}

