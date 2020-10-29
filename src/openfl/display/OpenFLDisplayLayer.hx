package openfl.display;

import com.stencyl.Config;
import com.stencyl.models.scene.layers.RegularLayer;

import openfl.display.BlendMode;

class OpenFLDisplayLayer extends RegularLayer
{
	public function new(ID:Int, name:String, order:Int, scrollFactorX:Float, scrollFactorY:Float, opacity:Float, blendMode:BlendMode)
	{
		super(ID, name, order, scrollFactorX, scrollFactorY, opacity, blendMode);
	}

	override public function updatePosition(x:Float, y:Float, elapsedTime:Float)
	{
		var xScrolled:Float = 0;
		var yScrolled:Float = 0;
		var tempX:Float = 0;
		var tempY:Float = 0;
		
		if (Config.pixelsnap)
		{
			xScrolled = Std.int(x * scrollFactorX);
			yScrolled = Std.int(y * scrollFactorY);

			x = Math.round(x);
			y = Math.round(y);
			
			this.x = -Std.int(x * scrollFactorX);
			this.y = -Std.int(y * scrollFactorY);
		}
		else
		{
			xScrolled = x * scrollFactorX;
			yScrolled = y * scrollFactorY;

			this.x = -x * scrollFactorX;
			this.y = -y * scrollFactorY;
		}
	}
}
