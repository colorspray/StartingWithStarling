/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-10
 * Time: 下午5:40
 * To change this template use File | Settings | File Templates.
 */
package screens {

import flash.utils.getTimer;

import objects.Background;
import objects.Hero;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;

public class InGame extends Sprite {

    private var timePrevious:Number;
    private var timeCurrent:Number;
    private var elapsed:Number;

    private var playerSpeed:Number;
    private var hitObstacle:Number = 0;
    private const MIN_SPEED:Number = 650;

    private var hero:Hero;

    private var background:Background;

    private var gameState:String;

    private var startButton:Button;
    public function InGame() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawGame();
    }

    private function drawGame():void{
        background = new Background();

        this.addChild(background);

        hero = new Hero();
        hero.x = stage.stageWidth/2;
        hero.y = stage.stageHeight/2;
        this.addChild(hero);

        startButton = new Button(Assets.getAtlas().getTexture("startButton"));
        startButton.x = stage.stageWidth * 0.5 - startButton.width * 0.5;
        startButton.y = stage.stageHeight * 0.5 - startButton.height * 0.5;
        this.addChild(startButton);
    }

    public function disposeTemporarily():void{
        this.visible = false;
    }

    public function initialize():void{
        this.visible = true;

        this.addEventListener(Event.ENTER_FRAME, checkElapsed );

        hero.x = -stage.stageWidth;
        hero.y = stage.stageHeight * 0.5;

        gameState = "idle";

        playerSpeed = 0;
        hitObstacle = 0;

        background.speed = 0;

        startButton.addEventListener(Event.TRIGGERED, onStartButtonClick);
    }

    private function checkElapsed(event:Event):void {
        timePrevious = timeCurrent;
        timeCurrent = getTimer();
        elapsed = (timeCurrent - timePrevious) * 0.001;

    }

    private function onStartButtonClick(event:Event):void {
        startButton.visible = false;
        startButton.removeEventListener(Event.TRIGGERED, onStartButtonClick);

        launchHero();
    }

    private function launchHero():void{
        this.addEventListener(Event.ENTER_FRAME, onGameTick);
    }

    private function onGameTick(event:Event):void {
        switch (gameState){
            case "idle":
                if (hero.x < stage.stageWidth * 0.5 * 0.5){
                    hero.x += ((stage.stageWidth * 0.5 * 0.5 + 10) - hero.x) * 0.05;
                    hero.y = stage.stageHeight * 0.5;

                    playerSpeed += (MIN_SPEED - playerSpeed) * 0.05;
                    background.speed = playerSpeed * elapsed;

                }
                else{
                    gameState = "flying";
                }
                break;
            case "flying":
                playerSpeed -= (playerSpeed - MIN_SPEED) * 0.01;
                background.speed = playerSpeed * elapsed;
                break;
            case "over":
                break;
        }
    }
}
}
