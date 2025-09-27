image_index = irandom(image_number-1);
image_speed = 0;

direction = irandom(35) * 10;
speed = random(6);
gravity = (0.1+random(0.2)) * global.grav;

stick = false;
inst = noone;
offDist = 0;
offAngle = 0;

stickTo[0] = objBlock;
stickTo[1] = objPlayerKiller;
stickTo[2] = objPlatform;
stickTo[3] = objSlope;
stickTo[4] = objBlockDynamic;

