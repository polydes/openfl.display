package openfl.display;

import openfl.display.BlendMode;
import com.stencyl.Engine;
import com.stencyl.models.scene.layers.RegularLayer;

class Blocks 
{
	public static function createDisplayLayer(layerName:String)
	{
		return new OpenFLDisplayLayer(-1, layerName, -1, 1.0, 1.0, 1.0, BlendMode.NORMAL);
	}
	
	public static function addDisplayLayer(layer:DisplayObjectContainer, order:Int)
	{
		if(!Std.is(layer, RegularLayer))
		{
			trace("Can't add normal display objects to Stencyl's layers. Use the \"create openfl display layer\" block to create an appropriate layer.");
			return;
		}
	
		var regLayer:RegularLayer = cast layer;
	
		if(regLayer.ID == -1)
			regLayer.ID = Engine.engine.getNextLayerID();
		
		Engine.engine.insertLayer(regLayer, order);
	}
}