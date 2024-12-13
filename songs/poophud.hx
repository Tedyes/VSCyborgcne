function postCreate(){
    for(i in 0 ... 2){
        for(c in 0 ... 4){
            strumLines.members[i].members[c].x -= 50;
        }
    }
    for(a in strumLines){
        for(b in a){
            b.alpha = 0.9;
            b.scale.set(0.65,0.65);
        }
        for(c in a.notes){
            c.scale.set(0.65,0.65);
        }
    }
    for(i in [accuracyTxt, missesTxt]){
        remove(i,true);
    }
    scoreTxt.font = "fonts/Arial Black.ttf";
    scoreTxt.x += 50; scoreTxt.borderSize = 0; scoreTxt.borderColor = 0xFFFFFFFF;

    doIconBop = false; 
}

function onPostCountdown(event) {
    if (introSprites[event.swagCounter] != null){
        event.spriteTween.cancel();
        remove(event.sprite,true);

        var count = new FlxSprite().loadGraphic(Paths.image(introSprites[event.swagCounter]));
        count.updateHitbox();
	    count.screenCenter();
        count.antialiasing = false;
        count.cameras = [camHUD];
        add(count);
        FlxTween.tween(count, {alpha: 1}, Conductor.crochet / 1000, {onComplete: function() {remove(count,true);}});
    }
}

function postUpdate(){
    healthBar.createFilledBar(0xFFFF0000, 0xFF0000FF);
    healthBar.updateBar();

    iconP1.scale.set(lerp(iconP1.scale.x, 1, 0.45),lerp(iconP1.scale.y, 1, 0.45));
	iconP2.scale.set(lerp(iconP2.scale.x, 1, 0.45),lerp(iconP2.scale.y, 1, 0.45));
}

function beatHit(){
    if (curBeat % 2 == 0){
        iconP1.scale.set(1.2,1.2);
	    iconP2.scale.set(1.2,1.2);
    }
}

function onNoteCreation(e){
    e.noteSprite = "game/NOTE_assets";
}
function onStrumCreation(e){
    e.cancelAnimation();
    e.sprite = "game/NOTE_assets";
}

function onNoteHit(event) {
    if (event.showSplash) {
      event.showSplash = false;
    }
}

function onDadHit(event){
    strumLines.members[0].members[event.note.strumID % 4].scale.set(0.5,0.5);
    FlxTween.tween(strumLines.members[0].members[event.note.strumID % 4].scale, {x: 0.65,y: 0.65}, 0.15);
}

function onPlayerHit(event){
    strumLines.members[1].members[event.note.strumID % 4].scale.set(0.5,0.5);
    FlxTween.tween(strumLines.members[1].members[event.note.strumID % 4].scale, {x: 0.65,y: 0.65}, 0.15);
}