package
{
    import org.flixel.*;
	public class BubbleState extends FlxState
    {
        private var player:FlxSprite;
        private var speed:Number = 200;
        override public function create():void
        {
            player = new FlxSprite(FlxG.width/2, FlxG.height/2);
            player.makeGraphic(8,8, 0xffffffff);
            add(player);
        }

        override public function update():void
        {

            if(FlxG.mouse.wheel < 0 && player.scale.x < 18) player.scale.x = player.scale.y += 0.5;
            if(FlxG.mouse.wheel > 0 && player.scale.x > 1) player.scale.x = player.scale.y -= 0.5;

            speed = 200/player.scale.x;

            if(FlxG.mouse.x > player.x) player.x += speed * FlxG.elapsed;
            else if(FlxG.mouse.x < player.x) player.x -= speed * FlxG.elapsed;

            if(FlxG.mouse.y > player.y) player.y += speed * FlxG.elapsed;
            else if(FlxG.mouse.y < player.y) player.y -= speed * FlxG.elapsed;


            super.update();
        }
    }
}

