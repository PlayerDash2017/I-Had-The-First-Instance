//important
Timer = global.startTimer;
RealTimer = 0;
DeadFix = true;

for (var i = 0; i <= 2; i ++)
{
    Act[i] = 0;
}

scrStopMusic();
scrPlayMusic("FirstInstance",false);
global.noPause = true;

//others
speedIntro = false;
Spd = 0;
Alp = 1;
XX = 0;
YY = 0;
Dir = 0;
Dir2 = 1;
Ran = 0;
Tag = 0;
Count = 0;
State = 0;
Zoom = 1;
LineDir = 0;

burstIndex = -1;
for (var i = 0; i < 4; i ++)
{
    burstXX[i] = -1000;
    burstYY[i] = -1000;
}

