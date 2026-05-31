---@diagnostic disable: undefined-global
print("SCRIPT START");
if not game:IsLoaded() then
	game.Loaded:Wait();
end;
local ScriptLoaded = false;
local RealDefaultConfig = {
	
};
local my_hub = "Normal Hub";
local map = tostring(game.GameId);
local my_name = tostring(game.Players.LocalPlayer.Name);
local function LoadSettings()
	local HttpService = game:GetService("HttpService");
	if isfile(my_hub .. "/" .. map .. "/" .. my_name) then
		return HttpService:JSONDecode(readfile(my_hub .. "/" .. map .. "/" .. my_name));
	end;
end;
local Config = (getgenv()).Configs or LoadSettings() or RealDefaultConfig;
local function saveSettings()
	local HttpService = game:GetService("HttpService");
	local code = HttpService:JSONEncode(Config or {});
	if not isfolder(my_hub) then
		makefolder(my_hub);
	end;
	if not isfolder((my_hub .. "/" .. map)) then
		makefolder(my_hub .. "/" .. map);
	end;
	if isfolder(my_hub .. "/" .. map) then
		writefile(my_hub .. "/" .. map .. "/" .. my_name, code);
	end;
end;
do
	if not LPH_OBFUSCATED then
		function LPH_JIT(f)
			return f;
		end;
		function LPH_JIT_MAX(f)
			return f;
		end;
		function LPH_NO_VIRTUALIZE(f)
			return f;
		end;
	end;
end;
local Go = {};
local fps_check = getfps or getfpscap or get_fps_cap or function(...)
end;
local setfpsx = setfps or setfpscap or set_fps_cap or function(...)
end;
local GameId = game.GameId;
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local Debris = game:GetService("Debris");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Character_BasePart = {};
local PlayerGui = LocalPlayer.PlayerGui;
local RootPart = Character:FindFirstChild("HumanoidRootPart") or {};
local Humanoid = Character:FindFirstChild("Humanoid");
local MouseCheckReq = LocalPlayer:GetMouse();
local GuiService = game:GetService("GuiService");
do
	VirtualUser = game:GetService("VirtualUser");
	VirtualInputManager = game:GetService("VirtualInputManager");
	CollectionService = game:GetService("CollectionService");
	UserInputService = game:GetService("UserInputService");
	RunService = game:GetService("RunService");
	RepStorage = game:GetService("ReplicatedStorage");
	HttpService = game:GetService("HttpService");
	temppcall = xpcall;
	ServerFunc = {};
end;
do
	LocalPlayer.Idled:connect(function()
		VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
		task.wait(0.1);
		VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	end);
	function OnChar(Character)
		RootPart = Character:WaitForChild("HumanoidRootPart");
		Humanoid = Character:WaitForChild("Humanoid");
		Character = Character;
	end;
	if Character ~= LocalPlayer then
		OnChar(Character);
	end;
	LocalPlayer.CharacterAdded:Connect(function(Chr)
		Character = Chr;
		OnChar(Chr);
	end);
	(game:GetService("CoreGui")).RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
		if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
			if (game:GetService("GuiService")):GetErrorCode() ~= Enum.ConnectionError.TeleportGameFull then
				(game:GetService("TeleportService")):Teleport(game.PlaceId);
			end;
		end;
	end);
end;
function ServerFunc:Hop()
	pcall(function()
		task.delay(20, function()
			game:Shutdown();
		end);
		local ticklon = tick();
		repeat
			task.wait();
		until tick() - ticklon >= 1;
		local function Hop()
			for r = 1, math.huge do
				PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore";
				local bP = RepStorage.__ServerBrowser:InvokeServer(r);
				for k, v in pairs(bP) do
					if k ~= game.JobId and v.Count < 10 then
						(game:GetService("ReplicatedStorage")).__ServerBrowser:InvokeServer("teleport", k);
					end;
				end;
			end;
			return false;
		end;
		if not LoadedHop then
			local function bQ(v)
				if v.Name == "ErrorPrompt" then
					if v.Visible then
						if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
							self:Hop();
							v.Visible = false;
						end;
					end;
					(v:GetPropertyChangedSignal("Visible")):Connect(function()
						if v.Visible then
							if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
								self:Hop();
								v.Visible = false;
							end;
						end;
					end);
				end;
			end;
			for k, v in pairs((game:GetService("CoreGui")).RobloxPromptGui.promptOverlay:GetChildren()) do
				bQ(v);
			end;
			(game:GetService("CoreGui")).RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ);
			LoadedHop = true;
		end;
		while task.wait(0.1) do
			Hop();
		end;
	end);
end;
function ServerFunc:Rejoin()
	task.delay(20, function()
		game:Shutdown();
	end);
	(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer);
end;
local TheMode = "F";
local TheMainLib;
local MainLibFirst;
local SaveManager;
local InterfaceManager;
if TheMode == "F" then
	TheMainLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SilverHub999/Backup/refs/heads/main/UI.lua"))()
	SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
	InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
	MainLibFirst = TheMainLib:CreateWindow({
		Title = "Survive Zombie Arena",
		SubTitle = "By Go",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = false,
		Theme = "Normal Hub",
		MinimizeKey = Enum.KeyCode.LeftControl
	});
	task.spawn(function()
		(loadstring(game:HttpGet("https://raw.githubusercontent.com/SilverHub999/UI/refs/heads/main/Sub.lua")))(TheMainLib.GUI);
	end);
end;
if not TheMainLib then
	error("Where My Main Lib");
end;
local function Notify(data)
	if TheMode == "F" then
		return TheMainLib:Notify(data);
	end;
end;
local function CreateTab(Where, data)
	if TheMode == "F" then
		return Where:AddTab(data);
	end;
	return nil;
end;
local function AddParagraph(data)
	if TheMode == "F" then
		return data.Section:AddParagraph(data);
	end;
	return nil;
end;
local function AddButton(data)
	local Thaimode = ThaiTable[data.Title];
	if IsThai and Thaimode then
		data.Title = Thaimode or data.Title;
	end;
	if TheMode == "F" then
		return data.Section:AddButton(data);
	end;
	return nil;
end;
local function AddToggle(data)
	local Thaimode = ThaiTable[data.Title];
	if IsThai and Thaimode then
		data.Title = Thaimode or data.Title;
	end;
	local old_callback = data.Callback;
	data.Callback = function(bool)
		Config[data.Title] = bool;
		local wasd = {
			old_callback(bool)
		};
		task.spawn(function()
			repeat
				task.wait();
			until ScriptLoaded;
			local TheFunction = Go[data.Title];
			if TheFunction then
				task.spawn(function()
					while Config[data.Title] and task.wait() do
						TheFunction();
					end;
				end);
			end;
		end);
		return unpack(wasd);
	end;
	if TheMode == "F" then
		return data.Section:AddToggle("My" .. data.Title .. "Toggle", data);
	end;
	return nil;
end;
local function AddSlider(data)
	Config[data.Title] = data.Default;
	local old_callback = data.Callback;
	data.Callback = function(num)
		Config[data.Title] = num;
		return old_callback(num);
	end;
	if TheMode == "F" then
		return data.Section:AddSlider("My" .. data.Title .. "Slider", data);
	end;
	return nil;
end;
local function AddDropdown(data)
	local Thaimode = ThaiTable[data.Title];
	if IsThai and Thaimode then
		data.Title = Thaimode or data.Title;
	end;
	if Config[data.Title] == nil then
		if not data.Multi then
			Config[data.Title] = data.Default ~= nil and data.Values[data.Default] or nil;
		else
			Config[data.Title] = data.Default or {};
		end;
	end;
	local defaultIndex = nil;
	if not data.Multi and Config[data.Title] then
		for i, v in ipairs(data.Values) do
			if v == Config[data.Title] then
				defaultIndex = i;
				break;
			end;
		end;
	else
		defaultIndex = data.Default;
	end;
	local old_callback = data.Callback;
	data.Callback = function(tos)
		Config[data.Title] = tos;
		saveSettings();
		return old_callback(tos);
	end;
	if TheMode == "F" then
		local dropdown = data.Section:AddDropdown("My" .. data.Title .. "Dropdown", {
			Title = data.Title,
			Description = data.Description,
			Values = data.Values,
			Default = defaultIndex,
			Multi = data.Multi,
			Callback = data.Callback
		});
		if not data.Multi and Config[data.Title] and (not defaultIndex) then
			dropdown:SetValue(Config[data.Title]);
		end;
		return dropdown;
	end;
	return nil;
end;
local function SetValue(Where, boo, tpye_kub, ...)
	if TheMode == "F" then
		local selfkub = Where[tpye_kub];
		return selfkub(selfkub, boo, ...);
	end;
	return nil;
end;
local function DropClear(Where)
	if TheMode == "F" then
		return Where:SetValues({});
	end;
	return nil;
end;
local function SetItems(Where, tb)
	if TheMode == "F" then
		return Where:SetValues(tb);
	end;
	return nil;
end;
local function AddColorpicker(data)
	local old_callback = data.Callback;
	data.Callback = function(idk)
		Config[data.Title] = idk;
		return old_callback(idk);
	end;
	if TheMode == "F" then
		return data.Section:AddColorpicker("My" .. data.Title .. "Colorpicker", data);
	end;
	return nil;
end;
local function SetColorCp(obj, data)
	if TheMode == "F" then
		return obj:SetValueRGB(data);
	end;
	return nil;
end;
local function AddKeybind(data)
	if TheMode == "F" then
		return data.Section:AddKeybind("My" .. data.Title .. "Keybind", data);
	end;
	return nil;
end;
local function AddInput(data)
	local Thaimode = ThaiTable[data.Title];
	if IsThai and Thaimode then
		data.Title = Thaimode or data.Title;
	end;
	local old_callback = data.Callback;
	data.Callback = function(str)
		Config[data.Title] = str;
		return old_callback(str);
	end;
	if TheMode == "F" then
		return data.Section:AddInput("My" .. data.Title .. "Input", data);
	end;
	return nil;
end;
local function AddSection(Where, icon, data)
	if TheMode == "F" then
		return Where:AddSection(icon,data);
	end;
	return nil;
end;
local justnum = function(text)
	local number = text:gsub("%D", "");
	if number ~= "" and number ~= nil then
		return tonumber(number);
	end;
	return nil;
end;

local Tabs = {
	General = CreateTab(MainLibFirst, {
		Title = "General",
		Icon = "cloud-rain-wind"
	}),
	Inventory = CreateTab(MainLibFirst, {
		Title = "Inventory",
		Icon = "backpack"
	}),
	Event = CreateTab(MainLibFirst, {
		Title = "Event",
		Icon = "fan"
	}),
	Trade = CreateTab(MainLibFirst, {
		Title = "Trade",
		Icon = "navigation"
	}),
	Misc = CreateTab(MainLibFirst, {
		Title = "Misc",
		Icon = "box"
	}),
	Settings = CreateTab(MainLibFirst, {
		Title = "Setting",
		Icon = "settings"
	})
};
local Sections = AddSection(Tabs.General, "⚙", "Plant Setting");
do
	
end;

if TheMode == "F" then
	SaveManager:SetLibrary(TheMainLib)
	InterfaceManager:SetLibrary(TheMainLib)
	InterfaceManager:BuildInterfaceSection(Tabs.Settings)
	SaveManager:BuildConfigSection(Tabs.Settings)
end
ScriptLoaded = true
