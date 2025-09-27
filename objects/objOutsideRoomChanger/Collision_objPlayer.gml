if (!scrInRange(other.x, 0, room_width) || !scrInRange(other.y, 0, room_height))  //if outside room
{
    if (!smooth)
    {
        event_user(0);
    }
    else
    {
        if (other.x < 0)
            { other.x += room_width; }
        if (other.x > room_width)
            { other.x -= room_width; }
        if (other.y < 0)
            { other.y += room_height; }
        if (other.y > room_height)
            { other.y -= room_height; }
            
        other.x += offsetX;
        other.y += offsetY;
        
        room_goto(roomTo);
    }
}

