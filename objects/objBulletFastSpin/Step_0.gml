x = 400 + lengthdir_x(Dis,Angle);
y = 100 + lengthdir_y(Dis,Angle);

Dis = lerp(Dis,maxDis,0.1);
if (alarm[0] != -1){
    Angle += 16 * Dir;
}

