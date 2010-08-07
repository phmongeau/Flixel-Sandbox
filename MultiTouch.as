package
{
	import org.flixel.*;

	public class MultiTouch extends FlxState
	{
		[Embed(source = 'data/loot.png')] private var ImgCursor:Class;
		[Embed(source = 'data/coin.png')] private var ImgCoin:Class;
		
		private var firstCursor:FlxSprite;
		private var secondCursor:FlxSprite;
		private var cursors:FlxGroup;
		private var coins:FlxGroup;
		
		private var refPoint:FlxPoint = new FlxPoint(0,0);;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.mouse.cursor.loadGraphic(ImgCursor);
			
			cursors = new FlxGroup();
			add(cursors);
			//cursors.add(FlxG.mouse.cursor);
			
			firstCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			firstCursor.loadGraphic(ImgCursor);
			cursors.add(firstCursor);

			secondCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			secondCursor.loadGraphic(ImgCursor);
			cursors.add(secondCursor);
			
			coins = new FlxGroup();
			add(coins);
			var coin:FlxSprite = new FlxSprite(60, 200);
			coin.loadGraphic(ImgCoin);
			coins.add(coin);
			coin = new FlxSprite(250,300);
			coin.loadGraphic(ImgCoin);
			coins.add(coin);
		}
		
		override public function update():void
		{
			firstCursor.x = FlxG.mouse.x;
			firstCursor.y = FlxG.mouse.y;
			if(FlxG.keys.X)
			{
				//var CENTER:FlxPoint = new FlxPoint(FlxG.width, FlxG.height);
				secondCursor.x = (FlxG.mouse.x * -1) + refPoint.x * 2;
				secondCursor.y = (FlxG.mouse.y * -1) + refPoint.y * 2;
				//var dst:FlxPoint = new FlxPoint(FlxG.mouse.x - refPoint.x, FlxG.mouse.y - refPoint.y);
				//secondCursor.x = (FlxG.mouse.x * -1) + refPoint.x + FlxG.height;
				//secondCursor.y = (FlxG.mouse.y * -1) + refPoint.y + FlxG.width;
			}
			else
			{
				secondCursor.x = FlxG.mouse.x;
				secondCursor.y = FlxG.mouse.y;
				refPoint.x = FlxG.mouse.x;
				refPoint.y = FlxG.mouse.y;
			}
			
			FlxU.overlap(cursors, coins, getCoins);
		}
		
		private function getCoins(cu:Object, co:FlxSprite):void
		{
			co.x = Math.random() * FlxG.width;
			co.y = Math.random() * FlxG.height;
		}
	}
}
