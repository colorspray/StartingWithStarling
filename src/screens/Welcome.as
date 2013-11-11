/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-9
 * Time: 下午11:41
 * To change this template use File | Settings | File Templates.
 */
package screens {

import com.greensock.TweenLite;

import events.NavigationEvent;

import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class Welcome extends Sprite {
    private var bg:Image;
    private var title:Image;
    private var hero:Image;

    private var playBtn:Button;
    private var aboutBtn:Button;

    public function Welcome() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        trace("welcome screen initialized");

        drawScreen();
    }

    private function drawScreen():void {
        bg = new Image(Assets.getTexture("BgWelcome"));
        this.addChild(bg);

        title = new Image(Assets.getAtlas().getTexture("welcome_title"));
        title.x = 440;
        title.y = 20;
        this.addChild(title);

        hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));
        this.addChild(hero);

        playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
        playBtn.x = 500;
        playBtn.y = 260;
        this.addChild(playBtn);

        aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
        aboutBtn.x = 410;
        aboutBtn.y = 380;
        this.addChild(aboutBtn);

        this.addEventListener(Event.TRIGGERED, onMainMenuClick);
    }

    public function initialize():void{
        this.visible = true;

        hero.x = -hero.width;
        hero.y = 100;

        TweenLite.to(hero, 3, {x:80});

        this.addEventListener(Event.ENTER_FRAME, heroAnimation);
    }


    private function heroAnimation(event:Event):void {
        var currentData:Date = new Date();
        var animationVariable:Number = Math.cos(currentData.getTime() * 0.002);
        hero.y = 100 + (animationVariable * 25);
        playBtn.y = 260 + (animationVariable * 10);
        aboutBtn.y = 380 + (animationVariable * 10);

    }

    private function onMainMenuClick(event:Event):void {
        var buttonClicked:Button = event.target as Button;
        if (buttonClicked == playBtn){
            this.dispatchEvent((new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: PAGEID.PLAY}, true)));
        }
    }

    public function disposeTemporarily():void{
        this.visible = false;

        if (this.hasEventListener(Event.ENTER_FRAME))
            this.removeEventListener(Event.ENTER_FRAME, heroAnimation);
    }
}
}
