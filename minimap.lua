
local function setTrackText()
	local t = NONE
	for i = 1, GetNumTrackingTypes() do
		local name, _, isActive = GetTrackingInfo(i)
		if isActive then
			t = name
			break
		end
	end
	MinimapTrackingText:SetText(t)
end

MiniMapInstanceDifficulty:UnregisterAllEvents()
MiniMapInstanceDifficulty:Hide()

GameTimeFrame:Hide()

MinimapZoomIn:Hide()
MinimapZoomOut:Hide()

MinimapBorder:Hide()
MinimapBorderTop:Hide()

MinimapZoneText:Hide()
MinimapZoneTextButton:Hide()

MiniMapWorldMapButton:Hide()

MiniMapTracking:Hide()
BattlegroundShine:Hide()
DurabilityFrame:Hide()

MinimapCluster:SetScale(1.1)
MinimapCluster:EnableMouse(false)

Minimap:EnableMouseWheel(true)
Minimap:ClearAllPoints()
Minimap:SetPoint("TOPRIGHT", UIParent, -26, -26)
Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground")

CreateBorder(Minimap, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

MiniMapMailText = MiniMapMailFrame:CreateFontString("MiniMapMailText", "OVERLAY")
MiniMapMailText:SetParent(MiniMapMailFrame)
MiniMapMailText:SetFont("Fonts\\ARIALN.ttf", 16, "OUTLINE")
MiniMapMailText:SetPoint("BOTTOMRIGHT", MiniMapMailFrame)
MiniMapMailText:SetTextColor(1, 0, 1)
MiniMapMailText:SetText("new")

MiniMapMailFrame:SetWidth((MiniMapMailText:GetStringWidth()))
MiniMapMailFrame:SetHeight(18)
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, -4, 5)

MiniMapMailIcon:SetTexture(nil)

MiniMapBattlefieldFrame:ClearAllPoints()
MiniMapBattlefieldFrame:SetPoint("TOPLEFT", Minimap, -2, 1)

MinimapTrackingText = Minimap:CreateFontString("$parentTrackingText", "OVERLAY")
MinimapTrackingText:SetFont("Fonts\\ARIALN.ttf", 15)
MinimapTrackingText:SetShadowOffset(1, -1)
MinimapTrackingText:SetPoint("CENTER", Minimap, 0, 35)
MinimapTrackingText:SetWidth((Minimap:GetWidth() - 25))

Minimap:SetScript("OnEnter", function()
	setTrackText()
	UIFrameFadeIn(MinimapTrackingText, 0.15, MinimapTrackingText:GetAlpha(), 1)
end)

Minimap:SetScript("OnLeave", function()
	setTrackText()
	UIFrameFadeOut(MinimapTrackingText, 0.15, MinimapTrackingText:GetAlpha(), 0)
end)

Minimap:SetScript("OnMouseUp", function(self, button)
	if button == "RightButton" then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, - (Minimap:GetWidth() * 0.7), -3)
	else
		Minimap_OnClick(self)
	end
end)

Minimap:SetScript("OnMouseWheel", function(self, direction)
	if direction > 0 then
		Minimap_ZoomIn()
	else
		Minimap_ZoomOut()
	end
end)

