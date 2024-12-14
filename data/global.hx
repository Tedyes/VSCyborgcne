import funkin.backend.utils.WindowUtils;
import openfl.Lib;
import lime.graphics.Image;

function preStateSwitch() {
    WindowUtils.resetTitle();
    window.title = "Friday Night Maker!";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
}