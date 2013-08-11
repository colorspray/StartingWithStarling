/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-11
 * Time: 下午5:16
 * To change this template use File | Settings | File Templates.
 */
package objects {


import starling.display.Sprite;
import starling.events.Event;

public class Background extends Sprite {
    private var layerSky:BGLayer;
    private var layerMountain:BGLayer;
    private var layerBuilding:BGLayer;
    private var layerTrees:BGLayer;

    private var _speed:Number = 0;

    public function Background() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        layerSky = new BGLayer();
        layerSky.layer = 1;
        layerSky.parallax = 0.02;
        this.addChild(layerSky);

        layerMountain = new BGLayer();
        layerMountain.layer = 2;
        layerMountain.parallax = 0.2;
        this.addChild(layerMountain);

        layerBuilding = new BGLayer();
        layerBuilding.layer = 3;
        layerBuilding.parallax = 0.5;
        this.addChild(layerBuilding);

        layerTrees = new BGLayer();
        layerTrees.layer = 4;
        layerTrees.parallax = 1;
        this.addChild(layerTrees);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        layerSky.x -= _speed * layerSky.parallax;
        if (layerSky.x < -1 * stage.stageWidth){
            layerSky.x = 0;
        }

        layerMountain.x -= _speed * layerMountain.parallax;
        if (layerMountain.x < -1 * stage.stageWidth){
            layerMountain.x = 0;
        }

        layerBuilding.x -= _speed * layerBuilding.parallax;
        if (layerBuilding.x < -1 * stage.stageWidth){
            layerBuilding.x = 0;
        }

        layerTrees.x -= _speed * layerTrees.parallax;
        if (layerTrees.x < -1 * stage.stageWidth){
            layerTrees.x = 0;
        }

    }

    public function get speed():Number {
        return _speed;
    }

    public function set speed(value:Number):void {
        _speed = value;
    }
}
}
