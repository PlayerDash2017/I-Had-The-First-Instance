if (dif == 4)   //load game
{
    if (file_exists("Data\\save" + string(global.savenum)))
    {                        
        scrLoadGame(true);
    }
    else
    {
        scrKillPlayer();
    }
}
else    //start new game
{
    scrStartNewGame(dif);  
    
    with (objPlayer)
    {
        instance_destroy();
    }                          
}

