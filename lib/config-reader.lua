local reader = {prototype = {}}
function reader.prototype:setpath(path)
    path = tostring(path):gsub("%/$", ""); --remove trailing /
    self.path = path;
end

function reader.prototype:open(filename)
    filename = tostring(filename);
    if (not self.path) then return nil end;
    print(self.path.."/"..filename)
    self.cache = io.open(self.path.."/"..filename);
end

function reader.prototype:close(filename)
    if (not self.cache) then return nil end
    self.cache = self.cache:close();
end

function reader.prototype:seek(value)
    if (not self.cache) then return nil end;
    local responses = {}
    for line in self.cache:lines() do
        if (line:lower():match("^"..value)) then responses[#responses+1] = line end;
    end
    return responses;
end

function reader.new()
    return setmetatable({}, {__index = reader.prototype});
end

return reader