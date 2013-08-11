/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-8-9
 * Time: 下午11:29
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Assets {
    [Embed(source="../assets/graphics/bgWelcome.jpg") ]
    public static const BgWelcome:Class;

    [Embed(source="../assets/graphics/bgLayer1.jpg")]
    public static const bgLayer1:Class;

    private static var gameTextures:Dictionary = new Dictionary();
    private static var gameTextureAtlas:TextureAtlas;

    [Embed(source="../assets/graphics/mySpritesheet.png")]
    public static const AtlasTextureGame:Class;

    [Embed(source="../assets/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
    public static const AtlasXmlGame:Class;

    public static function getAtlas():TextureAtlas{
        if (gameTextureAtlas == null){
            var texture:Texture = getTexture("AtlasTextureGame");
            var xml:XML = XML (new AtlasXmlGame());
            gameTextureAtlas = new TextureAtlas(texture, xml);
        }

        return gameTextureAtlas;
    }

    public static function getTexture(name:String):Texture{
        if (gameTextures[name] == null){
            var bitmap:Bitmap = new Assets[name]();
            gameTextures[name] = Texture.fromBitmap(bitmap);
        }
        return gameTextures[name];
    }
}
}
