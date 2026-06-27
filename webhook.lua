-- dont spam webhook i lazy delete 

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/elm3lem3omar2020-dot/ss/refs/heads/main/noti.lua"))()
end)


--// Webhook 
local placeId = game.PlaceId
local jobId = game.JobId

local sea1 = 2753915549
local sea2 = 4442272183
local sea3 = 7449423635

local CheckSea
if placeId == sea1 then
    CheckSea = "Sea 1"
elseif placeId == sea2 then
    CheckSea = "Sea 2"
elseif placeId == sea3 then
    CheckSea = "Sea 3"
else
    CheckSea = "unknown sea"
end

local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ExecutorUsing = identifyexecutor()
local HttpService = game:GetService("HttpService")
local Data =
{
    ["embeds"] = {
        {
            ["title"] = "**Script Main V2 Patch**",  -- Thêm phần tiêu đề vào đây
            ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId,
            ["description"] = "",  -- Xóa phần hiển thị UserId
            ["color"] = tonumber("65280"),
            ["thumbnail"] = {["url"] = "https://cdn.discordapp.com/attachments/1520120968620802068/1520330776007278672/129951712_2pacgettyimages-76154363.jpg.webp?ex=6a40cddf&is=6a3f7c5f&hm=ce69b5b5f331beac7363a2256d7f6a79b3e1b8e9a1c20f30859da7227d29b5aa&"},
            ["fields"] = {
                {
                    ["name"] = "Name:",
                    ["value"] = "```"..game.Players.LocalPlayer.DisplayName.."```",  -- Thêm tên người chơi vào đây
                    ["inline"] = true
                },
                {
                    ["name"] = "Acc:",
                    ["value"] = "```"..game.Players.LocalPlayer.Name.."```",  -- Thêm tên tài khoản vào đây
                    ["inline"] = true
                },
                {
                    ["name"] = "Execute:",
                    ["value"] = "```"..ExecutorUsing.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Sea:",
                    ["value"] = "```" .. CheckSea.."```", 
                    ["inline"] = true
                }
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S") -- Thêm thời gian vào đây
        }
    }
}

local Headers = {["Content-Type"] = "application/json"}
local Encoded = HttpService:JSONEncode(Data)

local Request = http_request or request or HttpPost or syn.request
local Final = {Url = "https://discord.com/api/webhooks/1520331207496437790/U33ArIOggqu749Px4Fw6EbAsddbHd7RuxZneEvEj-5HlwGNAnLvkvsMFiWNruDauQzCe", Body = Encoded, Method = "POST", Headers = Headers}
Request(Final)
