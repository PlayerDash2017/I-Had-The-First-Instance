var Id = async_load[? "id"];
var status = async_load[? "status"];
var result = async_load[? "result"];

if (Id == global.httpUpdateCheck)
{                 
    if (status == 0)
    {                        
        var map = json_decode(result);
        if (map != -1)
        {
            global.newestVersionNumber = map[? "game-version"];
            global.newestVersionLink = map[? "download-link"];
            if (!is_undefined(global.newestVersionNumber) && !is_undefined(global.newestVersionLink))
            {
                global.isUpToDate = (global.gameVersion == global.newestVersionNumber);
                updateString = scrFormat("Current version {global.gameVersion} is outdated! {global.newestVersionNumber} is available.#Press Tab to open the download link");
            }
        }
    }
}

