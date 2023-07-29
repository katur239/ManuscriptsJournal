local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName) 

local sources = addon.Enum.Sources

local manuscripts = {
    {
        name = "Highland Drake: Coiled Horns",
        itemID = 197125,
        questID = 69326,
        source = sources.Rare,
        rareNames = {
            L["Diluu"],
            L["Corrupted Proto-Dragon"],
        },
    },
    {
        name = "Highland Drake: Spined Chin",
        itemID = 197105,
        questID = 69306,
        source = sources.Rare,
        rareNames = {
            L["Gethdazr"],
            L["Seeker Teryx"],
            L["Salkii"],
        },
    },
    {
        name = "Highland Drake: Ears",
        itemID = 197116,
        questID = 69317,
        source = sources.Rare,
        rareNames = {
            L["Shadeslash Trakken"],
            L["Tikarr Frostclaw"],
            L["Sparkspitter Vrak"],
        },
    },
    {
        name = "Highland Drake: Striped Pattern",
        itemID = 197138,
        questID = 69339,
        source = sources.Rare,
        rareNames = {
            L["Disoriented Watcher"],
            L["Forgotten Creation"],
            L["Ancient Protector"],
            L["Gethdazr"],
            L["Broodweaver Araznae"],
            L["Phenran"],
            L["Seeker Teryx"],
            L["Unstable Arcanogolem"],
            L["Srivantor"],
        },
    },
    {
        name = "Highland Drake: Stag Horns",
        itemID = 197130,
        questID = 69331,
        source = sources.Rare,
        rareNames = {
            L["Phleep"],
            L["Sandana the Tempest"],
            L["Innumerable Ruination"],
            L["Lord Epochbrgl"],
        },
    },
    {
        name = "Highland Drake: Club Tail",
        itemID = 197149,
        questID = 69350,
        source = sources.Rare,
        rareNames = {
            L["Oshigol"],
            L["Magmaton"],
            L["O'nank Shorescour"],
            L["Mahg the Trampler"],
            L["Spellforged Brute"],
            L["Skag the Thrower"],
            L["Tenmod"],	
            L["Honmor"],
        },
    },
    {
        name = "Highland Drake: Finned Head",
        itemID = 197106,
        questID = 69307,
        source = sources.Rare,
        rareNames = {
            L["Liskheszaera"],
            L["Trilvarus Loreweaver"],
            L["Motivator Krathos"],
            L["Grand Artificer Zeerak"],
            L["Srivantor"],
        },
    },
    {
        name = "Highland Drake: Tan Horns",
        itemID = 197121,
        questID = 69322,
        source = sources.Rare,
        rareNames = {
            L["Gnarls"],
            L["Azra's Prized Peony"],
            L["Morlash"],
        },
    },
    {
        name = "Highland Drake: Spiked Club Tail",
        itemID = 197150,
        questID = 69351,
        source = sources.Rare,
        rareNames = {
            L["Sharpfang"],
            L["Mange the Outcast"],
            L["Snarglebone"],
            L["Blightpaw the Depraved"],
            L["Scav Notail"],
            L["High Shaman Rotknuckle"],
            L["Blightfur"],
        },
    },
    {
        name = "Highland Drake: Crested Brow",
        itemID = 197100,
        questID = 69301,
        source = sources.Rare,
        rareNames = {
            L["Spellforged Destroyer"],	
            L["Disoriented Watcher"],
            L["Ancient Protector"],	
            L["Arkhuu"],	
            L["Phenran"],
            L["Overseer Stonetongue"],
            L["Overloading Defense Matrix"],
        },
    },
    {
        name = "Highland Drake: Hairy Cheek",
        itemID = 197131,
        questID = 69332,
        source = sources.Rare,
        rareName = L["Harkyn Grymstone"],
    },
    {
        name = "Highland Drake: Heavy Scales",
        itemID = 197147,
        questID = 69348,
        source = sources.Dungeon,
        bossName = L["Echo of Doragosa"],
        zoneID = 14032,
    },
    {
        name = "Highland Drake: Thorned Jaw",
        itemID = 197115,
        questID = 69316,
        source = sources.Rare,
        rareName = L["Shade of Grief"],
    },
    {
        name = "Highland Drake: Gold and Black Armor",
        itemID = 197090,
        questID = 69290,
        source = sources.Reputation,
        reputations = {
            2517,
            2518,
        },
        friendshipRank = L["Friend"],
    },
    {
        name = "Highland Drake: Black Scales",
        itemID = 197142,
        questID = 69343,
        source = sources.Reputation,
        reputations = {
            2517,
            2518,
        },
        friendshipRank = L["True Friend"],
    },
    {
        name = "Highland Drake: Silver and Purple Armor",
        itemID = 197093,
        questID = 69294,
        source = sources.Renown,
        renownFaction = 2510,
        renownRank = 26,
    },
    {
        name = "Highland Drake: Red Scales",
        itemID = 197144,
        questID = 69345,
        source = sources.Renown,
        renownFaction = 2507,
        renownRank = 22,
    },
    {
        name = "Highland Drake: Finned Neck",
        itemID = 197155,
        questID = 69356,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 7,
    },
    {
        name = "Highland Drake: Bronze Scales",
        itemID = 197145,
        questID = 69346,
        source = sources.Renown,
        renownFaction = 2510,
        renownRank = 21,
    },
    {
        name = "Highland Drake: Green Scales",
        itemID = 197143,
        questID = 69344,
        source = sources.Renown,
        renownFaction = 2503,
        renownRank = 19,
    },
    {
        name = "Highland Drake: Thorn Horns",
        itemID = 197123,
        questID = 69324,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 13,
        bugged = true,
    },
    {
        name = "Highland Drake: Large Spotted Pattern",
        itemID = 197139,
        questID = 69340,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 13,
    },
    {
        name = "Highland Drake: Bladed Tail",
        itemID = 197153,
        questID = 69354,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 13,
    },
    {
        name = "Highland Drake: Bushy Brow",
        itemID = 197101,
        questID = 69302,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 7,
    },
    {
        name = "Highland Drake: Spiked Cheek",
        itemID = 197132,
        questID = 69333,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 7,
    },
    {
        name = "Highland Drake: Multi-Horned Head",
        itemID = 197114,
        questID = 69315,
        source = sources.Renown,
        renownFaction = 2511,
        renownRank = 7,
    },
    {
        name = "Highland Drake: Gold and Red Armor",
        itemID = 197094,
        questID = 69295,
        source = sources.DragonRacingAchievement,
        achievementID = 15934,
    },
    {
        name = "Highland Drake: Silver and Blue Armor",
        itemID = 197091,
        questID = 69291,
        source = sources.Inscription,
        spellID = 391834,
        recipeID = 201735,
    },
    {
        name = "Highland Drake: Steel and Yellow Armor",
        itemID = 197096,
        questID = 69297,
        source = sources.Inscription,
        spellID = 391845,
        recipeID = 201737,
    },
    {
        name = "Highland Drake: Spined Head",
        itemID = 197108,
        questID = 69309,
        source = sources.Inscription,
        spellID = 383578,
        recipeID = 198895,
    },
    {
        name = "Highland Drake: Black Hair",
        itemID = 197117,
        questID = 69318,
        source = sources.Inscription,
        spellID = 383577,
        recipeID = 198894,
    },
    {
        name = "Highland Drake: Spined Neck",
        itemID = 197154,
        questID = 69355,
        source = sources.Inscription,
        spellID = 383579,
        recipeID = 198896,
    },
    {
        name = "Highland Drake: Grand Thorn Horns",
        itemID = 197127,
        questID = 69328,
        source = sources.Dungeon,
        bossName = L["Umbrelskul"],
        zoneID = 13954,
    },
    {
        name = "Highland Drake: Small Spotted Pattern",
        itemID = 197140,
        questID = 69341,
        source = sources.Dungeon,
        bossName = L["Umbrelskul"],
        zoneID = 13954,
    },
    {
        name = "Highland Drake: Single Horned Head",
        itemID = 197112,
        questID = 69313,
        source = sources.Dungeon,
        bossName = L["Echo of Doragosa"],
        zoneID = 14032,
    },
    {
        name = "Highland Drake: Scaled Pattern",
        itemID = 197141,
        questID = 69342,
        source = sources.Quest,
        sourceQuestID = 71139,
    },
    {
        name = "Highland Drake: Heavy Horns",
        itemID = 197122,
        questID = 69323,
        source = sources.Quest,
        sourceQuestID = 66465,
    },
    {
        name = "Highland Drake: Spined Nose",
        itemID = 197137,
        questID = 69338,
        source = sources.Quest,
        sourceQuestID = 71139,
    },
    {
        name = "Highland Drake: Maned Chin",
        itemID = 197103,
        questID = 69304,
        source = sources.Quest,
        sourceQuestID = 66473,
    },
    {
        name = "Highland Drake: Spined Back",
        itemID = 197097,
        questID = 69298,
        source = sources.Quest,
        sourceQuestID = 66468,
    },
    {
        name = "Highland Drake: Spined Cheek",
        itemID = 197133,
        questID = 69334,
        source = sources.Quest,
        sourceQuestID = 66299,
    },
    {
        name = "Highland Drake: Hooked Horns",
        itemID = 197126,
        questID = 69327,
        source = sources.Quest,
        sourceQuestID = 66249,
    },
    {
        name = "Highland Drake: Plated Head",
        itemID = 197110,
        questID = 69311,
        source = sources.Quest,
        sourceQuestID = 66169,
    },
    {
        name = "Highland Drake: Spiked Tail",
        itemID = 197151,
        questID = 69352,
        source = sources.Quest,
        sourceQuestID = 65948,
    },
    {
        name = "Highland Drake: Toothy Mouth",
        itemID = 197135,
        questID = 69336,
        source = sources.Rare,
        rareName = L["Various"],
    },
    {
        name = "Highland Drake: Tapered Nose",
        itemID = 197136,
        questID = 69337,
        source = sources.Vendor,
        vendorName = L["Kraxxus"],
        zoneID = 14433,
    },
    {
        name = "Highland Drake: Vertical Finned Tail",
        itemID = 197148,
        questID = 69349,
        source = sources.Reputation,
        reputation = 2550,
        friendshipRank = L["High"],
    },
    {
        name = "Highland Drake: Sleek Horns",
        itemID = 197129,
        questID = 69330,
        source = sources.Reputation,
        reputation = 2526,
        reputationRank = 6,
    },
    {
        name = "Highland Drake: Horned Chin",
        itemID = 197102,
        questID = 69303,
        source = sources.Reputation,
        reputation = 2526,
        reputationRank = 7,
    },
    {
        name = "Highland Drake: Triple Finned Head",
        itemID = 197107,
        questID = 69308,
        source = sources.Reputation,
        reputation = 2550,
        friendshipRank = L["Medium"],
    },
    {
        name = "Highland Drake: Finned Back",
        itemID = 197098,
        questID = 69299,
        source = sources.Rare,
        rareName = L["Various"],
    },
    {
        name = "Highland Drake: Maned Head",
        itemID = 197111,
        questID = 69312,
        source = sources.Rare,
        rareName = L["Various"],
    },
    {
        name = "Highland Drake: Swept Horns",
        itemID = 197124,
        questID = 69325,
        source = sources.DragonRacingContainer,
        containerID = 204359,
    },
    {
        name = "Highland Drake: Curled Back Horns",
        itemID = 197128,
        questID = 69329,
        source = sources.DragonRacingContainer,
        containerID = 199192,
    },
    {
        name = "Highland Drake: Swept Spiked Head",
        itemID = 197113,
        questID = 69314,
        source = sources.DragonRacingContainer,
        containerID = 199192,
    },
    {
        name = "Highland Drake: Hooked Tail",
        itemID = 197152,
        questID = 69353,
        source = sources.DragonRacingContainer,
        containerID = 199192,
    },
    {
        name = "Highland Drake: Brown Hair",
        itemID = 197118,
        questID = 69319,
        source = sources.DragonRacingAchievement,
        achievementID = 15923,
    },
    {
        name = "Highland Drake: Embodiment of the Crimson Gladiator",
        itemID = 201792,
        questID = 72371,
        source = sources.Achievement,
        achievementID = 15957, -- Season 1
    },
    {
        name = "Highland Drake: White Scales",
        itemID = 197146,
        questID = 69347,
    },
    {
        name = "Highland Drake: Gold and White Armor",
        itemID = 197095,
        questID = 69296,
    },
    --{
    --    name = "Highland Drake: Helm",
    --    itemID = 197119,
    --    questID = 69320,
    --},
    {
        name = "Highland Drake: Armor",
        itemID = 197099,
        questID = 69300,
        source = sources.Renown,
        renownFaction = 2510,
        renownRank = 26,
    },
}

for k, v in pairs(manuscripts) do
    v.category = addon.Enum.Drakes.HighlandDrake
    table.insert(addon.db, v)
end
