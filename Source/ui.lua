local addonName, addon = ...
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-- adapted from Blizzard_Collections\Blizzard_HeirloomCollection

local class = select(2, UnitClass("player"))

addon.ParentMixin = {}
local ParentMixin = addon.ParentMixin

local function hideHeirloomsExtras()
    HeirloomsJournalClassDropDown:Hide()
    HeirloomsJournal.progressBar:Hide()
    HeirloomsJournal.SearchBox:Hide()
    HeirloomsJournal.FilterButton:Hide()
end

local function showHeirloomsExtras()
    HeirloomsJournalClassDropDown:Show()
    HeirloomsJournal.progressBar:Show()
    HeirloomsJournal.SearchBox:Show()
    HeirloomsJournal.FilterButton:Show()
end

local tab
local selectedTab = 1
function ParentMixin:OnLoad()
	self:FullRefreshIfVisible();
    if self ~= ManuscriptsJournal then return end
    
    local function runOutOfCombat()
        ManuscriptsJournalInsecureTabButton = LibStub('SecureTabs-2.0'):Add(CollectionsJournal, self, self.tabName)
        tab = ManuscriptsJournalInsecureTabButton
        local secureTabButton = CreateFrame("Button", nil, CollectionsJournal, "SecureActionButtonTemplate")
        secureTabButton:SetAttribute("type", "click")
        secureTabButton:SetAttribute("clickbutton", CollectionsJournalTab4)
        secureTabButton:SetPoint("TOPLEFT", tab, "TOPLEFT")
        secureTabButton:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT")
        secureTabButton:RegisterForClicks("AnyDown")
        
        secureTabButton:HookScript("OnClick", function()
            tab:Click()
            if selectedTab ~= ManuscriptsSkillLineManuscriptsTab:GetID() then
                ManuscriptsJournal:Hide()
            end
        end)
        tab:SetPassThroughButtons("LeftButton")
        tab.Enable = nop
        tab.Disable = nop
        
        tab.OnSelect = function()
            tab.LeftHighlight:Hide()
            tab.MiddleHighlight:Hide()
            tab.RightHighlight:Hide()
            tab:SetHighlightLocked(true)
            
            CollectionsJournalTitleText:SetText(self.tabName)
            hideHeirloomsExtras()
            
            ManuscriptsSideTabsFrame:Show()
            for _, tab in pairs(self:GetAllTabs()) do
                tab:SetChecked(selectedTab == tab:GetID())
            end
            
            if (selectedTab == 2) and (class == "DRUID") then
                ShapeshiftsJournal:Show()
                ShapeshiftsJournal:EnableMouse(true)
            elseif selectedTab == 3 then
                SoulshapesJournal:Show()
                SoulshapesJournal:EnableMouse(true)
            elseif (selectedTab == 4) and (class == "SHAMAN") then
                HexTomesJournal:Show()
                HexTomesJournal:EnableMouse(true)
            elseif (selectedTab == 5) and (class == "MAGE") then
                PolymorphsJournal:Show()
                PolymorphsJournal:EnableMouse(true)
            elseif (selectedTab == 6) and (class == "WARLOCK") then
                GrimoiresJournal:Show()
                GrimoiresJournal:EnableMouse(true)
            elseif (selectedTab == 7) and (class == "HUNTER") then
                TameTomesJournal:Show()
                TameTomesJournal:EnableMouse(true)
            elseif (selectedTab == 8) then
                PepeJournal:Show()
                PepeJournal:EnableMouse(true)
            end
        end
        tab.OnDeselect = function()
            tab.LeftHighlight:Show()
            tab.MiddleHighlight:Show()
            tab.RightHighlight:Show()
            tab:SetHighlightLocked(false)
            
            local selectedTabID = CollectionsJournal_GetTab(CollectionsJournal)
            CollectionsJournalTitleText:SetText(_G["CollectionsJournalTab"..selectedTabID]:GetText())
            showHeirloomsExtras()
            ManuscriptsSideTabsFrame:Hide()
            ShapeshiftsJournal:Hide()
            SoulshapesJournal:Hide()
            HexTomesJournal:Hide()
            PolymorphsJournal:Hide()
            GrimoiresJournal:Hide()
            TameTomesJournal:Hide()
            PepeJournal:Hide()
        end
        self.Tab = tab
    end
    
    if InCombatLockdown() then
        EventUtil.RegisterOnceFrameEventAndCallback("PLAYER_REGEN_ENABLED", runOutOfCombat)
        return
    end
    runOutOfCombat()
    
    RunNextFrame(function()
        ManuscriptsSkillLineManuscriptsTab.tooltip = self.tabName
        ManuscriptsSkillLineDruidTab.tooltip = ShapeshiftsJournal.tabName
        ManuscriptsSkillLineSoulshapesTab.tooltip = SoulshapesJournal.tabName
        ManuscriptsSkillLineShamanTab.tooltip = HexTomesJournal.tabName
        ManuscriptsSkillLineMageTab.tooltip = PolymorphsJournal.tabName
        ManuscriptsSkillLineWarlockTab.tooltip = GrimoiresJournal.tabName
        ManuscriptsSkillLineHunterTab.tooltip = TameTomesJournal.tabName
        ManuscriptsSkillLinePepeTab.tooltip = PepeJournal.tabName

        ManuscriptsSkillLineManuscriptsTab:SetNormalTexture(254288)
        ManuscriptsSkillLineDruidTab:SetNormalTexture(136036)
        ManuscriptsSkillLineSoulshapesTab:SetNormalTexture(GetSpellTexture(310143))
        ManuscriptsSkillLineShamanTab:SetNormalTexture(GetSpellTexture(51514))
        ManuscriptsSkillLineMageTab:SetNormalTexture(GetSpellTexture(118))
        ManuscriptsSkillLineWarlockTab:SetNormalTexture(GetSpellTexture(688))
        ManuscriptsSkillLineHunterTab:SetNormalTexture(GetSpellTexture(1515))
        ManuscriptsSkillLinePepeTab:SetNormalTexture(GetSpellTexture(181943))

        local anchor = ManuscriptsSkillLineManuscriptsTab
        if class == "DRUID" then
            anchor = ManuscriptsSkillLineDruidTab
            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineDruidTab:Show()
        elseif class == "SHAMAN" then
            anchor = ManuscriptsSkillLineShamanTab
            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineShamanTab:Show()
        elseif class == "MAGE" then
            anchor = ManuscriptsSkillLineMageTab
            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineMageTab:Show()
        elseif class == "WARLOCK" then
            anchor = ManuscriptsSkillLineWarlockTab
            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineWarlockTab:Show()
        elseif class == "HUNTER" then
            anchor = ManuscriptsSkillLineHunterTab
            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineHunterTab:Show()
        end
        
        if C_Covenants.GetActiveCovenantID() == 3 then
            ManuscriptsSkillLineSoulshapesTab:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -17)            

            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLineSoulshapesTab:Show()
        end

        if PlayerHasToy(122293) or PlayerHasToy(209859) then
            if C_Covenants.GetActiveCovenantID() == 3 then
                ManuscriptsSkillLinePepeTab:SetPoint("TOPLEFT", ManuscriptsSkillLineSoulshapesTab, "BOTTOMLEFT", 0, -17)
            else
                ManuscriptsSkillLinePepeTab:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -17)            
            end

            ManuscriptsSkillLineManuscriptsTab:Show()
            ManuscriptsSkillLinePepeTab:Show()
        end

    end)
end

hooksecurefunc("CollectionsJournal_SetTab", function(self, tabID)
    if (tabID ~= CollectionsJournalTab4:GetID()) and not tContains(ParentMixin:GetAllPanels(), self.Tabs[tabID or 1].frame) then
        ManuscriptsSideTabsFrame:Hide()
        for _, journal in pairs(ParentMixin:GetAllPanels()) do
            journal:Hide()
        end
        showHeirloomsExtras()
        
        tab.LeftHighlight:Show()
        tab.MiddleHighlight:Show()
        tab.RightHighlight:Show()
        tab:SetHighlightLocked(false)
    end
end)

function ParentMixin:AcquireFrame(framePool, numInUse, frameType, template)
	if not framePool[numInUse] then
		framePool[numInUse] = CreateFrame(frameType, nil, self.iconsFrame, template);
	end
	return framePool[numInUse];
end

function ParentMixin:RefreshView()
	self.needsRefresh = false;

	self:RebuildLayoutData();

	self:LayoutCurrentPage();

	if self.UpdateProgressBar then
        self:UpdateProgressBar()
    end
end

function ParentMixin:IsCollected(data)
    return C_QuestLog.IsQuestFlaggedCompleted(data.questID)
end

function ParentMixin:UpdateButton(button)
    local data, name, texture
    
    local function runLater()
        button.iconTexture:SetTexture(texture);
    	button.iconTextureUncollected:SetTexture(texture);
    	button.iconTextureUncollected:SetDesaturated(true);

    	button.name:SetText(name);

    	button.name:ClearAllPoints();
    	button.name:SetPoint("LEFT", button, "RIGHT", 9, 3);

        local collected = self:IsCollected(data)
        
        if collected then
    		if self == ManuscriptsJournal then
                if not ManuscriptsJournal:GetCollectedManuscriptFilter() then
                    self:FullRefreshIfVisible()
                end
            end
            button.iconTexture:Show();
    		button.iconTextureUncollected:Hide();
    		button.name:SetTextColor(1, 0.82, 0, 1);
    		button.name:SetShadowColor(0, 0, 0, 1);

    		button.slotFrameCollected:Show();
    		button.slotFrameUncollected:Hide();
    		button.slotFrameUncollectedInnerGlow:Hide();
    	else
    		button.iconTexture:Hide();
    		button.iconTextureUncollected:Show();
    		button.name:SetTextColor(0.33, 0.27, 0.20, 1);
    		button.name:SetShadowColor(0, 0, 0, 0.33);

    		button.slotFrameCollected:Hide();
    		button.slotFrameUncollected:Show();
    		button.slotFrameUncollectedInnerGlow:Show();
    	end
    end

    if button.itemID then
    	data = addon.itemIDToDB[button.itemID]
        local item = Item:CreateFromItemID(button.itemID)

        item:ContinueOnItemLoad(function()
        	name = item:GetItemName() 
        	texture = item:GetItemIcon()
            runLater()
        end)
    elseif button.spellID then
        data = addon.spellIDToDB[button.spellID]
        name, _, texture = GetSpellInfo(button.spellID)
        runLater()
    end
end

function ParentMixin:OnPageChanged(userAction)
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	if userAction then
		self:RefreshViewIfVisible();
	end
end

function ParentMixin:OnManuscriptsUpdated()
end

EventUtil.ContinueOnAddOnLoaded(addonName, function()
    local loaded, finished = IsAddOnLoaded(addonName)
    if not finished then return end
    
    local ticker
    ticker = C_Timer.NewTicker(5, function()
        -- these are sometimes not available yet on login, so lets query them again
        addon.Strings.Sources[13] = C_QuestLog.GetTitleForQuestID(75887)
        addon.Strings.Sources[18] = C_QuestLog.GetTitleForQuestID(78203)
        
        if addon.Strings.Sources[13] and addon.Strings.Sources[18] then
            ticker:Cancel()
        end
    end)
end)

function addon.ActivatePooledFrames(framePool, numEntriesInUse)
	for i = 1, numEntriesInUse do
		framePool[i]:Show();
	end

	for i = numEntriesInUse + 1, #framePool do
		framePool[i]:Hide();
	end
end

local function deselectAndHideAll()
    for _, tab in pairs(ParentMixin:GetAllTabs()) do
        tab:SetChecked(false)
    end
    for _, panel in pairs(ParentMixin:GetAllPanels()) do
        panel:Hide()
    end
end    

function ManuscriptSkillLineTab_OnClick(self)
    deselectAndHideAll()
    selectedTab = self:GetID()
    self:SetChecked(true)
    
    local page = ParentMixin:GetPanelByTab(self)
    page:Show()
    page:SetFrameLevel(CollectionsJournal:GetFrameLevel() + 20)
    page:EnableMouse(true)
end

hooksecurefunc("ToggleCollectionsJournal", function(tab)
    if tab ~= nil then return end
    if not CollectionsJournal then return end
    if not CollectionsJournal:IsShown() then return end
    for _, panel in pairs(ParentMixin:GetAllPanels()) do
        if panel:IsShown() then
            CollectionsJournalTitleText:SetText(ManuscriptsJournal.tabName)
            return
        end
    end
end)

function ParentMixin:GetAllPanels()
    return {ManuscriptsJournal, ShapeshiftsJournal, SoulshapesJournal, HexTomesJournal, PolymorphsJournal, GrimoiresJournal, TameTomesJournal, PepeJournal}
end

function ParentMixin:GetAllTabs()
    return {ManuscriptsSkillLineManuscriptsTab, ManuscriptsSkillLineDruidTab, ManuscriptsSkillLineSoulshapesTab, ManuscriptsSkillLineShamanTab, ManuscriptsSkillLineMageTab, ManuscriptsSkillLineWarlockTab, ManuscriptsSkillLineHunterTab, ManuscriptsSkillLinePepeTab}
end

function ParentMixin:GetPanelByTab(tab)
    local panels = {
        [ManuscriptsSkillLineManuscriptsTab] = ManuscriptsJournal, 
        [ManuscriptsSkillLineDruidTab] = ShapeshiftsJournal, 
        [ManuscriptsSkillLineSoulshapesTab] = SoulshapesJournal, 
        [ManuscriptsSkillLineShamanTab] = HexTomesJournal, 
        [ManuscriptsSkillLineMageTab] = PolymorphsJournal, 
        [ManuscriptsSkillLineWarlockTab] = GrimoiresJournal,
        [ManuscriptsSkillLineHunterTab] = TameTomesJournal,
        [ManuscriptsSkillLinePepeTab] = PepeJournal,
    }
    return panels[tab]
end
