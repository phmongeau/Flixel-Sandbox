package
{
    import org.flixel.*;
	public class GridState extends FlxState
    {
        private var player:FlxSprite;
        override public function create():void
        {
            player = new FlxSprite(FlxG.width/2, FlxG.height/2);
            player.makeGraphic(16,16, 0xffffffff);
            add(player);
			FlxG.watch(player, "x");
			FlxG.watch(player, "y");
        }

        override public function update():void
        {
            if(FlxG.keys.UP || FlxG.keys.DOWN)
            {
                if(player.x%16 < 8) player.x -= 1;
                if(player.x%16 > 8) player.x += 1;
            }
            if(FlxG.keys.LEFT || FlxG.keys.RIGHT)
            {
                if(player.y%16 > 8) player.y -= 1;
                if(player.y%16 < 8) player.y += 1;
            }
            if(FlxG.keys.UP) player.y -= 40 * FlxG.elapsed;
            if(FlxG.keys.DOWN) player.y += 40 * FlxG.elapsed;
            if(FlxG.keys.LEFT) player.x -= 40 * FlxG.elapsed;
            if(FlxG.keys.RIGHT) player.x += 40 * FlxG.elapsed;

            super.update();
        }
    }
}
