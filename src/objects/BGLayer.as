/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-11
 * Time: 下午5:07
 * To change this template use File | Settings | File Templates.
 */
package objects {

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class BGLayer extends Sprite {
    private var image1:Image;
    private var image2:Image;

    private var _layer:int;
    private var _parallax:Number;


    public function BGLayer() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);

    }

    public function get parallax():Number {
        return _parallax;
    }

    public function set parallax(value:Number):void {
        _parallax = value;
    }

    private function onAddToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);

        if (_layer == 1){
            image1 = new Image(Assets.getTexture("bgLayer1"));
            image2 = new Image(Assets.getTexture("bgLayer1"));
        }
        else{
            image1 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
            image2 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
        }

        image1.x = 0;
        image1.y = stage.stageHeight - image1.height;
        this.addChild(image1);
        image2.x = image1.width - 1;
        image2.y = stage.stageHeight - image2.height;
        this.addChild(image2);
    }

    public function get layer():int {
        return _layer;
    }

    public function set layer(value:int):void {
        _layer = value;
    }
}
}
