local addonName, addon = ...

-- Pepe Costume tab

PepeMixin = CreateFromMixins(ShapeshiftsMixin)

function PepeMixin:OnLoad()
    --if select(2, UnitClass("player")) ~= "WARLOCK" then return end
	--if PlayerHasToy(122293) ~= true then return end
	
	self.shapeshiftEntryFrames = {};

	self.shapeshiftLayoutData = {};
	self.itemIDsInCurrentLayout = {};

	if not self.numKnownShapeshifts then self.numKnownShapeshifts = 0 end
    if not self.numPossibleShapeshifts then self.numPossibleShapeshifts = 0 end
    
    self.tabName = "Pepe Costumes"
    
    addon.ParentMixin.OnLoad(self)
end

function PepeMixin:SortShapeshiftsIntoEquipmentBuckets()
	-- Sort them into equipment buckets
	local equipBuckets = {};
    
    for _, shapeshiftData in pairs(addon.PepeDB) do
    	local itemID = shapeshiftData.itemID
    		
    	if not equipBuckets[1] then
    		equipBuckets[1] = {}
    	end

    	table.insert(equipBuckets[1], itemID)

        if self:IsCollected(shapeshiftData) then
            self.numKnownShapeshifts = self.numKnownShapeshifts + 1
    	end
    	self.numPossibleShapeshifts = self.numPossibleShapeshifts + 1

    	self.itemIDsInCurrentLayout[itemID] = true;
	end

	return equipBuckets;
end

function PepeMixin:IsCollected(data)
	if data.isToy then
    	return PlayerHasToy(data.itemID)
	else
		return C_QuestLog.IsQuestFlaggedCompleted(data.questID)
	end
end
