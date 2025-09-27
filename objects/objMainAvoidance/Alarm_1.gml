/// @description Burst

burstIndex ++;

if (burstIndex > 4){
    for (var i = 0; i < 4; i ++)
    {
        burstXX[i] = -1000;
        burstYY[i] = -1000;
    }
    burstIndex = 0;
}

burstXX[burstIndex] = irandom(800);
burstYY[burstIndex] = irandom(100);

alarm[1] = 60;

