 
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomUILibrary"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = mainFrame


local op = Instance.new("ImageButton")
op.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
op.BorderColor3 = Color3.fromRGB(0, 0, 0)
op.BorderSizePixel = 0
op.Position = UDim2.new(0, 0, 0.0695410296, 0)
op.Size = UDim2.new(0, 46, 0, 45)
op.Image = "rbxassetid://12053823591"
op.Active = true
op.Selectable = true
op.Draggable = true
op.Parent = screenGui
op.MouseButton1Click:Connect(function()
	if mainFrame.Visible == false then
		mainFrame.Visible = true
	else
		mainFrame.Visible = false
	end
end)

-- Title Bar
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0.1, 0)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.Text = "Skid hub V1.0"
title.TextSize = 24
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.new(1, 1, 1)
title.Parent = mainFrame
title.BorderSizePixel = 0
title.BackgroundTransparency = 1
title.Active = false
title.TextXAlignment = Enum.TextXAlignment.Left

local x = Instance.new("TextButton")
x.Size = UDim2.new(0.05, 0, 1, 0)
x.Position = UDim2.new(0.95, 0, 0, 0)
x.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
x.BorderColor3 = Color3.new(0, 0, 0)
x.BorderSizePixel = 0
x.Text = "X"
x.BackgroundTransparency = 1
x.TextColor3 = Color3.new(255, 255, 255)
x.Font = Enum.Font.Legacy
x.Parent = title
x.MouseButton1Click:Connect(function()
print("soon")
end)



-- Tabs Frame (LEFT side)
local tabsFrame = Instance.new("ScrollingFrame")
tabsFrame.Name = "TabsFrame"
tabsFrame.Size = UDim2.new(0.25, 0, 0.9, 0)
tabsFrame.Position = UDim2.new(0, 0, 0.1, 0)
tabsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tabsFrame.BorderSizePixel = 0
tabsFrame.Parent = mainFrame
tabsFrame.ScrollBarThickness = 0
tabsFrame.BackgroundTransparency = 1

-- Tabs Layout
local tabList = Instance.new("UIListLayout")
tabList.Padding = UDim.new(0.01, 0)
tabList.SortOrder = Enum.SortOrder.LayoutOrder
tabList.Parent = tabsFrame

-- Content Frame (RIGHT side)
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(0.75, 0, 0.9, 0)
contentFrame.Position = UDim2.new(0.27, 0, 0.1, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame
contentFrame.BackgroundTransparency = 1
contentFrame.ScrollBarThickness = 0.2






local uic1 = Instance.new("UICorner")
uic1.CornerRadius = UDim.new(0, 20)
uic1.Parent = contentFrame

local uis = Instance.new("UIStroke")
uis.Color = Color3.new(0.2, 0.2, 0.2)
uis.Thickness = 2
uis.Parent = mainFrame





-- Content Layout
local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0.02, 0)
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Parent = contentFrame

-- Utility: Clear content
local function clearContent()
	for _, child in pairs(contentFrame:GetChildren()) do
		if not child:IsA("UIListLayout") then
			child:Destroy()
		end
	end
end

-- Executor detection
local function getExecutorName()
	local exploit =
		identifyexecutor and identifyexecutor() or
		(is_sirhurt_closure and "SirHurt") or
		(secure_load and "Sentinel") or
		(iskrnlclosure and "KRNL") or
		(pebc_execute and "ProtoSmasher") or
		(syn and "Synapse X") or
		(getexecutorname and getexecutorname()) or
		"Unknown Executor"
	return exploit
end

-- Widgets
local function createLabel(text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.95, 0, 0.03, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextSize = 18
	label.Font = Enum.Font.SourceSans
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Parent = contentFrame
   label.BorderSizePixel = 0
end

local function createButton(text, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.95, 0, 0.03, 0)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.Text = text
	button.TextSize = 18
	button.Font = Enum.Font.SourceSansBold
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Parent = contentFrame
   button.BorderSizePixel = 0
	button.MouseButton1Click:Connect(function()
		pcall(callback)
	end)
end

local function createToggle(text, callback)
	local toggle = Instance.new("TextButton")
	toggle.Size = UDim2.new(0.95, 0, 0.03, 0)
	toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	toggle.Text = "[ OFF ] " .. text
	toggle.TextSize = 18
	toggle.Font = Enum.Font.SourceSansBold
	toggle.TextColor3 = Color3.new(1, 1, 1)
	toggle.Parent = contentFrame
   toggle.BorderSizePixel = 0
	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = (state and "[ ON ] " or "[ OFF ] ") .. text
		pcall(callback, state)
	end)
end

local function createTextbox(placeholder, callback)
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.95, 0, 0.03, 0)
	box.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	box.PlaceholderText = placeholder
	box.TextSize = 18
	box.Font = Enum.Font.SourceSans
	box.TextColor3 = Color3.new(1, 1, 1)
	box.Parent = contentFrame
   box.BorderSizePixel = 0
	box.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			pcall(callback, box.Text)
		end
	end)
end



-- Tabs
local function createTab(name, onSelect)
	local tabButton = Instance.new("TextButton")
	tabButton.Size = UDim2.new(1, 0, 0.03, 0)
	tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   tabButton.BorderSizePixel = 0
	tabButton.Text = name
	tabButton.TextSize = 18
	tabButton.Font = Enum.Font.SourceSansBold
	tabButton.TextColor3 = Color3.new(1, 1, 1)
	tabButton.Parent = tabsFrame

	tabButton.MouseButton1Click:Connect(function()
		clearContent()
		pcall(onSelect)
	end)
   local uic = Instance.new("UICorner")
   uic.CornerRadius = UDim.new(0, 10)
   uic.Parent = tabButton 



end

-- Main Tab with Dropdown Example
createTab("Main", function()
	createLabel("Welcome to the Skid hub")
	createLabel("Executor: " .. getExecutorName())
	createLabel("This is my first time making a script")
end)

createTab("Games [1]", function()
    createLabel("Grow a garden")
	createButton("Speed Hub X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()	
	end)
	createButton("FFJ hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()	
	end)
	
	createLabel("Steal a brainrot")
    createButton("Chilli hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()	
	end)
	createButton("Render hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Showcaser1/res/refs/heads/main/test"))()	
	end)
	createButton("Indexium hub", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Empporean/IndexiumBeta/refs/heads/main/Loader.luau'))()	
	end)
	
	createLabel("Bedwars")
	createButton("Voidware", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua", true))()
	end)
	createButton("Vape V4", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()	
	end)






	createLabel("99 nights in the forest")
	createButton("Than hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))(ScriptRobloxKniaz)	
	end)
	createButton("Voidware", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))("t.me/gojoscripts_rb")	
	end)
	createButton("Limit hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/FakeModz/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua')))()
	end)
	createButton("H4x", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()	
	end)
	createButton("llinakytb", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Best99NightsInTheForest"))()	
	end)
	createButton("Speed hub X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()	
	end)
	createButton("Divine hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/OverflowBGSI/Overflow/refs/heads/main/loader.txt"))()  	
	end)
	createButton("Jnhh gaming 100% skid", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/99-days-in-forest-script/refs/heads/main/JN%20HH%20Gaming",true))()	
	end)
	
	createLabel("Goto Games[2]")
end)	
	createTab("Games [2]", function()
	
	createLabel("Blox Fruit")
	createButton("QuantumOynx", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))("t.me/onilegoScript")
	end)
	createButton("Min gaming", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXt2Eng"))()	
	end)

	createLabel("Gun ground FFA")
	createButton("Latvix hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Jonthedruger/LatvixDoc/script/idkgamenameforgot.lua",true))()	
	end)

	createButton("No name", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/rf8zaVmE",true))()
	end)
	
	createLabel("Dead Rails")
	createButton("Speed Hub X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()	
	end)

	createLabel("Ink game")
	createButton("Ringta", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()	
	end)
	createButton("Owl hook", function()
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0785b4b8f41683be513badd57f6a71c0.lua"))("t.me/gojoscripts_rb")	
	end)
end)

createTab("Executors", function()

	createButton("synapse X", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Synapse-x-remake-9371"))()	
	end)
	createButton("kiwi X", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/aNpTwPMU"))()
	end)
	createButton("Vega X", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Vega-X-Executor-10322"))()
	end)
	createButton("Trigon", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Trigon-Executor-10320"))()
	end)
	createButton("Delta", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/refs/heads/main/deltacrack.lua"))()
	end)
	createButton("Codex", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Codex-Executor-10321"))()
	end)
	createButton("Alysse", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/AlysseUI.lua"))()	
	end)
	createButton("Cubix", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/bot21333/sss/main/message_2.txt', true))();	
	end)
end)

createTab("Universal", function()
	createButton("Infinite yeild", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()	
	end)
	createButton("Nameless Admin", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()	
	end)
	createButton("Dark Dex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/memeenjoyer43/darkdex/refs/heads/main/script"))() 	
	end)
	createButton("rspy", function()
	loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Remote-spy-GUI-Included-14349'))()	
	end)
	createButton("Gui maker", function()
	loadstring(game:HttpGet(('https://pastefy.app/EOgPqinS/raw'),true))()	
	end)
	createButton("Hydroxide", function()
    local owner = "Upbolt"
    local branch = "revision"

    local function webImport(file)
        return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
    end

    webImport("init")
    webImport("ui/main")	
	end)
	createButton("Aimbot", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-Universal-For-Mobile-and-PC-29153"))()
	end)
	createButton("Fly V3", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end)
	createButton("Fe emotes R15", function()
	loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afem", false))()
	end)
	createButton("Goon R6", function()
	loadstring(game:HttpGet("https://pastefy.app/lawnvcTT/raw", true))()
	end)
	createButton("Tp walk gui", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gxdev-rblx/Gx-lololoooollll/refs/heads/main/main.lua.txt",true))()
	end)
	createButton("infinite jump", function()
	local InfiniteJumpEnabled = True
    game:GetService("UserInputService").JumpRequest:connect(function()
	    if InfiniteJumpEnabled then
		    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	    end
    end)
	end)
	createButton("UNC test", function()
    loadstring(game:HttpGet("https://github.com/ltseverydayyou/uuuuuuu/blob/main/UNC%20test?raw=true"))()
	end)
	createButton("CMD X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	end)

end)

-- Info Tab
createTab("Info", function()
	createLabel("Information Tab")
	createLabel("Version: 1.0 test")
	createLabel("Made by whity")
	createLabel("Ui library by gxdev")
	createLabel("more ui features added by evtg_lol")
	createLabel("Test buttons")
    createToggle("Test toggle", function(state)
		print("Toggle state:", state)
	end)	
createButton("Test", function()
		print("Button clicked!")
	end)
	createTextbox("Test", function(text)
		print("Textbox input:", text)
	end)


end)

