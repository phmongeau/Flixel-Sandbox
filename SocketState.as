package
{
    import org.flixel.*;
	import flash.net.Socket;
	import flash.net.XMLSocket;
	public class SocketState extends FlxState
    {
		private var t:FlxText;
		private var sock:Socket;
		private var xsock:XMLSocket;
		private var timer:Number;
        override public function create():void
        {
			timer = 5;
			t = new FlxText(0,0,FlxG.width,"");
			add(t);

			//sock = new Socket();
			//sock.connect("192.168.117.14", 25501);
			//sock.writeUTFBytes("hello");
			//FlxG.log(sock.connected);

			xsock = new XMLSocket("192.168.117.14", 25501);
			xsock.connect("192.168.117.14", 25501);
        }

        override public function update():void
        {
			timer -= FlxG.elapsed;
			if(timer <= 0)
			{
				timer = 5;
				//buffer = sock.readByte();
				sock.writeUTFBytes("hello");
				FlxG.log(sock.connected);
				//t.text = buffer.toString();

			}
            super.update();
        }
    }
}
