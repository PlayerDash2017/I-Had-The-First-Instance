x = 400 + lengthdir_x(Dis,Angle);
y = 608 + lengthdir_y(Dis,Angle);

if (!Start){
    Dis = lerp(Dis,400,0.4);
} else {
    Angle += 10 * Dir;
    Dis -= 3;
}

