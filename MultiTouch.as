package
{
	import org.flixel.*;

	public class MultiTouch extends FlxState
	{
		[Embed(source = 'data/loot.png')] private var ImgCursor:Class;
		[Embed(source = 'data/coin.png')] private var ImgCoin:Class;
		
		private var firstCursor:FlxSprite;
		private var secondCursor:FlxSprite;
		private var thirdCursor:FlxSprite;
		private var fourthCursor:FlxSprite;
		private var cursors:FlxGroup;
		private var coins:FlxGroup;
		
		private var refPoint:FlxPoint = new FlxPoint(0,0);;


        private var dSplit:Boolean = false;
        private var fSplit:Boolean = false;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.mouse.load(ImgCursor);
			
			cursors = new FlxGroup();
			add(cursors);
			//cursors.add(FlxG.mouse.cursor);
			
			firstCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			firstCursor.loadGraphic(ImgCursor);
			cursors.add(firstCursor);

			secondCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			secondCursor.loadGraphic(ImgCursor);
			cursors.add(secondCursor);

			thirdCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			thirdCursor.loadGraphic(ImgCursor);
			cursors.add(thirdCursor);
			
			fourthCursor = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
			fourthCursor.loadGraphic(ImgCursor);
			cursors.add(fourthCursor);

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
			if(dSplit)
			{
				secondCursor.x = (FlxG.mouse.x * -1) + refPoint.x * 2;
				secondCursor.y = (FlxG.mouse.y * -1) + refPoint.y * 2;

                thirdCursor.x = FlxG.mouse.x;
                thirdCursor.y = FlxG.mouse.y;
                fourthCursor.x = FlxG.mouse.x;
                fourthCursor.y = FlxG.mouse.y;
			}
			else if(fSplit)
			{
				secondCursor.x = (FlxG.mouse.x * -1) + refPoint.x * 2;
				secondCursor.y = (FlxG.mouse.y * -1) + refPoint.y * 2;
				thirdCursor.x = (FlxG.mouse.x * -1) + refPoint.x * 2;
				thirdCursor.y = FlxG.mouse.y;

				fourthCursor.y = (FlxG.mouse.y * -1) + refPoint.y * 2;
				fourthCursor.x = FlxG.mouse.x;
			}
			else
			{
				secondCursor.x = FlxG.mouse.x;
				secondCursor.y = FlxG.mouse.y;
                thirdCursor.x = FlxG.mouse.x;
                thirdCursor.y = FlxG.mouse.y;
                fourthCursor.x = FlxG.mouse.x;
                fourthCursor.y = FlxG.mouse.y;
				refPoint.x = FlxG.mouse.x;
				refPoint.y = FlxG.mouse.y;
			}
			
			FlxU.overlap(cursors, coins, getCoins);
		}
		
		private function getCoins(cu:Object, co:FlxSprite):void
		{
			co.x = FlxG.random() * FlxG.width;
			co.y = FlxG.random() * FlxG.height;
            dSplit = !dSplit;
            fSplit = !dSplit;
		}
	}
}
