local tree = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/testers/git/trees/"..game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/testers/branches/main")).commit.commit.tree.sha.."?recursive=1"))
local found = false
for _, scrip in ipairs(tree.tree) do
    if scrip.type == "blob" and scrip.path ~= "Loader.lua" and string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:lower(), string.split(scrip.path:lower(), ".lua")[1]) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptiHub/testers/main/"..scrip.path))()
        found=true
        break
    end
end
if not found then print("game not supported") end
