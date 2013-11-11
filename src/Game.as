/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-9
 * Time: 上午12:18
 * To change this template use File | Settings | File Templates.
 */
package {

import events.NavigationEvent;

import screens.InGame;
import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {
    private var screenWelcome:Welcome;
    private var screenInGame:InGame;

    public function Game() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        trace("starling framework initialized ");

        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);

        screenInGame = new InGame();
        screenInGame.disposeTemporarily();
        this.addChild(screenInGame);

        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();
    }

    private function onChangeScreen(event:NavigationEvent):void {
        switch (event.params.id){
            case PAGEID.PLAY:
                screenWelcome.disposeTemporarily();
                screenInGame.initialize();
                break;

        }
    }
}
}
