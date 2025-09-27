#region System

//Music Sync
DeltaTimer = (RealTimer - Timer);
if (abs(DeltaTimer) > 5)
{
    audio_sound_set_track_position(global.currentMusic, ((Timer - 0) / 50))
    RealTimer = Timer
}

//Alarms
for (var i = 0; i <= 2; i ++)
    { Act[i] = max(Act[i] - 1,0); }

if (global.debugMode)
{
	room_speed = 50 + scrTernary(keyboard_check(ord("2")),200,keyboard_check(ord("3")) * -45);
}

//Timer
if (instance_exists(objPlayer)){
    Timer ++;
    RealTimer += ((50 * delta_time) / 1000000);
} else if (DeadFix){
    if (!global.hitCount && !global.practiceMode && Timer > global.timerPB)
        { global.timerPB = min(Timer,50*152+20); }
    
    DeadFix = false;
    Timer += 0.1;
}

#endregion

#region 0:02 - 0:41 (Intro - Are You Alone?)

//0:02 - 0:21
if (Timer > 50*2 + 25 && Timer < 50*20+25 && !Act[0]){
    Act[0] = 4;//5
    
    for (var i = -1; i <= 1; i += 2){
        a = instance_create(irandom(800),0,objBulletIntro);
        a.Cur = 0.05 * i;
        a.preSpeed = random_range(3,4);
        a.vspeed = a.preSpeed;
        a.image_index = 13;
        a.Speed = speedIntro;
        
        if (speedIntro) a.vspeed *= 2.2;
    }
}

//Drum
switch (Timer)
{
    case 670: case 912:
    case 960: case 973: case 1015:
        speedIntro = true;
        with(objBulletIntro){
            Speed = true;
            speed *= 2.2;
        }
        alarm[0] = 5;
    break;
    case 793:
        speedIntro = true;
        with(objBulletIntro){
            Speed = true;
            speed *= 2.5;
        }
        alarm[0] = 18;
    break;
}

//0:18 - 0:21
if (Timer == 50*18) Spd = 1;
if (Timer > 50*18 && Timer < 50*21){
    
    repeat(5){
        a = instance_create(400,0,objBullet01);
        a.speed = Spd;
        a.direction = -irandom(180);
        a.image_index = 13;
    }
    
    Spd += 0.091;
}

if (Timer > 50*19 && Timer < 50*21){
    with(objBulletIntro){
        mask_index = sprEmpty;
        image_alpha = other.Alp;
    }
    with(objBulletTail){
        mask_index = sprEmpty;
        image_alpha = other.Alp;
    }
    
    Alp -= 1/100;
}

//0:21 (Are you Alone?)
if (Timer == 50*21){
    instance_destroy(objBulletIntro);
    instance_destroy(objBulletTail);
    instance_create(400,304,objAreYouAlone);
    with(objPlayer){
        frozen = true;
        gravity = 0;
        vspeed = 0;
        visible = false;
        p = instance_create(x,y,objFakePlayer);
        p.image_xscale = xScale;
        p.sprite_index = sprite_index;
        p.image_index = image_index;
    }
    with(objBullet01) speed = 0;
}

//0:22
if (Timer == 50*22 + 15){
    instance_destroy(objAreYouAlone);
    with(objPlayer){
        frozen = false;
        gravity = 0.4;
        visible = true;
    }
    instance_destroy(objFakePlayer);
    with(objBullet01){
        direction = point_direction(scrPX(),scrPY(),x,y);
        speed = random_range(15,30);
    }
    
    instance_create(x,y,objBulletBigFloat)
    with(instance_create(x,y,objBulletBigFloat))
		{ Offset = 180; }
}

//0:27
if (Timer == 50*27){
    instance_destroy(objBulletBigFloat);
    //instance_destroy(objBullet01);
    with(objBullet01){
        a = instance_create(x,y,objBulletTail);
        a.speed = speed*2;
        a.friction = -0.05;
        a.direction = direction;
        a.sprite_index = sprite_index;
        a.image_index = a.image_number-1;
        a.image_angle = image_angle;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.Type = "Alpha";
        a.Spd = 1/15;
        
        instance_destroy();
    }
    
    
    Dir = 1;
    repeat(2){
        for (var i = 0; i<360; i += 360/4)
        {
            a = instance_create(x,y,objBulletBigCircles);
            a.T = i;
            a.Dir = Dir;
        }
        Dir = -1;
    }
}

//0:32
if (Timer == 50*32){
    instance_destroy(objBulletBigCircles);
    //instance_destroy(objBullet01);
    with(objBullet01){
        a = instance_create(x,y,objBulletTail);
        a.speed = speed*2;
        a.friction = -0.05;
        a.direction = direction;
        a.sprite_index = sprite_index;
        a.image_index = a.image_number-1;
        a.image_angle = image_angle;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.Type = "Alpha";
        a.Spd = 1/15;
        
        instance_destroy();
    }
}

//0:32 - 0:36
if (Timer > 50*32 && Timer < 50*36 + 25 && !Act[0]){
    Act[0] = 3;
    XX = 800;
    Dir = irandom_range(91,90+15);
    repeat(2){
        a = instance_create(XX,608,objBulletBoing);
        a.direction = Dir;
        a.speed = random_range(18,23);
        a.gravity = 0.4;
        
        Dir = irandom_range(90-15,89);
        XX = 0;
    }
}

//0:36
if (Timer == 50*36 + 25){
    //instance_destroy(objBullet01);
    with(objBullet01){
        a = instance_create(x,y,objBulletTail);
        a.speed = speed*2;
        a.friction = -0.05;
        a.direction = direction;
        a.sprite_index = sprite_index;
        a.image_index = a.image_number-1;
        a.image_angle = image_angle;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.Type = "Alpha";
        a.Spd = 1/15;
        
        instance_destroy();
    }
    
    Dir = 1;
    repeat(2){
        for (var i = 0; i < 800; i += 800/20)
        {
            a = instance_create((Dir==-1)*800,i,objBulletSlowWall);
            a.hspeed = Dir * 1.1;
            //a = instance_create((Dir==-1)*800,i,objBullet01);
            //a.hspeed = Dir * 1.1;
        }
        Dir = -1;
    }
}

//0:36 - 0:41
if (Timer > 50*36 + 25 && Timer < 50*41){
    if (!Act[0]){
        Act[0] = 3;
        
        a = instance_create(irandom(800),0,objBullet01);
        a.speed = random_range(6,9);
        a.direction = 270 + irandom_range(-10,10);
        a.sprite_index = sprPCircleSmall;
    }
    if (!Act[1]){
        Act[1] = 15;
        XX = irandom(800);
        YY = irandom(100);
        Ran = irandom(360);
    }
    if (!Act[2]){
        Act[2] = 3;
        
        for (var i = 0; i < 360; i += 360/5)
        {
            var createXX = XX + lengthdir_x(20,i + Ran);
            var createYY = YY + lengthdir_y(20,i + Ran);
            a = instance_create(createXX,createYY,objBulletBigSlow);
            a.direction = i + Ran;
        }
    }
}

#endregion

#region 0:41 - 0:50 (The First Pattern)

//Clean bullets
if (Timer == 50*41 + 15){
    //instance_destroy(objBullet01);
    with(objBullet01){
        a = instance_create(x,y,objBulletTail);
        a.speed = speed;
        a.direction = direction;
        a.sprite_index = sprite_index;
        a.image_index = a.image_number-1;
        a.image_angle = image_angle;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.Type = "ScaleAlpha";
        a.sclSpd = -1/20;
        a.alpSpd = 1/10;
        
        instance_destroy();
    }

    for (var i = 0; i < 360; i += 90)
    {
        a = instance_create(400,100,objBulletFastSpin)
        a.Angle = i;
        a.maxDis = 50;
        a.Spd = 10;
    }
}

//0:41
if (Timer = 50*41 + 25){
    for (var i = 0; i < 360; i += 90)
    {
        a = instance_create(400,100,objBulletFastSpin)
        a.Angle = i;
        a.maxDis = 30;
        a.Spd = 25;
        a.Dir = -1;
    }
}

//0:41
if (Timer == 50*41 + 40){
    with(objBulletFastSpin) alarm[0] = 2;
}

//0:41
switch (Timer)
{
    case (50*43+15):
        instance_destroy(objBullet01);
        instance_destroy(objBulletFastSpin);
        
        for (var i = 0; i < 360; i += 360/3){
            a = instance_create(x,y,objBulletScreenFast);
            a.speed = 10;
            a.direction = i-90;
        }
    break;
    case (50*43 + 30): case (50*43 + 45):
        with(objBulletScreenFast){
            for (var i = 0; i < 360; i += 360/3){
                a = instance_create(x,y,objBulletScreenFast);
                a.speed = 9;
                a.direction = i-270;
            }
        }
    break;
}

if (Timer == 50*44+15){
    with(objBulletScreenFast){
        friction = 0;
        direction = point_direction(400,304,x,y);
        speed = 20;
    }
}

if (Timer = 50*45+40){
    instance_destroy(objBulletScreenFast);
    
    a = instance_create(irandom(800),608,objBulletBigSpam);
    a.XX = 400 - 50;
}

if (Timer = 50*46){
    a = instance_create(irandom(800),608,objBulletBigSpam);
    a.XX = 400 + 50;
}

if (Timer == 50*46+15){
    with(objBulletBigSpam) alarm[0] = 1;
}

if (Timer = 50*48){
    instance_destroy(objBullet01);
    instance_destroy(objBulletBigSpam);
    
    Tag = 0;
    Ran = irandom(360);
    for (var i = 0; i < 360; i += 360/3)
    {
        a = instance_create(400,50,objBulletButterflySpam);
        a.Tag = Tag;
        a.Angle = i + Ran;
        Tag ++;
    }
    Tag = 0;
}

switch (Timer)
{
    case (50*48): case (50*48+15): case (50*48+30):
    with(objBulletButterflySpam){
        if (Tag == other.Tag){
            image_xscale = 4;
            image_yscale = image_xscale;
            visible = true;
        }
    }
    Tag ++;
    break;
}

if (Timer == 50*48+40){
    with(objBulletButterflySpam){
        Spd = 15;
        alarm[0] = 1;
    }
}

if (Timer > 50*48+40 && Timer < 50*50+25 && !Act[0]){
    Act[0] = 2;
    
    var j = irandom(360);
    var i = 0;
    repeat(2){
        repeat(20){
            a = instance_create(400,50,objBullet01);
            a.speed = 200;
            a.direction = j + i;
            j += 2;
        }
        i = 180;
    }
}

if (Timer == 50*50+25){
    with(objPlayerKiller){
        a = instance_create(x,y,objBulletFakeRise);
        a.sprite_index = sprite_index;
        a.image_index = image_index;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        instance_destroy();
    }
    scrCreateLight(1/50);
}

#endregion

#region 0:51 - 1:10 (Post Pattern)

//0:51 - 0:56
if (Timer == 50*51){
    instance_destroy(objBulletFakeRise);
    with(objLightEffect){
        image_alpha = 1;
        spd = -1/15;
    }
}

if (Timer > 50*51 && Timer < 50*56){
    if (!Act[0]){
        Act[0] = 8;
        Dir = irandom(360);
        Dir2 = irandom(360);
    }
    
    if (!Act[1]){
        Act[1] = 2;
        
        for (var i = 0; i < 360; i += 360/6){
            a = instance_create(0,0,objBullet01);
            a.direction = i + Dir;
            a.speed = 12;
        }
        
        for (var i = 0; i < 360; i += 360/6){
            a = instance_create(800,0,objBullet01);
            a.direction = i + Dir2;
            a.speed = 12;
        }
    }
    
    if (!Act[2]){
        Act[2] = 30;
        XX = irandom(650)
        repeat(4){
            a = instance_create(irandom(800),0,objBulletMiniBall);
            a.vspeed = random_range(10,13);
        }
    }
}

//0:56
if (Timer == 50*56){
    with(objBullet01){
        a = instance_create(x,y,objBulletBigAni);
        a.sprite_index = sprite_index;
        a.image_index = image_index;
        a.image_angle = image_angle;
        
        instance_destroy();
    }
    Count = 0;
    Act[0] = 0;
    Act[1] = 0;
    XX = irandom(800/4); 
}

//0:56 - 1:00
if (Timer > 50*56 && Timer < 50*60+15){
    __view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ),400,0.2) );
    
    if (!Act[0]){
        Act[0] = 3;
        a = instance_create(irandom(800),400+608,objBulletView);
        a.gravity_direction = 90 + irandom_range(-10,10);
        a.gravity = 0.3;
    }
    
    if (!Act[1]){
        for (var i = 0; i < 800; i += 800/4){
            a = instance_create(XX + i,400+608,objBulletView);
            a.vspeed = -10;
            a.sprite_index = sprPCircle;
            a.image_index = 8;
        }
        
        Count ++;
        if (Count > 10){
            Count = 0;
            Act[1] = 15;
            XX = irandom(800/4);;
        } else {
            Act[1] = 1;
        }
    }
}

//1:00
if (Timer == 50*60+15){
    with(objBulletView){
        Destroy = true;
        gravity = 0;
        speed = 20;
        direction = point_direction(scrPX(),scrPY(),x,y);
    }
    
    instance_create(60,304,objBulletLunaCircle);
    instance_create(800-60,304,objBulletLunaCircle);
}

//1:00 - 1:10
if (Timer > 50*60+15 && Timer < 50*70){
    __view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ),0,0.2) );
}

//1:05
if (Timer == 50*65+15){
    //instance_destroy(objPlayerKiller);
    with(objPlayerKiller){
        repeat(5){
            a = instance_create(x,y,objBullet01);
            a.speed = 1;
            a.friction = -0.5;
            a.direction = point_direction(scrPX(),scrPY(),x,y) + irandom_range(-30,30);
            a.sprite_index = sprite_index;
            a.image_index = image_index;
            a.image_xscale = image_xscale;
            a.image_yscale = image_yscale;
            a.image_alpha = image_alpha;
        }
        instance_destroy();
    }
    
    (instance_create(400,0,objBulletInvisSpin)).hspeed = -1;
    (instance_create(400,0,objBulletInvisSpin)).hspeed = 1;
    
    Ran = irandom(360);
    with(objBulletInvisSpin){
        Angle = 90 + other.Ran * sign(hspeed);
    }
}

//1:09
if (Timer == 50*69){
    scrCreateLight(1/65,c_black);
}

//1:10
if (Timer == 50*70){
    global.noDeath = true;
}

//1:10 (Take a break)
if (Timer == 50*70+10){
    instance_destroy(objPlayerKiller);
    instance_destroy(objBulletInvisSpin);
    global.noDeath = false;
    with(objLightEffect){
        spd = -1/60;
        image_blend = c_white;
    }
    
    __background_set( e__BG.Index, 0, bClouds );
    __background_set( e__BG.XScale, 0, 800/background_get_width(bClouds) );
    __background_set( e__BG.YScale, 0, 608/background_get_height(bClouds) );
    __background_set( e__BG.Alpha, 0, 0 );
    
    __background_set( e__BG.Index, 1, bMoreClouds );
    __background_set( e__BG.HSpeed, 1, 0.5 );
    __background_set( e__BG.Alpha, 1, 0.3 );
    //background_hspeed[0] = 0.5;
}

#endregion

#region 1:10 - 1:49 (Take a Break - Look Up)

//1:10 - 1:27
if (Timer > 50*70+15 && Timer < 50*87){
    if (!Act[0]){
        Act[0] = 6;
        a = instance_create(0,irandom(608),objBullet01);
        a.direction = -45;
        a.speed = 6;
        a.sprite_index = sprBulletKunai;
        
        a = instance_create(800,irandom(608),objBullet01);
        a.direction = 180+45;
        a.speed = 6;
        a.sprite_index = sprBulletKunai;
    }
    
    if (!Act[1]){
        Act[1] = 15;
        a = instance_create(irandom(800),0,objBulletMiniBall);
        a.vspeed = 7;
    }
    
    //Background animation
    __background_set( e__BG.Alpha, 0, 0.4 + lengthdir_x(0.25,global.count*2) );
}
 

//1:25 - 1:27
if (Timer == 50*85){
    Spd = 2;
    Alp = 1;
}
if (Timer > 50*85 && Timer < 50*87+40){
    repeat(5){
        a = instance_create(400,304,objBullet01);
        a.speed = Spd;
        a.direction = irandom(360)
        a.image_index = 13;
        a.Tag = "Burst";
    }
    
    Spd += 0.03;
    __background_set( e__BG.Alpha, 0, max(__background_get( e__BG.Alpha, 0 ) - 1/75,0) );
    __background_set( e__BG.Alpha, 1, max(__background_get( e__BG.Alpha, 1 ) - 1/75,0) );
}

//1:26 - 1:28
if (Timer > 50*86 && Timer < 50*88){
    with(objBullet01){
        if (Tag == ""){
            mask_index = sprEmpty;
            image_alpha = other.Alp;
        }
    }
    
    Alp -= 1/100;
}

//1:28
if (Timer == 50*88){
    with(objBullet01){
        if (Tag == "") instance_destroy()
        else {
            speed = 0;
            image_alpha = 0.5;
            mask_index = sprEmpty;
        }
    }
    
    instance_create(400-16,608,objPlatformGray);
}

//1:28 - 1:30
if (Timer > 50*88 && Timer < 50*90+30){
    with(objBullet01){
        x += irandom_range(-1,1);
        y += irandom_range(-1,1)
    }
}

if (Timer == 50*90+30){
    instance_destroy(objPlatform);
    with(objBullet01){
        speed = random_range(15,25);
        mask_index = sprite_index;
        image_alpha = 1;
    }
    Count = 0;
	Dir2 = choose(-1,1);
    
    alarm[1] = 470;
}

//1:30 - 1:48 (Look Up)
if (Timer > 50*90+30 && Timer < 50*108+20){
    __view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ),0,0.2) );
    if (!Act[0]){
        with(objBulletFalling){
            if (YY == 60){
                YY = -1;
                hspeed = 0;
                vspeed = 20;
                __view_set( e__VW.YView, 0, -5 );
            } else if (vspeed == 0){
                YY += 30;
            }
        }
        
        Ran = random(800/10);
        Dir = random_range(-1,1);
        //for (var i = 0; i < 800; i += 800/10)
        repeat(4){
            (instance_create(irandom(800),0,objBulletFalling)).hspeed = Dir;
        }
        
        if (Count == 0) Act[0] = 15;
        else { Act[0] = 45; }
        Count = (Count + 1) mod 2;
    }
    
    //1:40
    if (Timer > 50*100 && !Act[1]){
        Act[1] = 4;
        
        for (var i = 0; i < 4; i ++)
        {
            a = instance_create(burstXX[i],0,objBullet01);
            a.speed = 5;
            a.direction = irandom(360);
            a.image_xscale = 0.3;
            a.image_yscale = a.image_xscale;
        }
    }
    
    if (!Act[2]){
        switch (State){
            case 0:
                instance_create(400+irandom(400)*Dir2,irandom(100),objBulletBigBurst);
				Dir2 = -Dir2;
                Act[2] = 10;
            break;
            case 1:
                instance_create(400+irandom(400)*Dir2,irandom(100),objBulletBigBurst);
                Act[2] = 20;
            break;
            case 2:
                with(objBulletBigBurst){
                    alarm[0] = 1;
                    alarm[1] = 30;
                }
                Act[2] = 40;
            break;
            case 3:
                instance_destroy(objBulletBigBurst);
				Dir2 = choose(-1,1);
                with(objBulletSlowFast) event_user(0);
                Act[2] = 50;
            break;
        }
        State = (State + 1) mod 4;
    }
}

//1:48
if (Timer == 50*108+20){
    __view_set( e__VW.YView, 0, 0 );
    scrCreateLight(-1/55,c_black);
    with(objPlayerKiller){
        if (object_index == objBulletBigBurst) Effect = false;
        
        a = instance_create(x,y,objBulletFakeCenter);
        a.sprite_index = sprite_index;
        a.image_index = image_index;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        
        instance_destroy();
    }
}

//1:49
if (Timer > 50*109+30 && Timer < 50*109+45){
    for (var i = 0; i < 360; i += 360/25)
    {
        a = instance_create(400,304,objBullet01);
        a.speed = 25;
        a.direction = i + point_direction(400,304,scrPX(),scrPY());
    }
}

#endregion

#region 1:49 - 2:09 (Fast Line)

//1:49
if (Timer == 50*109+45){
    with(objBulletFakeCenter){
        a = instance_create(x,y,objBulletTail);
        a.Type = "Alpha";
        a.Spd = 1/irandom_range(10,25);
        a.sprite_index = sprite_index;
        a.image_index = image_index;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.direction = direction;
        a.image_angle = image_angle;
        a.speed = random_range(5,20);
        
        instance_destroy();
    }
    Dir = point_direction(400,100,scrPX(),scrPY())-270;
    
    for (var i = 0; i <= 2; i ++)
        { Act[i] = 0; }
}

//1:49 - 1:58
if (Timer > 50*109+45 && Timer < 50*118+25){
    if (!Act[0]){
        Act[0] = 14;
        
        Ran = irandom(360);
        for (var i = 0; i < 360; i += 360/100){
            a = instance_create(400,100,objBullet01);
            a.speed = 200;
            a.direction = i + Ran;
        }
        
        Dir = clamp(Dir + choose(-1,1)*6,-30,30);
        for (var i = 0; i < 320; i += 320/75){
            a = instance_create(400,100,objBullet01);
            a.speed = 20;
            a.direction = i - 70 + Dir;
        }
        LineDir = irandom(360);
        Count = 3;
        Act[1] = 0;
    }
    if (!Act[1]){
        Act[1] = 2 + 50 * (Count <= 0);
        Count --;
        
        for (var i = 0; i < 360; i += 360/15){//12
            a = instance_create(400,100,objBullet01);
            a.speed = 15;
            a.direction = i + LineDir;
            
            if (Timer < 50*110+23){
                a.mask_index = sprEmpty;
                a.image_alpha = 0.5;
            }
        }
    }
}

//1:58
if (Timer == 50*118+25){
    with(objPlayerKiller){
        a = instance_create(x,y,objBulletBounceScreen);
        a.speed = irandom_range(50,100);
        a.direction = point_direction(scrPX(),scrPY(),x,y);
        a.sprite_index = sprite_index;
        a.image_index = image_index;
        
        instance_destroy();
    }
    
    Ran = irandom(360);
}

switch (Timer){
    case 5985:
        with(objBulletBounceScreen){
            if (Tag == 0) event_user(0);
        }
        
        Spd = 40;
        repeat(3){
            for (var i = 0; i < 360; i += 360/4){
                a = instance_create(400,100,objBulletStop);
                a.speed = Spd;
                a.direction = i + Ran;
            }
            Spd += 30;
        }
    break;
    case 5990:
        with(objBulletBounceScreen){
            if (Tag == 1) event_user(0);
        }
        
        Spd = 40;
        repeat(3){
            for (var i = 0; i < 360; i += 360/4){
                a = instance_create(400,100,objBulletStop);
                a.speed = Spd;
                a.direction = i + Ran + 45;
            }
            Spd += 30;
        }
    break;
}

//2:00
if (Timer == 50*120){
    with(objBulletStop){
        repeat(2){
            a = instance_create(x,y,objBulletSmall);
            a.speed = random_range(3,10);
            a.gravity = random_range(0.3,0.4);
            a.direction = 90 + irandom_range(-90,90);
            a.image_xscale = image_xscale;
            a.image_yscale = image_yscale;
        }
        instance_destroy();
    }
    Count = 4;
}

//2:00 - 2:06
if (Timer > 50*120 && Timer < 50*126+35){
    if (!Act[0]){
        Act[0] = 15;
        
        Act[1] = 0;
        Count = 4;
        Ran = irandom(360);
        XX = irandom(800);
        //Spd = random_range(0.15,0.2)*choose(-1,1);
        //Spd = random_range(0.2,0.3)*choose(-1,1);
        Spd = random_range(0.20,0.25)*choose(-1,1);
    }
    
    if (!Act[1]){
        Count --;
        Act[1] = 2 + 50 * (Count <= 0);
        
        for (var i = 0; i < 360; i += 360/15){
            a = instance_create(XX,0,objBulletCurving);
            a.Angle = i + Ran;
            a.initAngle = a.Angle;
            a.Spd = Spd;
            
            if (Timer < 50*121){
                a.mask_index = sprEmpty;
                a.image_alpha = 0.2;
            }
        }
        
        if (Count == 3){
            for (var j = 200; j <= 300; j += 250){
                for (var i = 0; i < 360; i += 360/100){
                    a = instance_create(XX,0,objBullet01);
                    a.direction = i + Ran;
                    a.speed = j;
                    a.mask_index = sprEmpty;
                    a.image_alpha = 0.4;
                    a.depth = 5;
                }
            }
        }
    }
}
/*if (Timer > 50*120 && Timer < 50*126+35 && !Act[0]){
    Act[0] = 15;
    
    Ran = irandom(360);
    XX = irandom(800);
    Spd = random_range(0.2,0.3)*choose(-1,1);
    
    for (var i = 0; i < 360; i += 360/20){
        a = instance_create(XX,0,objBulletCurving);
        a.Angle = i + Ran;
        a.initAngle = a.Angle;
        a.Spd = Spd;
        
        if (Timer < 50*121){
            a.mask_index = sprEmpty;
            a.image_alpha = 0.2;
        }
    }
}*/

switch (Timer){
    case 6342:
        repeat(25){
            a = instance_create(0,0,objBulletPreparate);
            a.speed = random_range(20,30);
            a.direction = -irandom(90);
            a.sprite_index = choose(sprBulletArrowhead,sprBulletKunai,sprBulletRazzor,sprPCircle,sprPBigArrowhead);
            a.image_index = a.image_number-1;
            a.image_xscale = random_range(0.5,1.5);
            a.image_yscale = a.image_xscale;
        }
    break;
    case 6374:
        repeat(25){
            a = instance_create(800,0,objBulletPreparate);
            a.speed = random_range(20,30);
            a.direction = 180+irandom(90);
            a.sprite_index = choose(sprBulletArrowhead,sprBulletKunai,sprBulletRazzor,sprPCircle,sprPBigArrowhead);
            a.image_index = a.image_number-1;
            a.image_xscale = random_range(0.5,1.5);
            a.image_yscale = a.image_xscale;
        }
		Alp = 1;
    break;
}

//2:07 - 2:09
if (Timer > 50*127+45 && Timer < 50*129){
    __view_set( e__VW.YView, 0, irandom_range(-3,3) );
    
    if (!Act[0]){
        Act[0] = 3;
        XX = 0;
        repeat(2){
            Dir = 180+irandom(90);
            if (XX == 0) Dir = -irandom(90);
            
            a = instance_create(XX,0,objBullet01);
            a.speed = random_range(15,20);
            a.direction = Dir
            a.sprite_index = choose(sprBulletArrowhead,sprBulletKunai,sprBulletRazzor,sprPCircle,sprPBigArrowhead);
            a.image_index = a.image_number-1;
            a.image_xscale = random_range(0.5,1.5);
            a.image_yscale = a.image_xscale;
			a.image_alpha = Alp;
            
            XX = 800;
        }
    }
}

//2:08
if (Timer == 50*128){
    scrCreateLight(1/85);
}

//2:08 - 2:09
if (Timer > 50*128+30 && Timer < 50*129){
	global.noDeath = true;
	Alp -= 1/30;
	with(objBullet01){
		image_alpha = other.Alp;
	}
}

#endregion

#region 2:09 - 2:34 (RNG Hell)

//2:09
if (Timer == 50*129){
    instance_destroy(objPlayerKiller);
    instance_destroy(objLightEffect);
    scrCreateLight(-1/5);
	global.noDeath = false;
	Alp = 0;
	
    __view_set( e__VW.YView, 0, 0 );
    
    for (var i = 0; i < 360; i += 360/6){
        a = instance_create(400,304,objBulletFinalSpin);
        a.Angle = 270 + i;
    }
}

//2:09
if (Timer == 50*129 + 15){
    Dir = 1;
    var setDir = sign(scrPX() - 400);
    if (setDir != 0) Dir = setDir;
    
    with(objBulletFinalSpin){
        Spd = 13 * other.Dir;
        alarm[0] = 2;
    }
}

//2:09 - 2:11 (Shake)
if (Timer > 50*129 + 15 && Timer < 50*131){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
}

//2:11
if (Timer == 50*131){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    scrCreateLight(-1/5);
    instance_destroy(objPlayerKiller);
}

//2:11 - 2:13
if (Timer > 50*131 + 25 && Timer < 50*133){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
    
    a = instance_create(irandom(800),0,objBullet01);
    a.vspeed = random_range(15,25);
    a.sprite_index = choose(sprBulletArrowhead,sprBulletKunai,sprBulletRazzor,sprPCircle,sprPBigArrowhead);
    a.image_index = a.image_number-1;
}

//2:13
if (Timer == 50*133){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    scrCreateLight(-1/5);
    instance_destroy(objPlayerKiller);
    Dir = 25;
}

//2:13 - 2:15
if (Timer > 50*133+45 && Timer < 50*135+25){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
    
    a = instance_create(400,0,objBullet01);
    a.direction = 270 + 90 - Dir;
    a.speed = 25;
    a.sprite_index = sprPBigArrowhead;
    a.image_index = a.image_number-1;
    
    a = instance_create(400,0,objBullet01);
    a.direction = 270 - 90 + Dir;
    a.speed = 25;
    a.sprite_index = sprPBigArrowhead;
    a.image_index = a.image_number-1;
    
    a = instance_create(400,0,objBullet01);
    a.direction = 270 + irandom_range(-40,40)
    a.speed = random_range(15,20);
    a.image_xscale = 0.5;
    a.image_yscale = a.image_xscale;
    a.sprite_index = sprBulletKunai;
    a.image_index = a.image_number-1;
    
    Dir ++;
}

//2:15
if (Timer == 50*135+25){
    scrCreateLight(-1/5);
    instance_destroy(objPlayerKiller);
    Zoom = 1;
}

//2:15 - 2:18
if (Timer > 50*135+25 && Timer < 50*138+25){
    Zoom = lerp(Zoom,2,0.2);
    __view_set( e__VW.XView, 0, (Zoom-1)*-400 );
    __view_set( e__VW.YView, 0, (Zoom-1)*-304 );
    __view_set( e__VW.WView, 0, 800 * Zoom );
    __view_set( e__VW.HView, 0, 608 * Zoom );
    
    if (Timer > 50*136){
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (irandom_range(-2,2)) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (irandom_range(-2,2)) );
    }
    
    if (Timer > 50*136 && !Act[0]){
        Act[0] = 2;
        a = instance_create(-400,608+304,objBulletOutsideView);
        a.direction = 90 - irandom(35);
        a.speed = random_range(25,40);
        a.gravity = 0.5;
        a.image_xscale = 2;
        a.image_yscale = a.image_xscale;
        
        
        a = instance_create(800+400,608+304,objBulletOutsideView);
        a.direction = 90 + irandom(35);
        a.speed = random_range(25,40);
        a.gravity = 0.5;
        a.image_xscale = 2;
        a.image_yscale = a.image_xscale;
    }
}

//2:18
if (Timer == 50*138+25){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    __view_set( e__VW.WView, 0, 800 );
    __view_set( e__VW.HView, 0, 608 );
    
    scrCreateLight(-1/5);
    instance_destroy(objPlayerKiller);
    
	repeat(40){
        instance_create(irandom_range(20,780),irandom_range(-30,50),objBulletFinalSlow);
	}
	
    /*for (var i = 0; i < 40; i ++){
        a = instance_create(irandom_range(20,780),irandom_range(-30,50),objBulletFinalSlow);
        a.alarm[0] = 25 + i * 2;
    }*/
}

//2:19
if (Timer == 50*139){
	Count = 1;
	YY = 320;

	while(YY > 0){
	    var Inst = instance_nearest(irandom(800),YY,objBulletFinalSlow);
	    if (Inst != noone && Inst.alarm[0] == -1 && Inst.speed != 20){
			Inst.alarm[0] = Count * 2;
			Count ++;
	    }
	    YY --;
	}
}

//2:19 - 2:20 (Shake)
if (Timer > 50*139 && Timer < 50*140+30){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
}

//2:20
if (Timer == 50*140+30){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    instance_destroy(objPlayerKiller);
    scrCreateLight(-1/5);
    
    Ran = irandom(360);
    for (var i = 0; i < 360; i += 360/50)
    {
        a = instance_create(400,608,objBulletCircleFinal);
        a.Angle = i + Ran;
    }
}

//2:21
if (Timer == 50*141+25){
    Dir = choose(-1,1);
    
    with(objBulletCircleFinal){
        Dir = other.Dir
        event_user(0);
    }
}

//2:21 - 2:22 (Shake)
if (Timer > 50*141+25 && Timer < 50*142+45){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
}

//2:22
if (Timer == 50*142+45){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    scrCreateLight(-1/5);
    instance_destroy(objPlayerKiller);
    
    instance_create(400,608+300,objBulletBigFinal);
    (instance_create(400,608+300,objBulletBigFinal)).Spd = -2;
}

//2:22
if (Timer > 50*142+45 && Timer < 50*144+40){
    __view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ),400,0.3) );
}

//2:23
if (Timer == 50*143+20){
    with(objBulletBigFinal){
        alarm[0] = 2;
        Spd *= 3;
    }
}

//2:23 - 2:24 (Shake)
if (Timer > 50*143+20 && Timer < 50*144+45){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, 400 + irandom_range(-2,2) );
}

//2:24
if (Timer == 50*144+45){
    instance_destroy(objPlayerKiller);
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    scrCreateLight(-1/5);
}


//2:25 - 2:27
if (Timer > 50*145+40 && Timer < 50*147){
    __view_set( e__VW.XView, 0, irandom_range(-2,2) );
    __view_set( e__VW.YView, 0, irandom_range(-2,2) );
    
    if (!Act[0]){
        Act[0] = 2;
        repeat(2){
        a = instance_create(irandom_range(-100,900),0,objBulletFinalSpam);
        a.speed = 14;
        a.direction = 270 + 30*choose(-1,1);
        }
    }
}

if (Timer == 7359){
    scrCreateLight(1/80);
	Alp = 1;
}

switch (Timer)
{
    case 7359: case 7370: case 7380:
    case 7390: case 7400: case 7410:
        XX = irandom(800);
        repeat(26){
            a = instance_create(XX,0,objBullet01);
            a.speed = random_range(10,20);
            a.direction = point_direction(a.x,a.y,scrPX(),scrPY())+irandom_range(-90,90);
            a.sprite_index = choose(sprBulletArrowhead,sprBulletKunai,sprBulletRazzor,sprPCircle,sprPBigArrowhead);
            a.image_index = a.image_number-1;
			a.image_alpha = Alp;
        }
    break;
}

if (Timer > 7400 && Timer < 50*148+2){
	global.noDeath = true;
	Alp -= 1/50;
	with(objBullet01){
		image_alpha = other.Alp;
	}
}


//2:28
if (Timer == 50*148+20){
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    instance_destroy(objPlayerKiller);
	global.noDeath = false;
    with(objLightEffect) spd = -1/10;
    
    repeat(80){
        a = instance_create(400,0,objBullet01);
        a.speed = random_range(8,25);
        a.direction = -irandom(180);
        a.friction = 0.4;
        a.sprite_index = sprPCircle;
        a.image_index = a.image_number-1;
        a.image_xscale = random_range(0.5,1);
        a.image_yscale = a.image_xscale;
    }
}

if (Timer == 50*148+35){
    instance_create(400,304,objLittleReminder);
}


//2:30
if (Timer > 50*150+25 && Timer < 50*152+20){
    with(objBullet01){
        if (speed == 0) speed = 0.001;
        
        friction = -0.036;
        direction = point_direction(x,y,scrPX(),scrPY());
    }
}

//2:32 (Clear)
if (Timer == 50*152+20){
    instance_destroy(objPlayerKiller);
    instance_destroy(objLittleReminder);
    
    with(objPlayer){
        frozen = true;
    }
    
    instance_create(0,0,objResultScreen);
    
    if (global.hitCount && !global.practiceMode && global.hit < global.hitPB)
        global.hitPB = global.hit;
    scrSaveGame(false);
}

//2:34
if (Timer == 50*154){
    with(objResultScreen) event_user(0);
}

#endregion