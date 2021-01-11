local commandLineArguments = {...};
local fileSystem = require("filesystem");
local io = require("io");
local task = tostring((commandLineArguments or {})[1]):lower();
--allows people to set things like computer address and things

local tasks = {
    ["-s"] = function(indexOfFlag)
        local config = io.open("./config.cfg", "a");
        --requires 1 argument
        local whatToSet = tostring(commandLineArguments[indexOfFlag+1]);
        local value = tostring(commandLineArguments[indexOfFlag+2]);
        if (tostring(whatToSet):match("%W") or tostring(value):match("%W")) then
            config = config:close();
            return error ("invalid key or value")
        end
        --bad way to read and set config due to duplicates but oh dear oh well sucks to suck :Q
        config:write( whatToSet .." = "..value, "\n")
        print("wrote", whatToSet, "to config file.")
        config = config:close();
    end;
    ["-r"] = function()
        --reset all flags
        local config = io.open("./config.cfg", "w");
        print("cleared the config file.")
        config = config:close();
    end
};

--initialize
for i, v in pairs(commandLineArguments) do
    if (tasks[v:lower()]) then
        tasks[v:lower()](i)
    end
end

