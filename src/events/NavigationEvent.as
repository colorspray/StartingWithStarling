/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-11
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
package events {
import starling.events.Event;

public class NavigationEvent extends Event {
    public static const CHANGE_SCREEN:String = "changeScreen";

    public var params:Object;

    public function NavigationEvent(type:String, _params:Object = null, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
        this.params = _params;

    }
}
}
