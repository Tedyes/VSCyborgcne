function postCreate(){
    FlxTween.tween(FlxG.camera, {zoom: 0.85}, 0.001);
    for (i in ['bg','moretank']){
        stage.stageSprites[i].visible = false;
    }
}

function beatHit(){
    switch(curBeat){
        case 4:
            FlxTween.tween(FlxG.camera, {zoom: 3.5}, 1.5,{ease: FlxEase.expoIn});
            for (i in 1 ... 16){
                FlxTween.tween(stage.stageSprites[i].scale, {x: Math.random()*1.25,y: Math.random()*1.25}, 1.5,{ease: FlxEase.expoIn});
                FlxTween.tween(stage.stageSprites[i], {angle: Math.random()*25}, 1.5,{ease: FlxEase.expoIn});
            }
        case 8:
            FlxG.camera.flash(0xFFffffff, 0.25);
            for (i in 1 ... 16){
                remove(stage.stageSprites[i],true);
            }
            defaultCamZoom = 0.55;
            for (i in ['bg','moretank']){
                stage.stageSprites[i].visible = true;
            }
    }
}