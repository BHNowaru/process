local readerapi = dofile("./config-reader.lua");
local reader = readerapi.new();
--init and look for config
reader:setpath(".");
local isCachePresent = reader:open("config.cfg");
local initializedComputers = reader:seek("computer")[1];
if (not isCachePresent) then
    return error("run config.lua with the parameters \"-s computer [your_computer_address]\"" )
end