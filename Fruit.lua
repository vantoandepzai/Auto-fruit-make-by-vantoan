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
            ["title"] = "Script auto fruit by Lê Văn Toàn", 
            ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId,
            ["description"] = "",  -- Xóa phần hiển thị UserId
            ["color"] = tonumber("0xf7c74b"),
            ["thumbnail"] = {["url"] = ""},
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
local Final = {Url = "https://zalo.me/g/vlayau686", Body = Encoded, Method = "POST", Headers = Headers}
Request(Final)

-- Thông Báo 
require(game.ReplicatedStorage:WaitForChild("Notification")).new(
            "Alex Hub ~ Auto Nhặt Fruit"
        ):Display()
-- Thông Báo 
require(game.ReplicatedStorage:WaitForChild("Notification")).new(
            "Loading..."
        ):Display()
-- Hàm làm tròn
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end

local Number = math.random(1, 1000000)
local DevilFruitESP = true
local isVietnamese = true -- Đặt `false` nếu người dùng là nước ngoài

-- Hàm kiểm tra nil
local function isnil(value)
    return value == nil
end

function UpdateDevilChams()
    for _, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v.Name, "Fruit") and not isnil(v:FindFirstChild("Handle")) then
                    if not v.Handle:FindFirstChild('NameEsp' .. Number) then
                        -- Tạo ESP cho trái cây
                        local bill = Instance.new('BillboardGui', v.Handle)
                        bill.Name = 'NameEsp' .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true

                        local name = Instance.new('TextLabel', bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = Enum.FontSize.Size14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.new(1, 0, 0) -- Màu đỏ
                        -- Chỉ hiển thị tên trái cây
                        name.Text = (isVietnamese and "Fruit" or "Fruit")
                    else
                        local textLabel = v.Handle['NameEsp' .. Number].TextLabel
                        -- Cập nhật tên trái cây
                        textLabel.Text = (isVietnamese and "Fruit" or "Fruit")
                    end
                end
            else
                -- Xóa ESP nếu DevilFruitESP là false
                if not isnil(v:FindFirstChild("Handle")) and v.Handle:FindFirstChild('NameEsp' .. Number) then
                    v.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
end

-- Tự động cập nhật ESP cho trái cây
spawn(function()
    while wait(1) do
        UpdateDevilChams()
    end
end)

-- Mã gốc của bạn, với chức năng nhặt trái cây và thông báo:
repeat
    wait()
until game.IsLoaded and (game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()) and
    (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())

game.Players.LocalPlayer.Idled:connect(
    function()
        while wait(3) do
            if l then
                game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end
        end
    end
)

local a = game.Players.LocalPlayer
local b = a.Character
local c = game.TweenService
local d = Instance.new("BodyVelocity")
d.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
d.Velocity = Vector3.new()
d.Name = "bV"
local e = Instance.new("BodyAngularVelocity")
e.AngularVelocity = Vector3.new()
e.MaxTorque = Vector3.new(1 / 0, 1 / 0, 1 / 0)
e.Name = "bAV"

-- Kiểm tra xem có trái cây không
local fruitsFound = false  -- Biến kiểm tra xem có trái cây hay không

for f, f in next, workspace:GetChildren() do
    if f.Name:find("Fruit") and (f:IsA("Tool") or f:IsA("Model")) then
        fruitsFound = true  -- Đã tìm thấy trái cây
        
        -- Thông báo "Đang nhặt fruit"
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Lê Văn Toàn",
                Text = "Đang Nhặt Fruit",
                Duration = 10
            }
        )
        
        repeat
            local d = d:Clone()
            d.Parent = b.HumanoidRootPart
            local e = e:Clone()
            e.Parent = b.HumanoidRootPart
            local a =
                c:Create(
                b.HumanoidRootPart,
                TweenInfo.new((a:DistanceFromCharacter(f.Handle.Position) - 150) / 300, Enum.EasingStyle.Linear),
                {CFrame = f.Handle.CFrame + Vector3.new(0, f.Handle.Size.Y, 0)}
            )
            a:Play()
            a.Completed:Wait()
            b.HumanoidRootPart.CFrame = f.Handle.CFrame
            d:Destroy()
            e:Destroy()
            wait(1)
        until f.Parent ~= workspace
        wait(1)

        -- Thông báo khi đã nhặt trái
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Văn Toàn Hub",
                Text = "Đã Nhặt Fruit: " .. f.Name,
                Duration = 10
            }
        )

        local a =
            b:FindFirstChildOfClass("Tool") and b:FindFirstChildOfClass("Tool").Name:find("Fruit") and
            b:FindFirstChildOfClass("Tool") or
            (function()
                for a, a in a.Backpack:GetChildren() do
                    if a.Name:find("Fruit") then
                        return a
                    end
                end
            end)()
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
            "StoreFruit",
            a:GetAttribute("OriginalName"),
            a
        )
    end
end

-- Nếu không có trái cây, thông báo "Không tìm thấy trái trong server"
if not fruitsFound then
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Văn Toàn Hub",
            Text = "Không Có Fruit",
            Duration = 5
        }
    )
end

-- Thông báo đổi server (hiện một lần)
local serverHopNotified = false  -- Biến kiểm tra đã thông báo chưa

local a = game.JobId
repeat
    task.spawn(
        pcall,
        function()
            Time = 0.1
            repeat
                wait()
            until game:IsLoaded()
            wait(Time)
            local a = game.PlaceId
            local b = {}
            local c = ""
            local d = os.date("!*t").hour
            local e = false
            function TPReturner()
                local e
                if c == "" then
                    e =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" .. a .. "/servers/Public?sortOrder=Asc&limit=100"
                        )
                    )
                else
                    e =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" ..
                                a .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. c
                        )
                    )
                end
                local f = ""
                if e.nextPageCursor and e.nextPageCursor ~= "null" and e.nextPageCursor ~= nil then
                    c = e.nextPageCursor
                end
                local c = 0
                for e, e in pairs(e.data) do
                    local g = true
                    f = tostring(e.id)
                    if tonumber(e.maxPlayers) > tonumber(e.playing) then
                        for a, a in pairs(b) do
                            if c ~= 0 then
                                if f == tostring(a) then
                                    g = false
                                end
                            else
                                if tonumber(d) ~= tonumber(a) then
                                    local a =
                                        pcall(
                                        function()
                                            delfile("NotSameServers.json")
                                            b = {}
                                            table.insert(b, d)
                                        end
                                    )
                                end
                            end
                            c = c + 1
                        end
                        if g == true then
                            table.insert(b, f)
                            wait()
                            pcall(
                                function()
                                    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(b))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                                        a,
                                        f,
                                        game.Players.LocalPlayer
                                    )
                                end
                            )
                            wait(4)
                        end
                    end
                end
            end
            function Teleport()
                while wait() do
                    pcall(
                        function()
                            TPReturner()
                            if c ~= "" then
                                TPReturner()
                            end
                        end
                    )
                end
            end

            -- Kiểm tra và thông báo chỉ một lần khi đổi server
            if not serverHopNotified then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "Văn Thành Hub",
                        Text = "Đang Đổi Sever...",
                        Duration = 10
                    }
                )
                serverHopNotified = true  -- Đánh dấu là đã thông báo
            end

            Teleport()
        end
    )
    wait()
until game.JobId ~= a
function PostWebhook(Url, message)
    local request = http_request or request or HttpPost or syn.request
    local data =
        request(
        {
            Url = Url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(message)
        }
    )
    return ""
end
