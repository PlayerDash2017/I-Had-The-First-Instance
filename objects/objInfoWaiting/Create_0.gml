t = global.timerPB
pb_str = (string(floor(t / 3000))) + ":"
if (((floor(t / 50)) % 60) <= 9)
    pb_str += "0"
pb_str += string((floor(t / 50)) % 60)

h = scrTernary(global.hitPB == 114514,"???",global.hitPB)

