

--[[
                                              ,----,.                            
                                            ,'   ,' |         ,--.    ,----..    
    ,---,.                       ,---,.   ,'   .'   |       ,--.'|   /   /   \   
  ,'  .'  \                    ,'  .' | ,----.'    .'   ,--,:  : |  /   .     :  
,---.' .' |                  ,---.'   | |    |   .'  ,`--.'`|  ' : .   /   ;.  \ 
|   |  |: |                  |   |   .' :    :  |--, |   :  :  | |.   ;   /  ` ; 
:   :  :  /     .--,         :   :  |-, :    |  ;.' \:   |   \ | :;   |  ; \ ; | 
:   |    ;    /_ ./|         :   |  ;/| |    |      ||   : '  '; ||   :  | ; | ' 
|   :     \, ' , ' :         |   :   .' `----'.'\   ;'   ' ;.    ;.   |  ' ' ' : 
|   |   . /___/ \: |         |   |  |-,   __  \  .  ||   | | \   |'   ;  \; /  | 
'   :  '; |.  \  ' |         '   :  ;/| /   /\/  /  :'   : |  ; .' \   \  ',  /  
|   |  | ;  \  ;   :         |   |    \/ ,,/  ',-   .|   | '`--'    ;   :    /   
|   :   /    \  \  ;         |   :   .'\ ''\       ; '   : |         \   \ .'    
|   | ,'      :  \  \        |   | ,'   \   \    .'  ;   |.'          `---`      
`----'         \  ' ;        `----'      `--`-,-'    '---'                       
                `--`                                                             
          .--,-``-.                                                              
         /   /     '.                                                            
    ,--./ ../        ;                                                           
   /  /|\ ``\  .`-    '                                                          
  '  / ' \___\/   \   :                                                          
 /  / /       \   :   |                                                          
/  / ,        /  /   /                                                           
\ '\ \        \  \   \                                                           
 \  \ '   ___ /   :   |                                                          
  \  . | /   /\   /   :                                                          
   \__\./ ,,/  ',-    .                                                          
        \ ''\        ;                                                           
         \   \     .'                                                            
          `--`-,,-'                                                              
--]]                                                                                 
local ef = table.insert
local ch = table.concat
local j = loadstring(game:HttpGet("https://pastebin.com/raw/9skwM03n"))()
local aq = j:CreateWindow({
["Title"] = "Aybrix",
["Center"] = true,
["AutoShow"] = true,
["Footer"] = ":[",
["Size"] = UDim2.fromOffset(720, 520),
["ToggleKeybind"] = Enum.KeyCode.RightShift
})
local y = {}
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local k = Players.LocalPlayer
local m = k.Name
local al = k.PlayerScripts.Assets.ViewModels
local f = "AybrixConfig"
local e = f .. "/default.json"
local ai = {
["AutoLoadConfig"] = true,
["LastLoadedConfig"] = "default",
["ActiveSkins"] = {},
["CurrentMaterial"] = "SmoothPlastic",
["MaterialEnabled"] = false,
["Transparency"] = 0
}
local function da()
if not isfolder(f) then
makefolder(f)
end
end
local function go()
da()
local cr = {
ActiveSkins = ai.ActiveSkins,
CurrentMaterial = ai.CurrentMaterial,
MaterialEnabled = ai.MaterialEnabled,
Transparency = ai.Transparency,
}
local fd, cz = pcall(HttpService.JSONEncode, HttpService, cr)
if fd then
writefile(e, cz)
end
end
local function eo()
da()
if not isfile(e) then return end
local fd, fu = pcall(readfile, e)
if not fd or not fu or fu == "" then return end
local fe, cr = pcall(HttpService.JSONDecode, HttpService, fu)
if not fe or type(cr) ~= "table" then return end
if type(cr.ActiveSkins) == "table" then ai.ActiveSkins = cr.ActiveSkins end
if type(cr.CurrentMaterial) == "string" then ai.CurrentMaterial = cr.CurrentMaterial end
if type(cr.MaterialEnabled) == "boolean" then ai.MaterialEnabled = cr.MaterialEnabled end
if type(cr.Transparency) == "number" then ai.Transparency = cr.Transparency end
end
eo()
local ao = {
["Assault Rifle"] = {"AK-47", "AUG", "Tommy Gun", "Phoenix Rifle", "Boneclaw Rifle", "10B Visits", "AKEY-47", "Gingerbread AUG", "Glorious Assault Rifle"},
["Bow"] = {"Compound Bow", "Raven Bow", "Dream Bow", "Bat Bow", "Frostbite Bow", "Key Bow", "Balloon Bow", "Beloved Bow", "Glorious Bow"},
["Burst Rifle"] = {"Aqua Burst", "Electro Rifle", "FAMAS", "Pine Burst", "Spectral Burst", "Pixel Burst", "Keyst Rifle", "Glorious Burst Rifle"},
["Chainsaw"] = {"Blobsaw", "Handsaws", "Mega Drill", "Buzzsaw", "Festive Buzzsaw", "Glorious Chainsaw"},
["RPG"] = {"Nuke Launcher", "RPKEY", "Spaceship Launcher", "Pencil Launcher", "Squid Launcher", "Pumpkin Launcher", "Firework Launcher", "Rocket Launcher", "Glorious RPG"},
["Exogun"] = {"Singularity", "Wondergun", "Exogourd", "Ray Gun", "Repulsor", "Midnight Festive Exogun", "Glorious Exogun"},
["Fists"] = {"Boxing Gloves", "Brass Knuckles", "Fists of Hurt", "Festive Fists", "Pumpkin Claws", "Glorious Fists"},
["Flamethrower"] = {"Lamethrower", "Pixel Flamethrower", "Glitterthrower", "Jack O' Thrower", "Snowblower", "Keythrower", "Glorious Flamethrower"},
["Flare Gun"] = {"Dynamite Gun", "Firework Gun", "Banana Flare", "Wrapped Flare Gun", "Vexed Flare Gun", "Glorious Flare Gun"},
["Freeze Ray"] = {"Bubble Ray", "Temporal Ray", "Gum Ray", "Wrapped Freeze Ray", "Glorious Freeze Ray"},
["Grenade"] = {"Water Balloon", "Whoopee Cushion", "Dynamite", "Frozen Grenade", "Spooky Grenade", "Soul Grenade", "Keynade", "Cuddle Bomb", "Jingle Grenade", "Glorious Grenade"},
["Grenade Launcher"] = {"Swashbuckler", "Uranium Launcher", "Gearnade Launcher", "Skull Launcher", "Snowball Launcher", "Balloon Launcher", "Glorious Grenade Launcher"},
["Handgun"] = {"Blaster", "Gumball Handgun", "Pumpkin Handgun", "Towerstone Handgun", "Warp Handgun", "Gingerbread Handgun", "Pixel Handgun", "Stealth Handgun", "Glorious Handgun"},
["Katana"] = {"Lightning Bolt", "Saber", "Stellar Katana", "Ice Katana", "Pixel Katana", "New Years Katana", "Arch Katana", "Keytana", "Crystal Katana", "Linked Sword", "Glorious Katana"},
["Minigun"] = {"Lasergun 3000", "Pixel Minigun", "Fighter Jet", "Pumpkin Minigun", "Wrapped Minigun", "Glorious Minigun"},
["Paintball Gun"] = {"Boba Gun", "Slime Gun", "Ketchup Gun", "Paintballoon Gun", "Snowball Gun", "Glorious Paintball Gun"},
["Revolver"] = {"Sheriff", "Desert Eagle", "Peppergun", "Boneclaw Revolver", "Keyvolver", "Peppermint Sheriff", "Glorious Revolver"},
["Slingshot"] = {"Goalpost", "Stick", "Harp", "Boneshot", "Reindeer Slingshot", "Glorious Slingshot"},
["Subspace Tripmine"] = {"Don't Press", "Spring", "DIY Tripmine", "Trick or Treat", "Glorious Subspace Tripmine"},
["Uzi"] = {"Electro Uzi", "Water Uzi", "Money Gun", "Pine Uzi", "Keyzi", "Demon Uzi", "Glorious Uzi"},
["Sniper"] = {"Pixel Sniper", "Hyper Sniper", "Event Horizon", "Eyething Sniper", "Gingerbread Sniper", "Keyper", "Glorious Sniper"},
["Knife"] = {"Karambit", "Chancla", "Balisong", "Machete", "Keyrambit", "Keylisong", "Glorious Knife"},
["Shotgun"] = {"Balloon Shotgun", "Cactus Shotgun", "Wrapped Shotgun", "Broomstick Shotgun", "Hyper Shotgun", "Shotkey", "Glorious Shotgun"},
["Crossbow"] = {"Pixel Crossbow", "Violin Crossbow", "Crossbone", "Harpoon Crossbow", "Frostbite Crossbow", "Arch Crossbow", "Glorious Crossbow"},
["Daggers"] = {"Aces", "Paper Planes", "Shurikens", "Bat Daggers", "Cookies", "Keynais", "Crystal Daggers", "Broken Hearts", "Glorious Daggers"},
["Distortion"] = {"Plasma Distortion", "Cyber Distortion", "Magma Distortion", "Electropunk Distortion", "Sleighstortion", "Glorious Distortion"},
["Energy Rifle"] = {"Hacker Rifle", "Void Rifle", "New Year Energy Rifle", "Apex Rifle", "Hydro Rifle", "Soul Rifle", "Glorious Energy Rifle"},
["Energy Pistols"] = {"Void Pistols", "Hydro Pistols", "New Years Energy Pistols", "Soul Pistols", "Hacker Pistols", "Apex Pistols", "Glorious Energy Pistols"},
["Gunblade"] = {"Hyper Gunblade", "Gunsaw", "Boneblade", "Crude Gunblade", "Elf's Gunblade", "Glorious Gunblade"},
["Battle Axe"] = {"The Shred", "Ban Axe", "Cerulean Axe", "Nordic Axe", "Keytle Axe", "Balloon Axe", "Mimic Axe", "Glorious Battleaxe"},
["Riot Shield"] = {"Door", "Masterpiece", "Sled", "Tombstone Shield", "Glorious Riot Shield"},
["Scythe"] = {"Scythe of Death", "Sakura Scythe", "Bat Scythe", "Keythe", "Cryo Scythe", "Crystal Scythe", "Glorious Scythe"},
["Trowel"] = {"Plastic Shovel", "Paintbrush", "Snow Shovel", "Garden Shovel", "Glorious Trowel"},
["Medkit"] = {"Sandwich", "Medkitty", "Shady Chicken Sandwich", "Milk & Cookies", "Glorious Medkit"},
["Molotov"] = {"Coffee", "Torch", "Lava Lamp", "Vexed Candle", "Glorious Molotov"},
["Satchel"] = {"Bag O' Money", "Notebook Satchel", "Suspicious Gift", "Advanced Satchel", "Potion Satchel", "Glorious Satchel"},
["Smoke Grenade"] = {"Emoji Cloud", "Balance", "Hourglass", "Glorious Smoke Grenade"},
["War Horn"] = {"Trumpet", "Air Horn", "Megaphone", "Mammoth Horn", "Boneclaw Horn", "Glorious War Horn"},
["Warpstone"] = {"Cyber Warpstone", "Bonestone", "Electropunk Warpstone", "Warpbone", "Unstable Warpstone", "Glorious Warpstone"},
["Flashbang"] = {"Pixel Flashbang", "Skullbang", "Glorious Flashbang"},
["Jump Pad"] = {"Glorious Jump Pad"},
["Warper"] = {"Arcane Warper", "Electropunk Warper", "Frost Warper", "Glitter Warper", "Glorious Warper"},
["Shorty"] = {"Balloon Shorty", "Demon Shorty", "Lovely Shorty", "Not So Shorty", "Too Shorty", "Wrapped Shorty", "Glorious Shorty"},
["Maul"] = {"Ice Maul", "Sleigh Maul", "Glorious Maul"},
["Spray"] = {"Boneclaw Spray", "Key Spray", "Lovely Spray", "Pine Spray", "Glorious Spray"},
["Permafrost"] = {"Ice Permafrost", "Snowman Permafrost", "Glorious Permafrost"},
}
local l = {"Plastic", "SmoothPlastic", "Neon", "Metal", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "CorrodedMetal", "DiamondPlate", "Foil", "Glass", "Grass", "Ice", "Sand", "Fabric", "ForceField"}
local af = {
["MISSING_WEAPON"] = "rbxassetid://124519084257039",
["MISSING_SKIN"] = "rbxassetid://124519084257039",
["Medkit"] = "rbxassetid://17160800734",
["Sandwich"] = "rbxassetid://17838232333",
["Milk & Cookies"] = "rbxassetid://99156135330432",
["Medkitty"] = "rbxassetid://125732280509514",
["Glorious Medkit"] = "rbxassetid://73358160718523",
["Shady Chicken Sandwich"] = "rbxassetid://86361684164972",
["Subspace Tripmine"] = "rbxassetid://17160799418",
["Don't Press"] = "rbxassetid://17821233203",
["Spring"] = "rbxassetid://18766860615",
["Trick or Treat"] = "rbxassetid://101693036028491",
["DIY Tripmine"] = "rbxassetid://85747991601740",
["Glorious Subspace Tripmine"] = "rbxassetid://112555928142930",
["Flamethrower"] = "rbxassetid://89455038280473",
["Pixel Flamethrower"] = "rbxassetid://17771752104",
["Lamethrower"] = "rbxassetid://18766862822",
["Jack O' Thrower"] = "rbxassetid://140280020818514",
["Snowblower"] = "rbxassetid://128743586418880",
["Glitterthrower"] = "rbxassetid://88920581735649",
["Glorious Flamethrower"] = "rbxassetid://71676635953177",
["Keythrower"] = "rbxassetid://130308634220965",
["Grenade"] = "rbxassetid://17160801411",
["Whoopee Cushion"] = "rbxassetid://17672062933",
["Water Balloon"] = "rbxassetid://18766859819",
["Soul Grenade"] = "rbxassetid://85903097459179",
["Jingle Grenade"] = "rbxassetid://97646859596860",
["Dynamite"] = "rbxassetid://119066463640901",
["Keynade"] = "rbxassetid://102785971311114",
["Glorious Grenade"] = "rbxassetid://103034870490455",
["Frozen Grenade"] = "rbxassetid://96120996159611",
["Cuddle Bomb"] = "rbxassetid://116801887274189",
["Spooky Grenade"] = "rbxassetid://85903097459179",
["Molotov"] = "rbxassetid://109264750627289",
["Coffee"] = "rbxassetid://17672061538",
["Torch"] = "rbxassetid://115586189235552",
["Vexed Candle"] = "rbxassetid://78128648928195",
["Lava Lamp"] = "rbxassetid://79616583726432",
["Glorious Molotov"] = "rbxassetid://108930340066987",
["Flashbang"] = "rbxassetid://17160801529",
["Pixel Flashbang"] = "rbxassetid://132815625474597",
["Skullbang"] = "rbxassetid://73796957224972",
["Glorious Flashbang"] = "rbxassetid://96760506528185",
["Smoke Grenade"] = "rbxassetid://17160799767",
["Emoji Cloud"] = "rbxassetid://17821234077",
["Balance"] = "rbxassetid://18766866168",
["Hourglass"] = "rbxassetid://108311418974073",
["Glorious Smoke Grenade"] = "rbxassetid://139714146508398",
["Fists"] = "rbxassetid://17160801745",
["Boxing Gloves"] = "rbxassetid://17672060486",
["Brass Knuckles"] = "rbxassetid://18766866012",
["Pumpkin Claws"] = "rbxassetid://90996407819750",
["Festive Fists"] = "rbxassetid://102757458529795",
["Fists of Hurt"] = "rbxassetid://140103672289959",
["Glorious Fists"] = "rbxassetid://82492165200104",
["Knife"] = "rbxassetid://17160800983",
["Chancla"] = "rbxassetid://17672060795",
["Karambit"] = "rbxassetid://18766863586",
["Machete"] = "rbxassetid://84364955819899",
["Balisong"] = "rbxassetid://93303458333011",
["Glorious Knife"] = "rbxassetid://77448895595314",
["Keyrambit"] = "rbxassetid://108512337101248",
["Keylisong"] = "rbxassetid://100084654831857",
["Chainsaw"] = "rbxassetid://17160801873",
["Blobsaw"] = "rbxassetid://17825963589",
["Handsaws"] = "rbxassetid://18766864583",
["Buzzsaw"] = "rbxassetid://74057448201836",
["Festive Buzzsaw"] = "rbxassetid://80811854818775",
["Mega Drill"] = "rbxassetid://76663867023998",
["Glorious Chainsaw"] = "rbxassetid://122622447397834",
["Katana"] = "rbxassetid://17160801158",
["Saber"] = "rbxassetid://17672062341",
["Lightning Bolt"] = "rbxassetid://18768968241",
["Pixel Katana"] = "rbxassetid://127922483074145",
["New Years Katana"] = "rbxassetid://102866488046710",
["Keytana"] = "rbxassetid://118899310989170",
["Stellar Katana"] = "rbxassetid://72617738655198",
["Glorious Katana"] = "rbxassetid://75588958786035",
["Arch Katana"] = "rbxassetid://94679283541658",
["Crystal Katana"] = "rbxassetid://88872493010693",
["Linked Sword"] = "rbxassetid://83575725004177",
["Ice Katana"] = "rbxassetid://72617738655198",
["Scythe"] = "rbxassetid://17160800186",
["Scythe of Death"] = "rbxassetid://17825996537",
["Keythe"] = "rbxassetid://114560926055433",
["Bat Scythe"] = "rbxassetid://131711174838548",
["Cryo Scythe"] = "rbxassetid://119930754357379",
["Sakura Scythe"] = "rbxassetid://133811689655966",
["Glorious Scythe"] = "rbxassetid://115811939422419",
["Crystal Scythe"] = "rbxassetid://73971549402646",
["Trowel"] = "rbxassetid://17160799172",
["Plastic Shovel"] = "rbxassetid://17672062201",
["Garden Shovel"] = "rbxassetid://18766864873",
["Snow Shovel"] = "rbxassetid://78271338778848",
["Paintbrush"] = "rbxassetid://84687920829755",
["Glorious Trowel"] = "rbxassetid://100888500368219",
["Flare Gun"] = "rbxassetid://17160801627",
["Firework Gun"] = "rbxassetid://17691132917",
["Dynamite Gun"] = "rbxassetid://18766865384",
["Vexed Flare Gun"] = "rbxassetid://116287930550049",
["Wrapped Flare Gun"] = "rbxassetid://135638020129378",
["Banana Flare"] = "rbxassetid://123589213761955",
["Glorious Flare Gun"] = "rbxassetid://115324763672074",
["Assault Rifle"] = "rbxassetid://17160682738",
["AK-47"] = "rbxassetid://17691132793",
["AUG"] = "rbxassetid://18770192853",
["Boneclaw Rifle"] = "rbxassetid://100015754284323",
["AKEY-47"] = "rbxassetid://80017496220683",
["Gingerbread AUG"] = "rbxassetid://85584922619813",
["Phoenix Rifle"] = "rbxassetid://140228738718621",
["Tommy Gun"] = "rbxassetid://111251887761435",
["10B Visits"] = "rbxassetid://122165086598560",
["Soul Rifle"] = "rbxassetid://129351366788323",
["Glorious Assault Rifle"] = "rbxassetid://130669996688265",
["Handgun"] = "rbxassetid://17160801282",
["Blaster"] = "rbxassetid://17821234554",
["Pixel Handgun"] = "rbxassetid://82199841278177",
["Pumpkin Handgun"] = "rbxassetid://88495685924653",
["Gingerbread Handgun"] = "rbxassetid://95881238590412",
["Gumball Handgun"] = "rbxassetid://106890990556815",
["Stealth Handgun"] = "rbxassetid://124919185835138",
["Glorious Handgun"] = "rbxassetid://85129427786041",
["Warp Handgun"] = "rbxassetid://102974911528828",
["Towerstone Handgun"] = "rbxassetid://88654252790032",
["Snowball Gun"] = "rbxassetid://113685354916533",
["Burst Rifle"] = "rbxassetid://17160801983",
["Electro Rifle"] = "rbxassetid://132227459821018",
["Aqua Burst"] = "rbxassetid://18837670807",
["Pixel Burst"] = "rbxassetid://102648809593259",
["Spectral Burst"] = "rbxassetid://135012309412679",
["Pine Burst"] = "rbxassetid://132753732294083",
["FAMAS"] = "rbxassetid://74974560606812",
["Glorious Burst Rifle"] = "rbxassetid://78517330608597",
["Keyst Rifle"] = "rbxassetid://78377522426003",
["Sniper"] = "rbxassetid://17160799574",
["Pixel Sniper"] = "rbxassetid://17676081196",
["Hyper Sniper"] = "rbxassetid://18766864081",
["Keyper"] = "rbxassetid://85472935605264",
["Eyething Sniper"] = "rbxassetid://103915302076013",
["Gingerbread Sniper"] = "rbxassetid://99943841952995",
["Event Horizon"] = "rbxassetid://80749667426815",
["Glorious Sniper"] = "rbxassetid://118012090175286",
["RPG"] = "rbxassetid://17160802243",
["Nuke Launcher"] = "rbxassetid://17672061995",
["RPKEY"] = "rbxassetid://108438721125410",
["Spaceship Launcher"] = "rbxassetid://18766860860",
["Pumpkin Launcher"] = "rbxassetid://94648176067808",
["Firework Launcher"] = "rbxassetid://75233372670156",
["Squid Launcher"] = "rbxassetid://130764310743404",
["Pencil Launcher"] = "rbxassetid://106934516693548",
["Glorious RPG"] = "rbxassetid://130506879885802",
["Rocket Launcher"] = "rbxassetid://116931956715309",
["Shorty"] = "rbxassetid://17160800091",
["Not So Shorty"] = "rbxassetid://17672062572",
["Too Shorty"] = "rbxassetid://18129531276",
["Lovely Shorty"] = "rbxassetid://18766862000",
["Demon Shorty"] = "rbxassetid://116443498278384",
["Wrapped Shorty"] = "rbxassetid://136522183669611",
["Balloon Shorty"] = "rbxassetid://75590262133322",
["Glorious Shorty"] = "rbxassetid://105834197552222",
["Shotgun"] = "rbxassetid://17160800007",
["Balloon Shotgun"] = "rbxassetid://17821234823",
["Hyper Shotgun"] = "rbxassetid://18768968419",
["Broomstick Shotgun"] = "rbxassetid://118061559757082",
["Wrapped Shotgun"] = "rbxassetid://74894345245237",
["Cactus Shotgun"] = "rbxassetid://131606483507460",
["Shotkey"] = "rbxassetid://93004214983981",
["Glorious Shotgun"] = "rbxassetid://71704618059601",
["Bow"] = "rbxassetid://17160802080",
["Compound Bow"] = "rbxassetid://17672234242",
["Raven Bow"] = "rbxassetid://18766861627",
["Bat Bow"] = "rbxassetid://108984987378619",
["Frostbite Bow"] = "rbxassetid://121895626623160",
["Dream Bow"] = "rbxassetid://101089313144218",
["Key Bow"] = "rbxassetid://122525140091212",
["Glorious Bow"] = "rbxassetid://84201415206621",
["Balloon Bow"] = "rbxassetid://128957010941029",
["Beloved Bow"] = "rbxassetid://110219131386799",
["Uzi"] = "rbxassetid://17160798908",
["Water Uzi"] = "rbxassetid://17821233590",
["Electro Uzi"] = "rbxassetid://96806694653207",
["Demon Uzi"] = "rbxassetid://132973040482576",
["Pine Uzi"] = "rbxassetid://82545206964916",
["Money Gun"] = "rbxassetid://100705725115757",
["Keyzi"] = "rbxassetid://100392703246534",
["Glorious Uzi"] = "rbxassetid://120045334159124",
["Revolver"] = "rbxassetid://17160800299",
["Desert Eagle"] = "rbxassetid://17821234372",
["Sheriff"] = "rbxassetid://18770192507",
["Boneclaw Revolver"] = "rbxassetid://119174697609264",
["Peppermint Sheriff"] = "rbxassetid://95859403750768",
["Keyvolver"] = "rbxassetid://87974031410344",
["Peppergun"] = "rbxassetid://124178691056979",
["Glorious Revolver"] = "rbxassetid://118135542031794",
["Paintball Gun"] = "rbxassetid://17160853798",
["Slime Gun"] = "rbxassetid://17672062472",
["Boba Gun"] = "rbxassetid://18768830660",
["Ketchup Gun"] = "rbxassetid://76083615050939",
["Glorious Paintball Gun"] = "rbxassetid://86297318955856",
["Paintballoon Gun"] = "rbxassetid://100129918948246",
["Slingshot"] = "rbxassetid://17160799888",
["Goalpost"] = "rbxassetid://17672063165",
["Stick"] = "rbxassetid://17672063048",
["Boneshot"] = "rbxassetid://86606957688341",
["Reindeer Slingshot"] = "rbxassetid://121612921203624",
["Harp"] = "rbxassetid://80850043664453",
["Glorious Slingshot"] = "rbxassetid://101195664167288",
["Grenade Launcher"] = "rbxassetid://17250453814",
["Swashbuckler"] = "rbxassetid://17821233828",
["Uranium Launcher"] = "rbxassetid://18766860114",
["Gearnade Launcher"] = "rbxassetid://133756750612042",
["Skull Launcher"] = "rbxassetid://103257281022910",
["Snowball Launcher"] = "rbxassetid://112349955391111",
["Balloon Launcher"] = "rbxassetid://137862701599991",
["Glorious Grenade Launcher"] = "rbxassetid://134130354519919",
["Minigun"] = "rbxassetid://17250458611",
["Lasergun 3000"] = "rbxassetid://103437974285778",
["Pixel Minigun"] = "rbxassetid://18766861798",
["Pumpkin Minigun"] = "rbxassetid://77388785880854",
["Wrapped Minigun"] = "rbxassetid://127077702465909",
["Fighter Jet"] = "rbxassetid://70780739230558",
["Glorious Minigun"] = "rbxassetid://84246894288637",
["Exogun"] = "rbxassetid://17344796376",
["Wondergun"] = "rbxassetid://17672060360",
["Singularity"] = "rbxassetid://17676876756",
["Ray Gun"] = "rbxassetid://18766861454",
["Exogourd"] = "rbxassetid://137140750597688",
["Midnight Festive Exogun"] = "rbxassetid://127612442529810",
["Repulsor"] = "rbxassetid://109263387714628",
["Glorious Exogun"] = "rbxassetid://129125201034206",
["Freeze Ray"] = "rbxassetid://18429552328",
["Temporal Ray"] = "rbxassetid://18429552503",
["Bubble Ray"] = "rbxassetid://18766865819",
["Wrapped Freeze Ray"] = "rbxassetid://76183738050112",
["Gum Ray"] = "rbxassetid://121504417727123",
["Glorious Freeze Ray"] = "rbxassetid://120211873831101",
["War Horn"] = "rbxassetid://104600246515190",
["Trumpet"] = "rbxassetid://88975601634708",
["Mammoth Horn"] = "rbxassetid://93076834584542",
["Megaphone"] = "rbxassetid://107074211847347",
["Air Horn"] = "rbxassetid://111168146142976",
["Glorious War Horn"] = "rbxassetid://96293355496772",
["Boneclaw Horn"] = "rbxassetid://138360812591331",
["Satchel"] = "rbxassetid://82237471151891",
["Advanced Satchel"] = "rbxassetid://113860326910548",
["Suspicious Gift"] = "rbxassetid://76209303162814",
["Notebook Satchel"] = "rbxassetid://124817464748150",
["Bag O' Money"] = "rbxassetid://129192426700659",
["Glorious Satchel"] = "rbxassetid://100521994805910",
["Potion Satchel"] = "rbxassetid://76787046046890",
["Battle Axe"] = "rbxassetid://93390542043222",
["The Shred"] = "rbxassetid://71234381808727",
["Nordic Axe"] = "rbxassetid://80052264197135",
["Ban Axe"] = "rbxassetid://111046431576859",
["Cerulean Axe"] = "rbxassetid://76353832683350",
["Glorious Battleaxe"] = "rbxassetid://87227212476138",
["Mimic Axe"] = "rbxassetid://111717370450373",
["Keytle Axe"] = "rbxassetid://122117068984402",
["Balloon Axe"] = "rbxassetid://102429983628211",
["Riot Shield"] = "rbxassetid://121172272442833",
["Door"] = "rbxassetid://79242603995428",
["Sled"] = "rbxassetid://73881731607231",
["Masterpiece"] = "rbxassetid://79914271483818",
["Glorious Riot Shield"] = "rbxassetid://132866851386509",
["Tombstone Shield"] = "rbxassetid://125895528641243",
["Daggers"] = "rbxassetid://91885384580845",
["Aces"] = "rbxassetid://139089881483398",
["Cookies"] = "rbxassetid://114482325531769",
["Crystal Daggers"] = "rbxassetid://126221748659600",
["Paper Planes"] = "rbxassetid://84003122595879",
["Shurikens"] = "rbxassetid://135574097643275",
["Glorious Daggers"] = "rbxassetid://76023189104485",
["Bat Daggers"] = "rbxassetid://92001964015225",
["Keynais"] = "rbxassetid://84562761142610",
["Broken Hearts"] = "rbxassetid://74156924296351",
["Energy Pistols"] = "rbxassetid://79471670126710",
["Hacker Pistols"] = "rbxassetid://140621407555872",
["Apex Pistols"] = "rbxassetid://136156057859453",
["New Years Energy Pistols"] = "rbxassetid://126589959779039",
["Void Pistols"] = "rbxassetid://111278471262300",
["Hydro Pistols"] = "rbxassetid://115281889984097",
["Glorious Energy Pistols"] = "rbxassetid://114418789647547",
["Soul Pistols"] = "rbxassetid://72213738067158",
["Energy Rifle"] = "rbxassetid://110259279810005",
["Hacker Rifle"] = "rbxassetid://122816271917525",
["Apex Rifle"] = "rbxassetid://88144772234151",
["New Year Energy Rifle"] = "rbxassetid://111446782522703",
["Hydro Rifle"] = "rbxassetid://73690448730060",
["Void Rifle"] = "rbxassetid://95985016411441",
["Glorious Energy Rifle"] = "rbxassetid://72632815443247",
["Spray"] = "rbxassetid://92882887485248",
["Lovely Spray"] = "rbxassetid://131203015026683",
["Pine Spray"] = "rbxassetid://128285758736343",
["Glorious Spray"] = "rbxassetid://138246745001490",
["Boneclaw Spray"] = "rbxassetid://114078818081911",
["Key Spray"] = "rbxassetid://94061940442700",
["Crossbow"] = "rbxassetid://140211832612284",
["Pixel Crossbow"] = "rbxassetid://115931961841903",
["Frostbite Crossbow"] = "rbxassetid://101536997945363",
["Harpoon Crossbow"] = "rbxassetid://107460405492001",
["Violin Crossbow"] = "rbxassetid://74401302514014",
["Glorious Crossbow"] = "rbxassetid://70875146419725",
["Crossbone"] = "rbxassetid://103469183638638",
["Arch Crossbow"] = "rbxassetid://94981733362451",
["Gunblade"] = "rbxassetid://131231034374465",
["Hyper Gunblade"] = "rbxassetid://134415898983004",
["Elf's Gunblade"] = "rbxassetid://114103306647123",
["Crude Gunblade"] = "rbxassetid://126996645502136",
["Gunsaw"] = "rbxassetid://102700915422689",
["Glorious Gunblade"] = "rbxassetid://88003799126136",
["Boneblade"] = "rbxassetid://126327381608481",
["Jump Pad"] = "rbxassetid://79459600453621",
["Glorious Jump Pad"] = "rbxassetid://71803398862947",
["Distortion"] = "rbxassetid://115712150398379",
["Glorious Distortion"] = "rbxassetid://134722661973710",
["Electropunk Distortion"] = "rbxassetid://109544539643046",
["Plasma Distortion"] = "rbxassetid://126813935337091",
["Magma Distortion"] = "rbxassetid://81103807698156",
["Cyber Distortion"] = "rbxassetid://88995062151276",
["Sleighstortion"] = "rbxassetid://111242141481650",
["Warper"] = "rbxassetid://88033795039891",
["Glorious Warper"] = "rbxassetid://95823647035211",
["Electropunk Warper"] = "rbxassetid://75386728379756",
["Glitter Warper"] = "rbxassetid://94607497565715",
["Arcane Warper"] = "rbxassetid://83632373572638",
["Frost Warper"] = "rbxassetid://70539216094396",
["Warpstone"] = "rbxassetid://94035693279005",
["Glorious Warpstone"] = "rbxassetid://137583560042806",
["Unstable Warpstone"] = "rbxassetid://110083777654388",
["Warpbone"] = "rbxassetid://96452209607150",
["Cyber Warpstone"] = "rbxassetid://133002984228937",
["Electropunk Warpstone"] = "rbxassetid://75299042976369",
["Bonestone"] = "rbxassetid://96452209607150",
["Maul"] = "rbxassetid://81478141693597",
["Sleigh Maul"] = "rbxassetid://114892026951995",
["Ice Maul"] = "rbxassetid://100001888078290",
["Glorious Maul"] = "rbxassetid://125917253783002",
["Permafrost"] = "rbxassetid://74353733133888",
["Snowman Permafrost"] = "rbxassetid://100890626643184",
["Ice Permafrost"] = "rbxassetid://83722160119335",
["Glorious Permafrost"] = "rbxassetid://119977291442329",
}
local d = {}
do
for iv, _ in pairs(ao) do
local bn = af[iv]
if bn then
d[bn] = iv
end
end
end
task.defer(function()
local cq
while not cq do
local fr = k:FindFirstChild("PlayerGui")
local es = fr and fr:FindFirstChild("MainGui")
local er = es and es:FindFirstChild("MainFrame")
local fi = er and er:FindFirstChild("Pages")
local fm = fi and fi:FindFirstChild("PickWeapons")
cq = fm and fm:FindFirstChild("ChosenWeapons")
if not cq then task.wait(0.5) end
end
local function iq(ej, bz)
local bu = bz:FindFirstChild("Button")
local fl = bu and bu:FindFirstChild("Picture")
if not fl then
return
end
local function fy()
local ed = tostring(fl.Image)
local fz = tostring(d[fl.Image]) or "N/A"
end
fl:GetPropertyChangedSignal("Image"):Connect(function()
if fl.Image ~= "" then
fy()
end
end)
if fl.Image ~= "" then
fy()
end
end
local ca = cq:GetChildren()
for i, bz in ipairs(ca) do
iq(string.format("[%d]", i), bz)
end
cq.ChildAdded:Connect(function(bz)
local cn = #cq:GetChildren()
iq(string.format("[NEW:%d]", cn), bz)
end)
end)
local function dq()
local fr = k:FindFirstChild("PlayerGui")
if not fr then return end
local es = fr:FindFirstChild("MainGui")
if not es then return end
local er = es:FindFirstChild("MainFrame")
if not er then return end
local fi = er:FindFirstChild("Pages")
if not fi then return end
local ie = fi:FindFirstChild("ViewProfile")
if not ie then return end
local ay = ie:FindFirstChild("Active")
if not ay then return end
local fo = ay:FindFirstChild("Player")
if not fo then return end
local ex = fo:FindFirstChild("MostPlayedWeapons")
if not ex then return end
return ex
end
local function dk()
local fr = k:FindFirstChild("PlayerGui")
if not fr then return end
local es = fr:FindFirstChild("MainGui")
if not es then return end
local er = es:FindFirstChild("MainFrame")
if not er then return end
local fi = er:FindFirstChild("Pages")
if not fi then return end
local fm = fi:FindFirstChild("PickWeapons")
if not fm then return end
return fm:FindFirstChild("ChosenWeapons")
end
local function dm()
local fr = k:FindFirstChild("PlayerGui")
local es = fr and fr:FindFirstChild("MainGui")
local er = es and es:FindFirstChild("MainFrame")
local dd = er and er:FindFirstChild("Equipment")
local cp = dd and dd:FindFirstChild("Customize")
local bt = cp and cp:FindFirstChild("Bottom")
local cm = bt and bt:FindFirstChild("Container")
local en = cm and cm:FindFirstChild("List")
local cl = en and en:FindFirstChild("Container")
return cl
end
local function hw(it, ba)
local ck = dm()
if not ck then return end
for _, hf in ipairs(ck:GetChildren()) do
local bw = hf:FindFirstChild("Button")
if not bw then continue end
local hq = bw:FindFirstChild("Title")
if not hq then continue end
local hg = hq.Text
local ep = bw:FindFirstChild("Locked")
local eb = bw:FindFirstChild("Icon")
local de = bw:FindFirstChild("Equipped")
if hg == "None" then
if de then
de.Visible = (ba == nil)
end
else
if hg ~= ba then continue end
if ep then ep.Visible = false end
if eb then
eb.ImageColor3 = Color3.fromRGB(255, 255, 255)
eb.ImageTransparency = 0
end
if de then de.Visible = true end
end
end
end
local function dn()
local fr = k:FindFirstChild("PlayerGui")
local es = fr and fr:FindFirstChild("MainGui")
local er = es and es:FindFirstChild("MainFrame")
local dd = er and er:FindFirstChild("Equipment")
local em = dd and dd:FindFirstChild("Left")
local en = em and em:FindFirstChild("List")
local ck = en and en:FindFirstChild("Container")
return ck
end
local function bg(ce, it, ec)
for _, bz in ipairs(ce:GetDescendants()) do
if bz.Name == "EquipmentButtonSlot" then
local bw = bz:FindFirstChild("Button")
if not bw then continue end
local hp = bw:FindFirstChild("Title")
if hp and hp.Text == it then
local eb = bw:FindFirstChild("Icon")
if eb then
eb.Image = ec
end
end
end
end
end
local function hx(it, gx)
local ck = dn()
if not ck then return end
local ec = af[gx] or af[it]
if not ec then return end
for _, ce in ipairs(ck:GetChildren()) do
if ce.Name == "EquipmentClassSlot" then
bg(ce, it, ec)
end
end
end
local ir = {}
local hh = {}
local function bf(hf)
local bw = hf:FindFirstChild("Button")
if not bw then return end
local fn = bw:FindFirstChild("Picture")
if not fn then return end
local function bh(iv)
hh[hf] = iv
local gx = ai.ActiveSkins[iv]
local cu = (gx and af[gx]) or af[iv]
if cu and fn.Image ~= cu then
fn.Image = cu
end
end
local function cv()
local iv = d[fn.Image] or hh[hf]
if not iv then return end
bh(iv)
if not ir[hf] then
ir[hf] = true
fn:GetPropertyChangedSignal("Image"):Connect(function()
if fn.Image == "" then return end
local bs = d[fn.Image]
if bs then
bh(bs)
end
end)
end
end
if fn.Image ~= "" then
cv()
else
local cj
cj = fn:GetPropertyChangedSignal("Image"):Connect(function()
if fn.Image ~= "" then
cj:Disconnect()
cv()
end
end)
end
end
local function du(ck)
for _, hf in ipairs(ck:GetChildren()) do
bf(hf)
end
ck.ChildAdded:Connect(function(hf)
task.wait()
bf(hf)
end)
end
local function dp()
local fr = k:FindFirstChild("PlayerGui")
if not fr then return end
local es = fr:FindFirstChild("MainGui")
if not es then return end
local er = es:FindFirstChild("MainFrame")
if not er then return end
local dg = er:FindFirstChild("FighterInterfaces")
if not dg then return end
local fq = dg:FindFirstChild(m)
if not fq then return end
local ea = fq:FindFirstChild("Hotbar")
if not ea then return end
return ea:FindFirstChild("Container")
end
local function hy(it, gx)
local ec = af[gx] or af[it]
if not ec then return end
local ck = dp()
if not ck then return end
local iw = ck:FindFirstChild(it)
if not iw then return end
local eb = iw:FindFirstChild("Icon")
if not eb then return end
eb.Image = ec
end
local function dr()
local fr = k:FindFirstChild("PlayerGui")
if not fr then return end
local es = fr:FindFirstChild("MainGui")
if not es then return end
local er = es:FindFirstChild("MainFrame")
if not er then return end
local fi = er:FindFirstChild("Pages")
if not fi then return end
local fm = fi:FindFirstChild("PickWeapons")
if not fm then return end
local en = fm:FindFirstChild("List")
if not en then return end
return en:FindFirstChild("Container")
end
local function hz(it, gx)
local ec = af[gx] or af[it]
if not ec then return end
local function ht(hf)
local bw = hf:FindFirstChild("Button")
if not bw then return false end
local hp = bw:FindFirstChild("Title")
if not hp or hp.Text ~= it then return false end
local eb = bw:FindFirstChild("Icon")
if not eb then return false end
local fn = eb:FindFirstChild("Picture")
if fn then
fn.Image = ec
end
return true
end
task.spawn(function()
local ck
while not ck do
ck = dr()
if not ck then task.wait(0.5) end
end
local eu = false
for _, hf in ipairs(ck:GetChildren()) do
if ht(hf) then
eu = true
end
end
if not eu then
local cj
cj = ck.ChildAdded:Connect(function(hf)
task.wait()
if ht(hf) then
cj:Disconnect()
end
end)
end
end)
end
local is = {}
local function ip(iv, eb)
local ei = iv .. "_" .. tostring(eb)
if is[ei] then return end
is[ei] = true
if eb.GetPropertyChangedSignal then
eb:GetPropertyChangedSignal("Image"):Connect(function()
local gx = ai.ActiveSkins[iv]
if not gx then return end
local ct = af[gx] or af[iv]
if ct and eb.Image ~= ct then
eb.Image = ct
end
end)
end
end
local function dw(ck)
for _, hf in ipairs(ck:GetChildren()) do
local eb = hf:FindFirstChild("Icon")
if eb then
ip(hf.Name, eb)
end
end
ck.ChildAdded:Connect(function(hf)
task.wait()
local eb = hf:FindFirstChild("Icon")
if eb then
ip(hf.Name, eb)
local gx = ai.ActiveSkins[hf.Name]
if gx then
hy(hf.Name, gx)
end
end
end)
end
local function dy(ck)
local function bm(hf)
local bw = hf:FindFirstChild("Button")
if not bw then return end
local hp = bw:FindFirstChild("Title")
if not hp then return end
local iv = hp.Text
local gx = ai.ActiveSkins[iv]
local ec = af[gx or iv] or af[iv]
if not ec then return end
local eb = bw:FindFirstChild("Icon")
if not eb then return end
local fn = eb:FindFirstChild("Picture")
if fn then
fn.Image = ec
else
eb.Image = ec
end
end
for _, hf in ipairs(ck:GetChildren()) do
bm(hf)
end
ck.ChildAdded:Connect(function(hf)
task.wait()
bm(hf)
end)
end
local function bi(hf)
local bw = hf:FindFirstChild("Button")
if not bw then return end
local hq = bw:FindFirstChild("Title")
if not hq then return end
local iv = hq.Text
if not iv or iv == "" then return end
local gx = ai.ActiveSkins[iv]
local ec = af[gx] or af[iv]
if not ec then return end
local eb = bw:FindFirstChild("Icon")
if not eb then return end
local fn = eb:FindFirstChild("Picture")
if not fn then return end
fn.Image = ec
end
local function dx(ck)
for _, hf in ipairs(ck:GetChildren()) do
bi(hf)
end
ck.ChildAdded:Connect(function(hf)
task.wait()
bi(hf)
end)
end
local function hl()
task.spawn(function()
local ck
while not ck do
ck = dp()
if not ck then task.wait(0.5) end
end
dw(ck)
end)
task.spawn(function()
local ck
while not ck do
ck = dr()
if not ck then task.wait(0.5) end
end
dy(ck)
end)
task.spawn(function()
local ck
while not ck do
ck = dq()
if not ck then task.wait(0.5) end
end
dx(ck)
end)
task.spawn(function()
local ck
while not ck do
ck = dk()
if not ck then task.wait(0.5) end
end
du(ck)
end)
task.spawn(function()
local ck
while not ck do
ck = dn()
if not ck then task.wait(0.5) end
end
local function dv(ce)
for it, gx in pairs(ai.ActiveSkins) do
bg(ce, it, af[gx] or af[it])
end
ce.ChildAdded:Connect(function()
task.wait()
for it, gx in pairs(ai.ActiveSkins) do
bg(ce, it, af[gx] or af[it])
end
end)
end
for _, ce in ipairs(ck:GetChildren()) do
if ce.Name == "EquipmentClassSlot" then
dv(ce)
end
end
ck.ChildAdded:Connect(function(ce)
if ce.Name == "EquipmentClassSlot" then
task.wait()
dv(ce)
end
end)
end)
task.spawn(function()
local ck
while not ck do
ck = dm()
if not ck then task.wait(0.5) end
end
for it, gx in pairs(ai.ActiveSkins) do
hw(it, gx)
end
ck.ChildAdded:Connect(function()
for it, gx in pairs(ai.ActiveSkins) do
hw(it, gx)
end
end)
end)
end
local q = Lighting:FindFirstChild("SC_DefaultBackups")
or Instance.new("Folder", Lighting)
q.Name = "SC_DefaultBackups"
local function bp(ey, ew)
if not ew then return end
if q:FindFirstChild(ey) then return end
local bo = Instance.new("Folder")
bo.Name = ey
for _, item in ipairs(ew:GetChildren()) do
local cf = item:Clone()
if cf then
cf.Parent = bo
end
end
bo.Parent = q
end
local function bl(hn, hc)
hn:ClearAllChildren()
for _, item in ipairs(hc:GetChildren()) do
local cf = item:Clone()
cf.Parent = hn
end
end
local function gb(hn, bq, gp)
local bo = q:FindFirstChild(bq)
if not bo then return end
hn:ClearAllChildren()
for _, item in ipairs(bo:GetChildren()) do
item:Clone().Parent = hn
end
if gp then hn:PivotTo(gp) end
end
local bk
local function bj(it, gx, cy)
if not it then return end
local iu
for _, v in ipairs(al:GetDescendants()) do
if v.Name == it then
iu = v
break
end
end
if not iu then return end
if cy and gx then
local hc
for _, v in ipairs(al:GetDescendants()) do
if v.Name == gx then
hc = v
break
end
end
if not hc then return end
bp(it, iu)
bl(iu, hc)
local iy = workspace:FindFirstChild(it)
if iy then
bp(it .. "_ws", iy)
local gp = iy:GetPivot()
bl(iy, hc)
iy:PivotTo(gp)
end
ai.ActiveSkins[it] = gx
hy(it, gx)
hz(it, gx)
hw(it, gx)
hx(it, gx)
local cb = dk()
if cb then
for _, hf in ipairs(cb:GetChildren()) do
bf(hf)
end
end
else
gb(iu, it, nil)
local iy = workspace:FindFirstChild(it)
if iy then
gb(iy, it .. "_ws", iy:GetPivot())
end
ai.ActiveSkins[it] = nil
hy(it, it)
hz(it, it)
hw(it, nil)
hx(it, it)
local cb = dk()
if cb then
for _, hf in ipairs(cb:GetChildren()) do
bf(hf)
end
end
end
go()
bk(it, gx, cy)
end
local an = {
["Assault Rifle"] = {"rbxassetid://13087362838","rbxassetid://13158735106","rbxassetid://13236549929"},
["Battle Axe"] = {"rbxassetid://100664516053133","rbxassetid://110122962237431","rbxassetid://124941279780653","rbxassetid://13158735106","rbxassetid://77594993345414"},
["Bow"] = {"rbxassetid://13677205703","rbxassetid://13682183816","rbxassetid://13682532502"},
["Burst Rifle"] = {"rbxassetid://13087362838","rbxassetid://13158735106","rbxassetid://13236549962"},
["Chainsaw"] = {"rbxassetid://13645858825","rbxassetid://13682898881"},
["Crossbow"] = {"rbxassetid://13682532502","rbxassetid://82715240396507"},
["Daggers"] = {"rbxassetid://101759165907297","rbxassetid://76357741438822","rbxassetid://99837158417289"},
["Distortion"] = {"rbxassetid://126144885809059","rbxassetid://13158735106","rbxassetid://139955889483895","rbxassetid://73931497990415"},
["Energy Pistols"] = {"rbxassetid://120386834342865","rbxassetid://130113322","rbxassetid://13456860578"},
["Energy Rifle"] = {"rbxassetid://105876698718377","rbxassetid://73644074370077"},
["Exogun"] = {"rbxassetid://13158735106","rbxassetid://17266070755","rbxassetid://17266070911","rbxassetid://17266071099"},
["Fists"] = {"rbxassetid://13160401062","rbxassetid://13160489311"},
["Flamethrower"] = {"rbxassetid://13158735106"},
["Flare Gun"] = {"rbxassetid://13169270306","rbxassetid://13456860578"},
["Freeze Ray"] = {"rbxassetid://117394649224413","rbxassetid://119827986766384","rbxassetid://18429093191","rbxassetid://18429138544","rbxassetid://18431054958"},
["Grenade"] = {"rbxassetid://13158735106","rbxassetid://14522129645","rbxassetid://14522189766","rbxassetid://17650838003"},
["Grenade Launcher"] = {"rbxassetid://17274369044","rbxassetid://17274369233","rbxassetid://17274387490","rbxassetid://17274798693"},
["Gunblade"] = {"rbxassetid://77594993345414","rbxassetid://96886470957330"},
["Handgun"] = {"rbxassetid://123968428540207","rbxassetid://127707586685295","rbxassetid://13110197302","rbxassetid://13158330555","rbxassetid://13158330666","rbxassetid://13158610792","rbxassetid://95907783081847"},
["Katana"] = {"rbxassetid://13158735106","rbxassetid://134511176124672","rbxassetid://14000023392","rbxassetid://14000023581","rbxassetid://14427935597","rbxassetid://14798337918"},
["Knife"] = {"rbxassetid://13158735106","rbxassetid://13160400909","rbxassetid://13169152449","rbxassetid://13455968789","rbxassetid://13455968853","rbxassetid://14427935597","rbxassetid://4390298761"},
["Maul"] = {"rbxassetid://136633555539199"},
["Medkit"] = {"rbxassetid://107901458751913","rbxassetid://125248293081026","rbxassetid://13158735106","rbxassetid://13236026280","rbxassetid://13456860578","rbxassetid://75064925834262","rbxassetid://92333760834779"},
["Minigun"] = {"rbxassetid://17247639614"},
["Molotov"] = {"rbxassetid://14812965418"},
["Paintball Gun"] = {"rbxassetid://13158735106","rbxassetid://17092564046"},
["Permafrost"] = {"rbxassetid://108185335541864","rbxassetid://13158735106","rbxassetid://14522189766","rbxassetid://97621886814272"},
["RPG"] = {"rbxassetid://13158735106","rbxassetid://13455968895","rbxassetid://13456613343","rbxassetid://13456746131"},
["Revolver"] = {"rbxassetid://13456860578","rbxassetid://13483008798","rbxassetid://14417089307"},
["Riot Shield"] = {"rbxassetid://104396544264853","rbxassetid://17247639614","rbxassetid://98658929863025"},
["Satchel"] = {"rbxassetid://75265411785539"},
["Scythe"] = {"rbxassetid://13158735106","rbxassetid://14111617269","rbxassetid://14111617408","rbxassetid://18763594759"},
["Shorty"] = {"rbxassetid://13158735106","rbxassetid://13479562219","rbxassetid://13483008798"},
["Shotgun"] = {"rbxassetid://124072278569896","rbxassetid://13158735106","rbxassetid://13479562219","rbxassetid://13515046872","rbxassetid://13515046921"},
["Slingshot"] = {"rbxassetid://13682532502"},
["Sniper"] = {"rbxassetid://13270206222","rbxassetid://13455229044","rbxassetid://13455394948","rbxassetid://13455395017"},
["Spray"] = {"rbxassetid://100354903585817","rbxassetid://13158330555","rbxassetid://13483008798","rbxassetid://72698186314258","rbxassetid://98906484629283"},
["Subspace Tripmine"] = {"rbxassetid://13158735106"},
["Trowel"] = {"rbxassetid://13456860578","rbxassetid://17131614494"},
["Uzi"] = {"rbxassetid://13158330555","rbxassetid://13158735106","rbxassetid://16526185100"},
["War Horn"] = {"rbxassetid://73325703605178"},
["Warper"] = {"rbxassetid://107539891279940","rbxassetid://120936003285451","rbxassetid://13158735106","rbxassetid://84239597144951"},
["Warpstone"] = {"rbxassetid://111876623538044","rbxassetid://13456860578","rbxassetid://14427935597","rbxassetid://14522189766","rbxassetid://73717852775255","rbxassetid://92027252831890"},
}
local am = {}
for ix, ids in pairs(an) do
local gt = {}
for _, id in ipairs(ids) do gt[id] = true end
am[ix] = gt
end
local ag = {
["AK-47"] = {["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://90757583550672"]="rbxassetid://17662574783"},
["AKEY-47"] = {["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://13158735106"]="rbxassetid://96253147006478",["rbxassetid://13160326139"]="rbxassetid://96253147006478",["rbxassetid://13236549929"]="rbxassetid://96253147006478",["rbxassetid://13236549962"]="rbxassetid://96253147006478",["rbxassetid://13455395017"]="rbxassetid://96253147006478",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://90757583550672"]="rbxassetid://17662574783"},
["AUG"] = {["rbxassetid://100664516053133"]="rbxassetid://13455395017",["rbxassetid://106994976644858"]="rbxassetid://13455395017",["rbxassetid://108380234827963"]="rbxassetid://13455395017",["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://112097244349559"]="rbxassetid://13455395017",["rbxassetid://114436319908436"]="rbxassetid://13455395017",["rbxassetid://117326796133738"]="rbxassetid://13455395017",["rbxassetid://11956590"]="rbxassetid://13455395017",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://128809359344035"]="rbxassetid://13455395017",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://13158330555"]="rbxassetid://13455395017",["rbxassetid://13158735106"]="rbxassetid://13455395017",["rbxassetid://13160326139"]="rbxassetid://13455395017",["rbxassetid://13160400937"]="rbxassetid://13455395017",["rbxassetid://13169152449"]="rbxassetid://13455395017",["rbxassetid://13236026280"]="rbxassetid://13455395017",["rbxassetid://13236549929"]="rbxassetid://13455395017",["rbxassetid://13236549962"]="rbxassetid://13455395017",["rbxassetid://132926867312544"]="rbxassetid://13455395017",["rbxassetid://134472359434980"]="rbxassetid://13455395017",["rbxassetid://13456860578"]="rbxassetid://13455395017",["rbxassetid://13483008798"]="rbxassetid://13455395017",["rbxassetid://13515046921"]="rbxassetid://13455395017",["rbxassetid://13515046988"]="rbxassetid://13455395017",["rbxassetid://137232955524669"]="rbxassetid://13455395017",["rbxassetid://137300623286123"]="rbxassetid://13455395017",["rbxassetid://137900058595276"]="rbxassetid://13455395017",["rbxassetid://139955889483895"]="rbxassetid://13455395017",["rbxassetid://14000093824"]="rbxassetid://13455395017",["rbxassetid://14241444681"]="rbxassetid://13455395017",["rbxassetid://17123622923"]="rbxassetid://13455395017",["rbxassetid://17274387490"]="rbxassetid://13455395017",["rbxassetid://17640978498"]="rbxassetid://13455395017",["rbxassetid://17803360572"]="rbxassetid://13455395017",["rbxassetid://18128896162"]="rbxassetid://13455395017",["rbxassetid://18128949754"]="rbxassetid://13455395017",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://71387264231358"]="rbxassetid://13455395017",["rbxassetid://73931497990415"]="rbxassetid://13455395017",["rbxassetid://75549206431714"]="rbxassetid://13455395017",["rbxassetid://84163808107137"]="rbxassetid://13455395017",["rbxassetid://90757583550672"]="rbxassetid://17662574783",["rbxassetid://93178963908825"]="rbxassetid://13455395017",["rbxassetid://96253147006478"]="rbxassetid://13455395017"},
["Aces"] = {["rbxassetid://122106573913822"]="rbxassetid://101759165907297",["rbxassetid://130725438600072"]="rbxassetid://101759165907297",["rbxassetid://76357741438822"]="rbxassetid://101759165907297",["rbxassetid://80622617308150"]="rbxassetid://101759165907297",["rbxassetid://92418233748009"]="rbxassetid://101759165907297",["rbxassetid://99837158417289"]="rbxassetid://73179276891844"},
["Advanced Satchel"] = {["rbxassetid://75265411785539"]="rbxassetid://77105035737299"},
["Air Horn"] = {["rbxassetid://101461584188367"]="rbxassetid://128459467144728",["rbxassetid://106770345116398"]="rbxassetid://128459467144728",["rbxassetid://73325703605178"]="rbxassetid://128459467144728",["rbxassetid://94406584083681"]="rbxassetid://128459467144728"},
["Arch Crossbow"] = {["rbxassetid://100943371677728"]="rbxassetid://81230732872783",["rbxassetid://127610347219152"]="rbxassetid://114610550422028",["rbxassetid://13682532502"]="rbxassetid://114610550422028",["rbxassetid://76155503538875"]="rbxassetid://114610550422028",["rbxassetid://77840212230515"]="rbxassetid://114610550422028",["rbxassetid://82715240396507"]="rbxassetid://81230732872783"},
["Arch Katana"] = {["rbxassetid://100664516053133"]="rbxassetid://137232955524669",["rbxassetid://106994976644858"]="rbxassetid://137232955524669",["rbxassetid://108380234827963"]="rbxassetid://137232955524669",["rbxassetid://110122962237431"]="rbxassetid://137232955524669",["rbxassetid://112097244349559"]="rbxassetid://137232955524669",["rbxassetid://114436319908436"]="rbxassetid://137232955524669",["rbxassetid://117326796133738"]="rbxassetid://137232955524669",["rbxassetid://118748685078128"]="rbxassetid://116868301514983",["rbxassetid://11956590"]="rbxassetid://137232955524669",["rbxassetid://12222208"]="rbxassetid://116868301514983",["rbxassetid://125777995479531"]="rbxassetid://116868301514983",["rbxassetid://128809359344035"]="rbxassetid://137232955524669",["rbxassetid://13158330555"]="rbxassetid://137232955524669",["rbxassetid://13158735106"]="rbxassetid://137232955524669",["rbxassetid://13160326139"]="rbxassetid://137232955524669",["rbxassetid://13160400937"]="rbxassetid://137232955524669",["rbxassetid://13169152449"]="rbxassetid://137232955524669",["rbxassetid://13236026280"]="rbxassetid://137232955524669",["rbxassetid://13236549929"]="rbxassetid://137232955524669",["rbxassetid://13236549962"]="rbxassetid://137232955524669",["rbxassetid://132926867312544"]="rbxassetid://137232955524669",["rbxassetid://134472359434980"]="rbxassetid://137232955524669",["rbxassetid://13455395017"]="rbxassetid://137232955524669",["rbxassetid://13456860578"]="rbxassetid://137232955524669",["rbxassetid://13483008798"]="rbxassetid://137232955524669",["rbxassetid://13515046921"]="rbxassetid://137232955524669",["rbxassetid://13515046988"]="rbxassetid://137232955524669",["rbxassetid://137300623286123"]="rbxassetid://137232955524669",["rbxassetid://137900058595276"]="rbxassetid://137232955524669",["rbxassetid://139955889483895"]="rbxassetid://137232955524669",["rbxassetid://14000093824"]="rbxassetid://137232955524669",["rbxassetid://14241444681"]="rbxassetid://137232955524669",["rbxassetid://14798337918"]="rbxassetid://116868301514983",["rbxassetid://17123622923"]="rbxassetid://137232955524669",["rbxassetid://17274387490"]="rbxassetid://137232955524669",["rbxassetid://17640978498"]="rbxassetid://137232955524669",["rbxassetid://17803360572"]="rbxassetid://137232955524669",["rbxassetid://18128896162"]="rbxassetid://137232955524669",["rbxassetid://18128949754"]="rbxassetid://137232955524669",["rbxassetid://71387264231358"]="rbxassetid://137232955524669",["rbxassetid://73931497990415"]="rbxassetid://137232955524669",["rbxassetid://75549206431714"]="rbxassetid://137232955524669",["rbxassetid://84163808107137"]="rbxassetid://137232955524669",["rbxassetid://90757583550672"]="rbxassetid://116868301514983",["rbxassetid://93178963908825"]="rbxassetid://137232955524669",["rbxassetid://96253147006478"]="rbxassetid://137232955524669"},
["Balisong"] = {["rbxassetid://100664516053133"]="rbxassetid://108891371725091",["rbxassetid://101733853413710"]="rbxassetid://108891371725091",["rbxassetid://106994976644858"]="rbxassetid://108891371725091",["rbxassetid://108380234827963"]="rbxassetid://108891371725091",["rbxassetid://110122962237431"]="rbxassetid://108891371725091",["rbxassetid://112097244349559"]="rbxassetid://108891371725091",["rbxassetid://114436319908436"]="rbxassetid://108891371725091",["rbxassetid://117326796133738"]="rbxassetid://108891371725091",["rbxassetid://11956590"]="rbxassetid://108891371725091",["rbxassetid://12222208"]="rbxassetid://108891371725091",["rbxassetid://128809359344035"]="rbxassetid://108891371725091",["rbxassetid://130523978733899"]="rbxassetid://108891371725091",["rbxassetid://13158330555"]="rbxassetid://108891371725091",["rbxassetid://13158735106"]="rbxassetid://108891371725091",["rbxassetid://13160326139"]="rbxassetid://108891371725091",["rbxassetid://13160400937"]="rbxassetid://108891371725091",["rbxassetid://13169152449"]="rbxassetid://108891371725091",["rbxassetid://13236026280"]="rbxassetid://108891371725091",["rbxassetid://13236549929"]="rbxassetid://108891371725091",["rbxassetid://13236549962"]="rbxassetid://108891371725091",["rbxassetid://132926867312544"]="rbxassetid://108891371725091",["rbxassetid://133090858473825"]="rbxassetid://108891371725091",["rbxassetid://134472359434980"]="rbxassetid://108891371725091",["rbxassetid://13455395017"]="rbxassetid://108891371725091",["rbxassetid://13455968789"]="rbxassetid://108891371725091",["rbxassetid://13456860578"]="rbxassetid://108891371725091",["rbxassetid://13483008798"]="rbxassetid://108891371725091",["rbxassetid://13515046921"]="rbxassetid://108891371725091",["rbxassetid://13515046988"]="rbxassetid://108891371725091",["rbxassetid://137232955524669"]="rbxassetid://108891371725091",["rbxassetid://137300623286123"]="rbxassetid://108891371725091",["rbxassetid://137900058595276"]="rbxassetid://108891371725091",["rbxassetid://139955889483895"]="rbxassetid://108891371725091",["rbxassetid://14000023392"]="rbxassetid://108891371725091",["rbxassetid://14000023581"]="rbxassetid://108891371725091",["rbxassetid://14000093824"]="rbxassetid://108891371725091",["rbxassetid://14241444681"]="rbxassetid://108891371725091",["rbxassetid://14427782350"]="rbxassetid://108891371725091",["rbxassetid://14427935597"]="rbxassetid://108891371725091",["rbxassetid://17092564046"]="rbxassetid://108891371725091",["rbxassetid://17123622923"]="rbxassetid://108891371725091",["rbxassetid://17274387490"]="rbxassetid://108891371725091",["rbxassetid://17640978271"]="rbxassetid://108891371725091",["rbxassetid://17640978498"]="rbxassetid://108891371725091",["rbxassetid://17803360572"]="rbxassetid://108891371725091",["rbxassetid://18128896162"]="rbxassetid://108891371725091",["rbxassetid://18128949754"]="rbxassetid://108891371725091",["rbxassetid://71387264231358"]="rbxassetid://108891371725091",["rbxassetid://73931497990415"]="rbxassetid://108891371725091",["rbxassetid://75549206431714"]="rbxassetid://108891371725091",["rbxassetid://76064160033456"]="rbxassetid://108891371725091",["rbxassetid://82637145735352"]="rbxassetid://108891371725091",["rbxassetid://84163808107137"]="rbxassetid://108891371725091",["rbxassetid://89056031983351"]="rbxassetid://108891371725091",["rbxassetid://90757583550672"]="rbxassetid://108891371725091",["rbxassetid://93178963908825"]="rbxassetid://108891371725091",["rbxassetid://96253147006478"]="rbxassetid://108891371725091"},
["Balloon Launcher"] = {["rbxassetid://100664516053133"]="rbxassetid://17274387490",["rbxassetid://106994976644858"]="rbxassetid://17274387490",["rbxassetid://108380234827963"]="rbxassetid://17274387490",["rbxassetid://110122962237431"]="rbxassetid://17274387490",["rbxassetid://112097244349559"]="rbxassetid://17274387490",["rbxassetid://114436319908436"]="rbxassetid://17274387490",["rbxassetid://117326796133738"]="rbxassetid://17274387490",["rbxassetid://11956590"]="rbxassetid://17274387490",["rbxassetid://128809359344035"]="rbxassetid://17274387490",["rbxassetid://13158330555"]="rbxassetid://17274387490",["rbxassetid://13158735106"]="rbxassetid://17274387490",["rbxassetid://13160326139"]="rbxassetid://17274387490",["rbxassetid://13160400937"]="rbxassetid://17274387490",["rbxassetid://13169152449"]="rbxassetid://17274387490",["rbxassetid://13236026280"]="rbxassetid://17274387490",["rbxassetid://13236549929"]="rbxassetid://17274387490",["rbxassetid://13236549962"]="rbxassetid://17274387490",["rbxassetid://132926867312544"]="rbxassetid://17274387490",["rbxassetid://134472359434980"]="rbxassetid://17274387490",["rbxassetid://13455395017"]="rbxassetid://17274387490",["rbxassetid://13455968895"]="rbxassetid://17274369233",["rbxassetid://13456746075"]="rbxassetid://17274798693",["rbxassetid://13456746131"]="rbxassetid://17274798693",["rbxassetid://13456860578"]="rbxassetid://17274387490",["rbxassetid://13483008798"]="rbxassetid://17274387490",["rbxassetid://13515046921"]="rbxassetid://17274387490",["rbxassetid://13515046988"]="rbxassetid://17274387490",["rbxassetid://137232955524669"]="rbxassetid://17274387490",["rbxassetid://137300623286123"]="rbxassetid://17274387490",["rbxassetid://137900058595276"]="rbxassetid://17274387490",["rbxassetid://139955889483895"]="rbxassetid://17274387490",["rbxassetid://14000093824"]="rbxassetid://17274387490",["rbxassetid://14241444681"]="rbxassetid://17274387490",["rbxassetid://17123622923"]="rbxassetid://17274387490",["rbxassetid://17640978498"]="rbxassetid://17274387490",["rbxassetid://17803360572"]="rbxassetid://17274387490",["rbxassetid://18128896162"]="rbxassetid://17274387490",["rbxassetid://18128949754"]="rbxassetid://17274387490",["rbxassetid://71387264231358"]="rbxassetid://17274387490",["rbxassetid://73931497990415"]="rbxassetid://17274387490",["rbxassetid://75549206431714"]="rbxassetid://17274387490",["rbxassetid://84163808107137"]="rbxassetid://17274387490",["rbxassetid://93178963908825"]="rbxassetid://17274387490",["rbxassetid://96253147006478"]="rbxassetid://17274387490"},
["Balloon Shorty"] = {["rbxassetid://100664516053133"]="rbxassetid://17803360572",["rbxassetid://108887853497578"]="rbxassetid://17803308936",["rbxassetid://110122962237431"]="rbxassetid://17803360572",["rbxassetid://115657023572170"]="rbxassetid://17803308936",["rbxassetid://117893025759206"]="rbxassetid://17803308936",["rbxassetid://123443443495942"]="rbxassetid://17803360572",["rbxassetid://130113370"]="rbxassetid://17803360572",["rbxassetid://13158330383"]="rbxassetid://17803360572",["rbxassetid://13158735106"]="rbxassetid://17803360572",["rbxassetid://13235979356"]="rbxassetid://17803360572",["rbxassetid://13236026280"]="rbxassetid://17803360572",["rbxassetid://13456860578"]="rbxassetid://17803360572",["rbxassetid://13479562219"]="rbxassetid://17803308936",["rbxassetid://13483008798"]="rbxassetid://17803360572",["rbxassetid://134917124344503"]="rbxassetid://17803360572",["rbxassetid://13515046921"]="rbxassetid://17803308936",["rbxassetid://13515046988"]="rbxassetid://17803308936",["rbxassetid://13531443905"]="rbxassetid://17803308936",["rbxassetid://14240943641"]="rbxassetid://17803360572",["rbxassetid://14240944327"]="rbxassetid://17803360572",["rbxassetid://14240944488"]="rbxassetid://17803360572",["rbxassetid://14241444681"]="rbxassetid://17803360572",["rbxassetid://14417088974"]="rbxassetid://17803360572",["rbxassetid://14417089046"]="rbxassetid://17803360572",["rbxassetid://14417089152"]="rbxassetid://17803360572",["rbxassetid://14417089307"]="rbxassetid://17803360572",["rbxassetid://71387264231358"]="rbxassetid://17803360572",["rbxassetid://75549206431714"]="rbxassetid://17803360572",["rbxassetid://83828319245396"]="rbxassetid://17803308936",["rbxassetid://90757583550672"]="rbxassetid://17803360572",["rbxassetid://96253147006478"]="rbxassetid://17803308936"},
["Balloon Shotgun"] = {["rbxassetid://108887853497578"]="rbxassetid://17803308936",["rbxassetid://115657023572170"]="rbxassetid://17803308936",["rbxassetid://117893025759206"]="rbxassetid://17803308936",["rbxassetid://13158735106"]="rbxassetid://17803360572",["rbxassetid://13160326139"]="rbxassetid://17803360572",["rbxassetid://13235979356"]="rbxassetid://17803360572",["rbxassetid://13236026280"]="rbxassetid://17803360572",["rbxassetid://13479562219"]="rbxassetid://17803308936",["rbxassetid://13515046872"]="rbxassetid://17803360572",["rbxassetid://13515046921"]="rbxassetid://17803360572",["rbxassetid://13515046988"]="rbxassetid://17803308936",["rbxassetid://13531443905"]="rbxassetid://17803308936",["rbxassetid://18763645670"]="rbxassetid://17803360572",["rbxassetid://71387264231358"]="rbxassetid://17803360572",["rbxassetid://83828319245396"]="rbxassetid://17803308936",["rbxassetid://90757583550672"]="rbxassetid://17803360572",["rbxassetid://96253147006478"]="rbxassetid://17803308936"},
["Beloved Bow"] = {["rbxassetid://110122962237431"]="rbxassetid://98081733365737",["rbxassetid://122106573913822"]="rbxassetid://98081733365737",["rbxassetid://123635502936633"]="rbxassetid://98081733365737",["rbxassetid://13677205578"]="rbxassetid://98081733365737",["rbxassetid://13677205647"]="rbxassetid://98081733365737",["rbxassetid://13677205703"]="rbxassetid://98081733365737",["rbxassetid://13682183816"]="rbxassetid://98081733365737",["rbxassetid://17803360572"]="rbxassetid://98081733365737",["rbxassetid://18429138544"]="rbxassetid://98081733365737",["rbxassetid://71387264231358"]="rbxassetid://98081733365737",["rbxassetid://82249006680828"]="rbxassetid://98081733365737",["rbxassetid://84897543898396"]="rbxassetid://98081733365737"},
["Blaster"] = {["rbxassetid://13110197220"]="rbxassetid://17803104424",["rbxassetid://13110197302"]="rbxassetid://17803104424",["rbxassetid://13158330479"]="rbxassetid://17803104424",["rbxassetid://76996559479025"]="rbxassetid://17803104424"},
["Boneclaw Rifle"] = {["rbxassetid://110122962237431"]="rbxassetid://111386960247596",["rbxassetid://124080696816628"]="rbxassetid://111386960247596",["rbxassetid://13087362838"]="rbxassetid://111386960247596",["rbxassetid://18763517194"]="rbxassetid://111386960247596",["rbxassetid://90757583550672"]="rbxassetid://111386960247596"},
["Boxing Gloves"] = {["rbxassetid://13160489311"]="rbxassetid://73893914300609"},
["Cookies"] = {["rbxassetid://99837158417289"]="rbxassetid://105255527603121"},
["Crystal Daggers"] = {["rbxassetid://99837158417289"]="rbxassetid://72570123237418"},
["Crystal Katana"] = {["rbxassetid://12222208"]="rbxassetid://118748685078128",["rbxassetid://125777995479531"]="rbxassetid://118748685078128",["rbxassetid://13160326139"]="rbxassetid://118748685078128",["rbxassetid://133090858473825"]="rbxassetid://118748685078128",["rbxassetid://13455968853"]="rbxassetid://118748685078128",["rbxassetid://14000023392"]="rbxassetid://118748685078128",["rbxassetid://14000023581"]="rbxassetid://118748685078128",["rbxassetid://14427782350"]="rbxassetid://118748685078128",["rbxassetid://14427935597"]="rbxassetid://118748685078128",["rbxassetid://14798337918"]="rbxassetid://118748685078128",["rbxassetid://71387264231358"]="rbxassetid://118748685078128",["rbxassetid://82637145735352"]="rbxassetid://118748685078128",["rbxassetid://86510987016114"]="rbxassetid://118748685078128",["rbxassetid://89056031983351"]="rbxassetid://118748685078128",["rbxassetid://90757583550672"]="rbxassetid://118748685078128",["rbxassetid://96253147006478"]="rbxassetid://118748685078128"},
["Crystal Scythe"] = {["rbxassetid://101947200611951"]="rbxassetid://118748685078128",["rbxassetid://112262347612742"]="rbxassetid://118748685078128",["rbxassetid://122106573913822"]="rbxassetid://118748685078128",["rbxassetid://135836738518083"]="rbxassetid://118748685078128",["rbxassetid://14111617269"]="rbxassetid://118748685078128",["rbxassetid://14111617408"]="rbxassetid://118748685078128",["rbxassetid://75229437160477"]="rbxassetid://118748685078128",["rbxassetid://88326684922300"]="rbxassetid://118748685078128"},
["Cuddle Bomb"] = {["rbxassetid://100664516053133"]="rbxassetid://102298651472826",["rbxassetid://106994976644858"]="rbxassetid://102298651472826",["rbxassetid://108380234827963"]="rbxassetid://102298651472826",["rbxassetid://110122962237431"]="rbxassetid://102298651472826",["rbxassetid://112097244349559"]="rbxassetid://102298651472826",["rbxassetid://114436319908436"]="rbxassetid://102298651472826",["rbxassetid://117326796133738"]="rbxassetid://102298651472826",["rbxassetid://11956590"]="rbxassetid://102298651472826",["rbxassetid://128809359344035"]="rbxassetid://102298651472826",["rbxassetid://13158330555"]="rbxassetid://102298651472826",["rbxassetid://13158735106"]="rbxassetid://102298651472826",["rbxassetid://13160326139"]="rbxassetid://102298651472826",["rbxassetid://13160400937"]="rbxassetid://102298651472826",["rbxassetid://13169152449"]="rbxassetid://102298651472826",["rbxassetid://13236026280"]="rbxassetid://102298651472826",["rbxassetid://13236549929"]="rbxassetid://102298651472826",["rbxassetid://13236549962"]="rbxassetid://102298651472826",["rbxassetid://132926867312544"]="rbxassetid://102298651472826",["rbxassetid://134472359434980"]="rbxassetid://102298651472826",["rbxassetid://13455395017"]="rbxassetid://102298651472826",["rbxassetid://13456860578"]="rbxassetid://102298651472826",["rbxassetid://13483008798"]="rbxassetid://102298651472826",["rbxassetid://13515046921"]="rbxassetid://102298651472826",["rbxassetid://13515046988"]="rbxassetid://102298651472826",["rbxassetid://137232955524669"]="rbxassetid://102298651472826",["rbxassetid://137300623286123"]="rbxassetid://102298651472826",["rbxassetid://137900058595276"]="rbxassetid://102298651472826",["rbxassetid://139955889483895"]="rbxassetid://102298651472826",["rbxassetid://14000093824"]="rbxassetid://102298651472826",["rbxassetid://14241444681"]="rbxassetid://102298651472826",["rbxassetid://17123622923"]="rbxassetid://102298651472826",["rbxassetid://17274387490"]="rbxassetid://102298651472826",["rbxassetid://17640978498"]="rbxassetid://102298651472826",["rbxassetid://17803360572"]="rbxassetid://102298651472826",["rbxassetid://18128896162"]="rbxassetid://102298651472826",["rbxassetid://18128949754"]="rbxassetid://102298651472826",["rbxassetid://71387264231358"]="rbxassetid://102298651472826",["rbxassetid://73931497990415"]="rbxassetid://102298651472826",["rbxassetid://75549206431714"]="rbxassetid://102298651472826",["rbxassetid://84163808107137"]="rbxassetid://102298651472826",["rbxassetid://93178963908825"]="rbxassetid://102298651472826",["rbxassetid://96253147006478"]="rbxassetid://102298651472826"},
["Desert Eagle"] = {["rbxassetid://100664516053133"]="rbxassetid://13158330555",["rbxassetid://104731232227748"]="rbxassetid://17803630344",["rbxassetid://110122962237431"]="rbxassetid://13158330555",["rbxassetid://123443443495942"]="rbxassetid://13158330555",["rbxassetid://130113370"]="rbxassetid://13158330555",["rbxassetid://13158330383"]="rbxassetid://13158330555",["rbxassetid://13158330479"]="rbxassetid://17803630344",["rbxassetid://13158735106"]="rbxassetid://13158330555",["rbxassetid://13235979356"]="rbxassetid://13158330555",["rbxassetid://13236026280"]="rbxassetid://13158330555",["rbxassetid://13456860578"]="rbxassetid://13158330555",["rbxassetid://13483008798"]="rbxassetid://13158330555",["rbxassetid://134917124344503"]="rbxassetid://13158330555",["rbxassetid://14240943641"]="rbxassetid://13158330555",["rbxassetid://14240944327"]="rbxassetid://13158330555",["rbxassetid://14240944488"]="rbxassetid://13158330555",["rbxassetid://14241444681"]="rbxassetid://13158330555",["rbxassetid://14417088974"]="rbxassetid://13158330555",["rbxassetid://14417089046"]="rbxassetid://13158330555",["rbxassetid://14417089152"]="rbxassetid://13158330555",["rbxassetid://14417089307"]="rbxassetid://17803630344",["rbxassetid://17803360572"]="rbxassetid://13158330555",["rbxassetid://71387264231358"]="rbxassetid://13158330555",["rbxassetid://75549206431714"]="rbxassetid://13158330555",["rbxassetid://90757583550672"]="rbxassetid://13158330555"},
["Dream Bow"] = {["rbxassetid://110122962237431"]="rbxassetid://84897543898396",["rbxassetid://122106573913822"]="rbxassetid://84897543898396",["rbxassetid://123635502936633"]="rbxassetid://84897543898396",["rbxassetid://13677205578"]="rbxassetid://84897543898396",["rbxassetid://13677205647"]="rbxassetid://84897543898396",["rbxassetid://13677205703"]="rbxassetid://84897543898396",["rbxassetid://13682183816"]="rbxassetid://84897543898396",["rbxassetid://17803360572"]="rbxassetid://84897543898396",["rbxassetid://18429138544"]="rbxassetid://84897543898396",["rbxassetid://71387264231358"]="rbxassetid://84897543898396",["rbxassetid://82249006680828"]="rbxassetid://84897543898396",["rbxassetid://98081733365737"]="rbxassetid://84897543898396"},
["Dynamite Gun"] = {["rbxassetid://13169270306"]="rbxassetid://18763764974",["rbxassetid://13245117413"]="rbxassetid://18763764974",["rbxassetid://13245117702"]="rbxassetid://18763764974",["rbxassetid://73229971227760"]="rbxassetid://18763764974"},
["Electro Rifle"] = {["rbxassetid://110122962237431"]="rbxassetid://17803231833",["rbxassetid://124080696816628"]="rbxassetid://17803231833",["rbxassetid://13087362838"]="rbxassetid://17803231833",["rbxassetid://13158735106"]="rbxassetid://17803231630",["rbxassetid://13160326139"]="rbxassetid://17803231630",["rbxassetid://13236549929"]="rbxassetid://17803231630",["rbxassetid://13236549962"]="rbxassetid://17803231630",["rbxassetid://13455395017"]="rbxassetid://17803231630",["rbxassetid://18763517194"]="rbxassetid://17803231833",["rbxassetid://90757583550672"]="rbxassetid://17803231833",["rbxassetid://96253147006478"]="rbxassetid://17803231630"},
["Electro Uzi"] = {["rbxassetid://102804344908530"]="rbxassetid://16397424081",["rbxassetid://108887853497578"]="rbxassetid://16397424081",["rbxassetid://110122962237431"]="rbxassetid://17803231630",["rbxassetid://129694620679651"]="rbxassetid://16397424081",["rbxassetid://13158330383"]="rbxassetid://17803231630",["rbxassetid://13158330555"]="rbxassetid://17803231630",["rbxassetid://13158330666"]="rbxassetid://17803231630",["rbxassetid://13158735106"]="rbxassetid://17803231630",["rbxassetid://13456860578"]="rbxassetid://17803231630",["rbxassetid://14241444681"]="rbxassetid://17803231630",["rbxassetid://16526184265"]="rbxassetid://16397424081",["rbxassetid://16526184479"]="rbxassetid://16397424081",["rbxassetid://16526184730"]="rbxassetid://16397424081",["rbxassetid://16526185100"]="rbxassetid://16397424081",["rbxassetid://17247776127"]="rbxassetid://17803231630",["rbxassetid://17812566584"]="rbxassetid://16397424081",["rbxassetid://17812566721"]="rbxassetid://16397424081",["rbxassetid://76983701785959"]="rbxassetid://16397424081",["rbxassetid://82721606455832"]="rbxassetid://17803231630",["rbxassetid://84163808107137"]="rbxassetid://17803231630",["rbxassetid://88544860864804"]="rbxassetid://16397424081",["rbxassetid://90757583550672"]="rbxassetid://16397424081",["rbxassetid://96253147006478"]="rbxassetid://17803231630"},
["Event Horizon"] = {["rbxassetid://100664516053133"]="rbxassetid://17672502716",["rbxassetid://110122962237431"]="rbxassetid://113227486192611",["rbxassetid://115657023572170"]="rbxassetid://124463680760542",["rbxassetid://13158735106"]="rbxassetid://113227486192611",["rbxassetid://13236549929"]="rbxassetid://113227486192611",["rbxassetid://13236549962"]="rbxassetid://113227486192611",["rbxassetid://13270206087"]="rbxassetid://124463680760542",["rbxassetid://13270206222"]="rbxassetid://124463680760542",["rbxassetid://13455229044"]="rbxassetid://113227486192611",["rbxassetid://13455229188"]="rbxassetid://113227486192611",["rbxassetid://13455394948"]="rbxassetid://17672502716",["rbxassetid://13455395017"]="rbxassetid://113227486192611",["rbxassetid://13455395090"]="rbxassetid://124463680760542",["rbxassetid://18763645923"]="rbxassetid://17672502716",["rbxassetid://71304774842482"]="rbxassetid://124463680760542",["rbxassetid://96253147006478"]="rbxassetid://113227486192611"},
["FAMAS"] = {["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://90757583550672"]="rbxassetid://17662574783"},
["Fists of Hurt"] = {["rbxassetid://13160489311"]="rbxassetid://88497957004619"},
["Frostbite Bow"] = {["rbxassetid://110122962237431"]="rbxassetid://18429138544",["rbxassetid://122106573913822"]="rbxassetid://18429138544",["rbxassetid://123635502936633"]="rbxassetid://18429138544",["rbxassetid://13677205578"]="rbxassetid://18429138544",["rbxassetid://13677205647"]="rbxassetid://18429138544",["rbxassetid://13677205703"]="rbxassetid://18429138544",["rbxassetid://13682183816"]="rbxassetid://18429138544",["rbxassetid://17803360572"]="rbxassetid://18429138544",["rbxassetid://71387264231358"]="rbxassetid://18429138544",["rbxassetid://82249006680828"]="rbxassetid://18429138544",["rbxassetid://84897543898396"]="rbxassetid://18429138544",["rbxassetid://98081733365737"]="rbxassetid://18429138544"},
["Frostbite Crossbow"] = {["rbxassetid://100943371677728"]="rbxassetid://101059713611983",["rbxassetid://82715240396507"]="rbxassetid://101059713611983"},
["Gearnade Launcher"] = {["rbxassetid://13158735106"]="rbxassetid://117326796133738",["rbxassetid://17274369044"]="rbxassetid://117326796133738",["rbxassetid://17274387490"]="rbxassetid://117326796133738",["rbxassetid://17274798198"]="rbxassetid://132649078390815",["rbxassetid://17274798406"]="rbxassetid://132649078390815",["rbxassetid://17274798538"]="rbxassetid://132649078390815",["rbxassetid://17274798693"]="rbxassetid://132649078390815",["rbxassetid://17803360572"]="rbxassetid://117326796133738",["rbxassetid://18429138544"]="rbxassetid://117326796133738"},
["Gingerbread AUG"] = {["rbxassetid://100664516053133"]="rbxassetid://13455395017",["rbxassetid://106994976644858"]="rbxassetid://13455395017",["rbxassetid://108380234827963"]="rbxassetid://13455395017",["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://112097244349559"]="rbxassetid://13455395017",["rbxassetid://114436319908436"]="rbxassetid://13455395017",["rbxassetid://117326796133738"]="rbxassetid://13455395017",["rbxassetid://11956590"]="rbxassetid://13455395017",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://128809359344035"]="rbxassetid://13455395017",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://13158330555"]="rbxassetid://13455395017",["rbxassetid://13158735106"]="rbxassetid://13455395017",["rbxassetid://13160326139"]="rbxassetid://13455395017",["rbxassetid://13160400937"]="rbxassetid://13455395017",["rbxassetid://13169152449"]="rbxassetid://13455395017",["rbxassetid://13236026280"]="rbxassetid://13455395017",["rbxassetid://13236549929"]="rbxassetid://13455395017",["rbxassetid://13236549962"]="rbxassetid://13455395017",["rbxassetid://132926867312544"]="rbxassetid://13455395017",["rbxassetid://134472359434980"]="rbxassetid://13455395017",["rbxassetid://13456860578"]="rbxassetid://13455395017",["rbxassetid://13483008798"]="rbxassetid://13455395017",["rbxassetid://13515046921"]="rbxassetid://13455395017",["rbxassetid://13515046988"]="rbxassetid://13455395017",["rbxassetid://137232955524669"]="rbxassetid://13455395017",["rbxassetid://137300623286123"]="rbxassetid://13455395017",["rbxassetid://137900058595276"]="rbxassetid://13455395017",["rbxassetid://139955889483895"]="rbxassetid://13455395017",["rbxassetid://14000093824"]="rbxassetid://13455395017",["rbxassetid://14241444681"]="rbxassetid://13455395017",["rbxassetid://17123622923"]="rbxassetid://13455395017",["rbxassetid://17274387490"]="rbxassetid://13455395017",["rbxassetid://17640978498"]="rbxassetid://13455395017",["rbxassetid://17803360572"]="rbxassetid://13455395017",["rbxassetid://18128896162"]="rbxassetid://13455395017",["rbxassetid://18128949754"]="rbxassetid://13455395017",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://71387264231358"]="rbxassetid://13455395017",["rbxassetid://73931497990415"]="rbxassetid://13455395017",["rbxassetid://75549206431714"]="rbxassetid://13455395017",["rbxassetid://84163808107137"]="rbxassetid://13455395017",["rbxassetid://90757583550672"]="rbxassetid://17662574783",["rbxassetid://93178963908825"]="rbxassetid://13455395017",["rbxassetid://96253147006478"]="rbxassetid://13455395017"},
["Gumball Handgun"] = {["rbxassetid://13110197220"]="rbxassetid://76996559479025",["rbxassetid://13110197302"]="rbxassetid://76996559479025",["rbxassetid://13158330479"]="rbxassetid://76996559479025"},
["Gunsaw"] = {["rbxassetid://107111416940276"]="rbxassetid://13682898881",["rbxassetid://107162559513589"]="rbxassetid://13682898881",["rbxassetid://126378664369064"]="rbxassetid://13682898881",["rbxassetid://132970131270232"]="rbxassetid://13682898881",["rbxassetid://135836738518083"]="rbxassetid://13682898881",["rbxassetid://17803360572"]="rbxassetid://13682898881",["rbxassetid://77437496658218"]="rbxassetid://13682898881",["rbxassetid://77594993345414"]="rbxassetid://13682898881",["rbxassetid://81817529955162"]="rbxassetid://13682898881",["rbxassetid://82009091681573"]="rbxassetid://13682898881"},
["Handsaws"] = {["rbxassetid://13645858825"]="rbxassetid://13645858977"},
["Harp"] = {["rbxassetid://127610347219152"]="rbxassetid://106485622539697",["rbxassetid://13682532502"]="rbxassetid://106485622539697",["rbxassetid://76155503538875"]="rbxassetid://106485622539697",["rbxassetid://77840212230515"]="rbxassetid://106485622539697"},
["Harpoon Crossbow"] = {["rbxassetid://100943371677728"]="rbxassetid://89290993529500",["rbxassetid://127610347219152"]="rbxassetid://13456746131",["rbxassetid://13682532502"]="rbxassetid://13456746131",["rbxassetid://76155503538875"]="rbxassetid://13456746131",["rbxassetid://77840212230515"]="rbxassetid://13456746131",["rbxassetid://82715240396507"]="rbxassetid://89290993529500"},
["Hyper Gunblade"] = {["rbxassetid://96886470957330"]="rbxassetid://82156077357708"},
["Hyper Shotgun"] = {["rbxassetid://108887853497578"]="rbxassetid://18763645670",["rbxassetid://115657023572170"]="rbxassetid://18763645670",["rbxassetid://117893025759206"]="rbxassetid://18763645670",["rbxassetid://13479562219"]="rbxassetid://18763645670",["rbxassetid://13515046921"]="rbxassetid://18763645670",["rbxassetid://13515046988"]="rbxassetid://18763645670",["rbxassetid://13531443905"]="rbxassetid://18763645670",["rbxassetid://83828319245396"]="rbxassetid://18763645670",["rbxassetid://96253147006478"]="rbxassetid://18763645670"},
["Hyper Sniper"] = {["rbxassetid://115657023572170"]="rbxassetid://18763645923",["rbxassetid://13270206087"]="rbxassetid://18763645923",["rbxassetid://13270206222"]="rbxassetid://18763645923",["rbxassetid://13455394948"]="rbxassetid://18763645923",["rbxassetid://13455395017"]="rbxassetid://18763645923",["rbxassetid://13455395090"]="rbxassetid://18763645923",["rbxassetid://71304774842482"]="rbxassetid://18763645923"},
["Jingle Grenade"] = {["rbxassetid://14522129645"]="rbxassetid://121357741790029"},
["Key Bow"] = {["rbxassetid://110122962237431"]="rbxassetid://100664516053133",["rbxassetid://122106573913822"]="rbxassetid://100664516053133",["rbxassetid://123635502936633"]="rbxassetid://100664516053133",["rbxassetid://127610347219152"]="rbxassetid://96253147006478",["rbxassetid://13677205578"]="rbxassetid://100664516053133",["rbxassetid://13677205647"]="rbxassetid://100664516053133",["rbxassetid://13677205703"]="rbxassetid://100664516053133",["rbxassetid://13682183816"]="rbxassetid://100664516053133",["rbxassetid://13682532502"]="rbxassetid://96253147006478",["rbxassetid://17803360572"]="rbxassetid://100664516053133",["rbxassetid://18429138544"]="rbxassetid://100664516053133",["rbxassetid://71387264231358"]="rbxassetid://100664516053133",["rbxassetid://76155503538875"]="rbxassetid://96253147006478",["rbxassetid://77840212230515"]="rbxassetid://96253147006478",["rbxassetid://82249006680828"]="rbxassetid://100664516053133",["rbxassetid://84897543898396"]="rbxassetid://100664516053133",["rbxassetid://98081733365737"]="rbxassetid://100664516053133"},
["Key Spray"] = {["rbxassetid://110122962237431"]="rbxassetid://100664516053133",["rbxassetid://123443443495942"]="rbxassetid://100664516053133",["rbxassetid://130113370"]="rbxassetid://100664516053133",["rbxassetid://13158330383"]="rbxassetid://100664516053133",["rbxassetid://13158735106"]="rbxassetid://100664516053133",["rbxassetid://13235979356"]="rbxassetid://100664516053133",["rbxassetid://13236026280"]="rbxassetid://100664516053133",["rbxassetid://13456860578"]="rbxassetid://100664516053133",["rbxassetid://13483008798"]="rbxassetid://100664516053133",["rbxassetid://134917124344503"]="rbxassetid://100664516053133",["rbxassetid://14240943641"]="rbxassetid://100664516053133",["rbxassetid://14240944327"]="rbxassetid://100664516053133",["rbxassetid://14240944488"]="rbxassetid://100664516053133",["rbxassetid://14241444681"]="rbxassetid://100664516053133",["rbxassetid://14417088974"]="rbxassetid://100664516053133",["rbxassetid://14417089046"]="rbxassetid://100664516053133",["rbxassetid://14417089152"]="rbxassetid://100664516053133",["rbxassetid://14417089307"]="rbxassetid://100664516053133",["rbxassetid://17803360572"]="rbxassetid://100664516053133",["rbxassetid://71387264231358"]="rbxassetid://100664516053133",["rbxassetid://75549206431714"]="rbxassetid://100664516053133",["rbxassetid://90757583550672"]="rbxassetid://100664516053133"},
["Keylisong"] = {["rbxassetid://100664516053133"]="rbxassetid://108891371725091",["rbxassetid://101733853413710"]="rbxassetid://100664516053133",["rbxassetid://106994976644858"]="rbxassetid://108891371725091",["rbxassetid://108380234827963"]="rbxassetid://108891371725091",["rbxassetid://108891371725091"]="rbxassetid://100664516053133",["rbxassetid://110122962237431"]="rbxassetid://108891371725091",["rbxassetid://112097244349559"]="rbxassetid://108891371725091",["rbxassetid://114436319908436"]="rbxassetid://108891371725091",["rbxassetid://117326796133738"]="rbxassetid://108891371725091",["rbxassetid://11956590"]="rbxassetid://108891371725091",["rbxassetid://12222208"]="rbxassetid://100664516053133",["rbxassetid://128809359344035"]="rbxassetid://108891371725091",["rbxassetid://130523978733899"]="rbxassetid://100664516053133",["rbxassetid://13158330555"]="rbxassetid://108891371725091",["rbxassetid://13158735106"]="rbxassetid://108891371725091",["rbxassetid://13160326139"]="rbxassetid://108891371725091",["rbxassetid://13160400937"]="rbxassetid://108891371725091",["rbxassetid://13169152449"]="rbxassetid://108891371725091",["rbxassetid://13236026280"]="rbxassetid://108891371725091",["rbxassetid://13236549929"]="rbxassetid://108891371725091",["rbxassetid://13236549962"]="rbxassetid://108891371725091",["rbxassetid://132926867312544"]="rbxassetid://108891371725091",["rbxassetid://133090858473825"]="rbxassetid://100664516053133",["rbxassetid://134472359434980"]="rbxassetid://108891371725091",["rbxassetid://13455395017"]="rbxassetid://108891371725091",["rbxassetid://13455968789"]="rbxassetid://100664516053133",["rbxassetid://13456860578"]="rbxassetid://108891371725091",["rbxassetid://13483008798"]="rbxassetid://108891371725091",["rbxassetid://13515046921"]="rbxassetid://108891371725091",["rbxassetid://13515046988"]="rbxassetid://108891371725091",["rbxassetid://137232955524669"]="rbxassetid://108891371725091",["rbxassetid://137300623286123"]="rbxassetid://108891371725091",["rbxassetid://137900058595276"]="rbxassetid://108891371725091",["rbxassetid://139955889483895"]="rbxassetid://108891371725091",["rbxassetid://14000023392"]="rbxassetid://100664516053133",["rbxassetid://14000023581"]="rbxassetid://100664516053133",["rbxassetid://14000093824"]="rbxassetid://108891371725091",["rbxassetid://14241444681"]="rbxassetid://108891371725091",["rbxassetid://14427782350"]="rbxassetid://100664516053133",["rbxassetid://14427935597"]="rbxassetid://100664516053133",["rbxassetid://17092564046"]="rbxassetid://100664516053133",["rbxassetid://17123622923"]="rbxassetid://108891371725091",["rbxassetid://17274387490"]="rbxassetid://108891371725091",["rbxassetid://17640978271"]="rbxassetid://100664516053133",["rbxassetid://17640978498"]="rbxassetid://108891371725091",["rbxassetid://17803360572"]="rbxassetid://108891371725091",["rbxassetid://18128896162"]="rbxassetid://108891371725091",["rbxassetid://18128949754"]="rbxassetid://108891371725091",["rbxassetid://71387264231358"]="rbxassetid://108891371725091",["rbxassetid://73931497990415"]="rbxassetid://108891371725091",["rbxassetid://75549206431714"]="rbxassetid://108891371725091",["rbxassetid://76064160033456"]="rbxassetid://100664516053133",["rbxassetid://82637145735352"]="rbxassetid://100664516053133",["rbxassetid://84163808107137"]="rbxassetid://108891371725091",["rbxassetid://89056031983351"]="rbxassetid://100664516053133",["rbxassetid://90757583550672"]="rbxassetid://100664516053133",["rbxassetid://93178963908825"]="rbxassetid://108891371725091",["rbxassetid://96253147006478"]="rbxassetid://108891371725091"},
["Keynade"] = {["rbxassetid://100664516053133"]="rbxassetid://96253147006478",["rbxassetid://106994976644858"]="rbxassetid://96253147006478",["rbxassetid://108380234827963"]="rbxassetid://96253147006478",["rbxassetid://110122962237431"]="rbxassetid://96253147006478",["rbxassetid://112097244349559"]="rbxassetid://96253147006478",["rbxassetid://114436319908436"]="rbxassetid://96253147006478",["rbxassetid://117326796133738"]="rbxassetid://96253147006478",["rbxassetid://11956590"]="rbxassetid://96253147006478",["rbxassetid://128809359344035"]="rbxassetid://96253147006478",["rbxassetid://13158330555"]="rbxassetid://96253147006478",["rbxassetid://13158735106"]="rbxassetid://96253147006478",["rbxassetid://13160326139"]="rbxassetid://96253147006478",["rbxassetid://13160400937"]="rbxassetid://96253147006478",["rbxassetid://13169152449"]="rbxassetid://96253147006478",["rbxassetid://13236026280"]="rbxassetid://96253147006478",["rbxassetid://13236549929"]="rbxassetid://96253147006478",["rbxassetid://13236549962"]="rbxassetid://96253147006478",["rbxassetid://132926867312544"]="rbxassetid://96253147006478",["rbxassetid://134472359434980"]="rbxassetid://96253147006478",["rbxassetid://13455395017"]="rbxassetid://96253147006478",["rbxassetid://13456860578"]="rbxassetid://96253147006478",["rbxassetid://13483008798"]="rbxassetid://96253147006478",["rbxassetid://13515046921"]="rbxassetid://96253147006478",["rbxassetid://13515046988"]="rbxassetid://96253147006478",["rbxassetid://137232955524669"]="rbxassetid://96253147006478",["rbxassetid://137300623286123"]="rbxassetid://96253147006478",["rbxassetid://137900058595276"]="rbxassetid://96253147006478",["rbxassetid://139955889483895"]="rbxassetid://96253147006478",["rbxassetid://14000093824"]="rbxassetid://96253147006478",["rbxassetid://14241444681"]="rbxassetid://96253147006478",["rbxassetid://14522129645"]="rbxassetid://73396885066556",["rbxassetid://17123622923"]="rbxassetid://96253147006478",["rbxassetid://17274387490"]="rbxassetid://96253147006478",["rbxassetid://17640978498"]="rbxassetid://96253147006478",["rbxassetid://17803360572"]="rbxassetid://96253147006478",["rbxassetid://18128896162"]="rbxassetid://96253147006478",["rbxassetid://18128949754"]="rbxassetid://96253147006478",["rbxassetid://71387264231358"]="rbxassetid://96253147006478",["rbxassetid://73931497990415"]="rbxassetid://96253147006478",["rbxassetid://75549206431714"]="rbxassetid://96253147006478",["rbxassetid://84163808107137"]="rbxassetid://96253147006478",["rbxassetid://93178963908825"]="rbxassetid://96253147006478"},
["Keynais"] = {["rbxassetid://101759165907297"]="rbxassetid://93178963908825",["rbxassetid://114331009697074"]="rbxassetid://93178963908825",["rbxassetid://122106573913822"]="rbxassetid://93178963908825",["rbxassetid://127456921117902"]="rbxassetid://93178963908825",["rbxassetid://130725438600072"]="rbxassetid://93178963908825",["rbxassetid://76357741438822"]="rbxassetid://93178963908825",["rbxassetid://80622617308150"]="rbxassetid://93178963908825",["rbxassetid://92418233748009"]="rbxassetid://93178963908825",["rbxassetid://99837158417289"]="rbxassetid://96253147006478"},
["Keyper"] = {["rbxassetid://115657023572170"]="rbxassetid://100664516053133",["rbxassetid://13270206087"]="rbxassetid://115657023572170",["rbxassetid://13270206222"]="rbxassetid://115657023572170",["rbxassetid://13455229044"]="rbxassetid://100664516053133",["rbxassetid://13455229188"]="rbxassetid://100664516053133",["rbxassetid://13455394948"]="rbxassetid://100664516053133",["rbxassetid://13455395017"]="rbxassetid://115657023572170",["rbxassetid://13455395090"]="rbxassetid://115657023572170",["rbxassetid://18763645923"]="rbxassetid://100664516053133",["rbxassetid://71304774842482"]="rbxassetid://115657023572170"},
["Keyrambit"] = {["rbxassetid://101733853413710"]="rbxassetid://100664516053133",["rbxassetid://108891371725091"]="rbxassetid://100664516053133",["rbxassetid://110122962237431"]="rbxassetid://100664516053133",["rbxassetid://12222208"]="rbxassetid://100664516053133",["rbxassetid://130523978733899"]="rbxassetid://100664516053133",["rbxassetid://13160326139"]="rbxassetid://100664516053133",["rbxassetid://133090858473825"]="rbxassetid://100664516053133",["rbxassetid://13455968789"]="rbxassetid://100664516053133",["rbxassetid://13456860578"]="rbxassetid://100664516053133",["rbxassetid://14000023392"]="rbxassetid://100664516053133",["rbxassetid://14000023581"]="rbxassetid://100664516053133",["rbxassetid://14427782350"]="rbxassetid://100664516053133",["rbxassetid://14427935597"]="rbxassetid://100664516053133",["rbxassetid://17092564046"]="rbxassetid://100664516053133",["rbxassetid://17640978271"]="rbxassetid://100664516053133",["rbxassetid://17640978498"]="rbxassetid://100664516053133",["rbxassetid://17803360572"]="rbxassetid://100664516053133",["rbxassetid://71387264231358"]="rbxassetid://100664516053133",["rbxassetid://76064160033456"]="rbxassetid://100664516053133",["rbxassetid://82637145735352"]="rbxassetid://100664516053133",["rbxassetid://89056031983351"]="rbxassetid://100664516053133",["rbxassetid://90757583550672"]="rbxassetid://100664516053133",["rbxassetid://96253147006478"]="rbxassetid://100664516053133"},
["Keyst Rifle"] = {["rbxassetid://13158735106"]="rbxassetid://110122962237431",["rbxassetid://13160326139"]="rbxassetid://110122962237431",["rbxassetid://13236549929"]="rbxassetid://110122962237431",["rbxassetid://13236549962"]="rbxassetid://110122962237431",["rbxassetid://13455395017"]="rbxassetid://110122962237431",["rbxassetid://96253147006478"]="rbxassetid://110122962237431"},
["Keytana"] = {["rbxassetid://100664516053133"]="rbxassetid://96253147006478",["rbxassetid://101733853413710"]="rbxassetid://100664516053133",["rbxassetid://106994976644858"]="rbxassetid://96253147006478",["rbxassetid://108380234827963"]="rbxassetid://96253147006478",["rbxassetid://108891371725091"]="rbxassetid://100664516053133",["rbxassetid://110122962237431"]="rbxassetid://96253147006478",["rbxassetid://112097244349559"]="rbxassetid://96253147006478",["rbxassetid://114436319908436"]="rbxassetid://96253147006478",["rbxassetid://117326796133738"]="rbxassetid://96253147006478",["rbxassetid://11956590"]="rbxassetid://96253147006478",["rbxassetid://12222208"]="rbxassetid://100664516053133",["rbxassetid://128809359344035"]="rbxassetid://96253147006478",["rbxassetid://130523978733899"]="rbxassetid://100664516053133",["rbxassetid://13158330555"]="rbxassetid://96253147006478",["rbxassetid://13158735106"]="rbxassetid://96253147006478",["rbxassetid://13160326139"]="rbxassetid://96253147006478",["rbxassetid://13160400937"]="rbxassetid://96253147006478",["rbxassetid://13169152449"]="rbxassetid://96253147006478",["rbxassetid://13236026280"]="rbxassetid://96253147006478",["rbxassetid://13236549929"]="rbxassetid://96253147006478",["rbxassetid://13236549962"]="rbxassetid://96253147006478",["rbxassetid://132926867312544"]="rbxassetid://96253147006478",["rbxassetid://133090858473825"]="rbxassetid://100664516053133",["rbxassetid://134472359434980"]="rbxassetid://96253147006478",["rbxassetid://13455395017"]="rbxassetid://96253147006478",["rbxassetid://13455968789"]="rbxassetid://100664516053133",["rbxassetid://13456860578"]="rbxassetid://96253147006478",["rbxassetid://13483008798"]="rbxassetid://96253147006478",["rbxassetid://13515046921"]="rbxassetid://96253147006478",["rbxassetid://13515046988"]="rbxassetid://96253147006478",["rbxassetid://137232955524669"]="rbxassetid://96253147006478",["rbxassetid://137300623286123"]="rbxassetid://96253147006478",["rbxassetid://137900058595276"]="rbxassetid://96253147006478",["rbxassetid://139955889483895"]="rbxassetid://96253147006478",["rbxassetid://14000023392"]="rbxassetid://100664516053133",["rbxassetid://14000023581"]="rbxassetid://100664516053133",["rbxassetid://14000093824"]="rbxassetid://96253147006478",["rbxassetid://14241444681"]="rbxassetid://96253147006478",["rbxassetid://14427782350"]="rbxassetid://100664516053133",["rbxassetid://14427935597"]="rbxassetid://100664516053133",["rbxassetid://17092564046"]="rbxassetid://100664516053133",["rbxassetid://17123622923"]="rbxassetid://96253147006478",["rbxassetid://17274387490"]="rbxassetid://96253147006478",["rbxassetid://17640978271"]="rbxassetid://100664516053133",["rbxassetid://17640978498"]="rbxassetid://96253147006478",["rbxassetid://17803360572"]="rbxassetid://96253147006478",["rbxassetid://18128896162"]="rbxassetid://96253147006478",["rbxassetid://18128949754"]="rbxassetid://96253147006478",["rbxassetid://71387264231358"]="rbxassetid://96253147006478",["rbxassetid://73931497990415"]="rbxassetid://96253147006478",["rbxassetid://75549206431714"]="rbxassetid://96253147006478",["rbxassetid://76064160033456"]="rbxassetid://100664516053133",["rbxassetid://82637145735352"]="rbxassetid://100664516053133",["rbxassetid://84163808107137"]="rbxassetid://96253147006478",["rbxassetid://89056031983351"]="rbxassetid://100664516053133",["rbxassetid://90757583550672"]="rbxassetid://100664516053133",["rbxassetid://93178963908825"]="rbxassetid://96253147006478",["rbxassetid://96253147006478"]="rbxassetid://100664516053133"},
["Keythrower"] = {["rbxassetid://100664516053133"]="rbxassetid://96253147006478",["rbxassetid://106994976644858"]="rbxassetid://96253147006478",["rbxassetid://108380234827963"]="rbxassetid://96253147006478",["rbxassetid://110122962237431"]="rbxassetid://96253147006478",["rbxassetid://112097244349559"]="rbxassetid://96253147006478",["rbxassetid://114436319908436"]="rbxassetid://96253147006478",["rbxassetid://117326796133738"]="rbxassetid://96253147006478",["rbxassetid://11956590"]="rbxassetid://96253147006478",["rbxassetid://128809359344035"]="rbxassetid://96253147006478",["rbxassetid://13158330555"]="rbxassetid://96253147006478",["rbxassetid://13158735106"]="rbxassetid://96253147006478",["rbxassetid://13160326139"]="rbxassetid://96253147006478",["rbxassetid://13160400937"]="rbxassetid://96253147006478",["rbxassetid://13169152449"]="rbxassetid://96253147006478",["rbxassetid://13236026280"]="rbxassetid://96253147006478",["rbxassetid://13236549929"]="rbxassetid://96253147006478",["rbxassetid://13236549962"]="rbxassetid://96253147006478",["rbxassetid://132926867312544"]="rbxassetid://96253147006478",["rbxassetid://134472359434980"]="rbxassetid://96253147006478",["rbxassetid://13455395017"]="rbxassetid://96253147006478",["rbxassetid://13456860578"]="rbxassetid://96253147006478",["rbxassetid://13483008798"]="rbxassetid://96253147006478",["rbxassetid://13515046921"]="rbxassetid://96253147006478",["rbxassetid://13515046988"]="rbxassetid://96253147006478",["rbxassetid://137232955524669"]="rbxassetid://96253147006478",["rbxassetid://137300623286123"]="rbxassetid://96253147006478",["rbxassetid://137900058595276"]="rbxassetid://96253147006478",["rbxassetid://139955889483895"]="rbxassetid://96253147006478",["rbxassetid://14000093824"]="rbxassetid://96253147006478",["rbxassetid://14241444681"]="rbxassetid://96253147006478",["rbxassetid://17123622923"]="rbxassetid://96253147006478",["rbxassetid://17274387490"]="rbxassetid://96253147006478",["rbxassetid://17640978498"]="rbxassetid://96253147006478",["rbxassetid://17803360572"]="rbxassetid://96253147006478",["rbxassetid://18128896162"]="rbxassetid://96253147006478",["rbxassetid://18128949754"]="rbxassetid://96253147006478",["rbxassetid://71387264231358"]="rbxassetid://96253147006478",["rbxassetid://73931497990415"]="rbxassetid://96253147006478",["rbxassetid://75549206431714"]="rbxassetid://96253147006478",["rbxassetid://84163808107137"]="rbxassetid://96253147006478",["rbxassetid://93178963908825"]="rbxassetid://96253147006478"},
["Keyvolver"] = {["rbxassetid://110122962237431"]="rbxassetid://100664516053133",["rbxassetid://123443443495942"]="rbxassetid://100664516053133",["rbxassetid://130113370"]="rbxassetid://100664516053133",["rbxassetid://13158330383"]="rbxassetid://100664516053133",["rbxassetid://13158735106"]="rbxassetid://100664516053133",["rbxassetid://13235979356"]="rbxassetid://100664516053133",["rbxassetid://13236026280"]="rbxassetid://100664516053133",["rbxassetid://13456860578"]="rbxassetid://100664516053133",["rbxassetid://13483008798"]="rbxassetid://100664516053133",["rbxassetid://134917124344503"]="rbxassetid://100664516053133",["rbxassetid://14240943641"]="rbxassetid://100664516053133",["rbxassetid://14240944327"]="rbxassetid://100664516053133",["rbxassetid://14240944488"]="rbxassetid://100664516053133",["rbxassetid://14241444681"]="rbxassetid://100664516053133",["rbxassetid://14417088974"]="rbxassetid://100664516053133",["rbxassetid://14417089046"]="rbxassetid://100664516053133",["rbxassetid://14417089152"]="rbxassetid://100664516053133",["rbxassetid://14417089307"]="rbxassetid://100664516053133",["rbxassetid://17803360572"]="rbxassetid://100664516053133",["rbxassetid://71387264231358"]="rbxassetid://100664516053133",["rbxassetid://75549206431714"]="rbxassetid://100664516053133",["rbxassetid://90757583550672"]="rbxassetid://100664516053133"},
["Keyzi"] = {["rbxassetid://110122962237431"]="rbxassetid://13483008798",["rbxassetid://13158330383"]="rbxassetid://13483008798",["rbxassetid://13158330555"]="rbxassetid://13483008798",["rbxassetid://13158330666"]="rbxassetid://13483008798",["rbxassetid://13158735106"]="rbxassetid://13483008798",["rbxassetid://13456860578"]="rbxassetid://13483008798",["rbxassetid://14241444681"]="rbxassetid://13483008798",["rbxassetid://17247776127"]="rbxassetid://13483008798",["rbxassetid://82721606455832"]="rbxassetid://13483008798",["rbxassetid://84163808107137"]="rbxassetid://13483008798",["rbxassetid://96253147006478"]="rbxassetid://13483008798"},
["Keythe"] = {["rbxassetid://101947200611951"]="rbxassetid://135836738518083",["rbxassetid://112262347612742"]="rbxassetid://135836738518083",["rbxassetid://118748685078128"]="rbxassetid://135836738518083",["rbxassetid://122106573913822"]="rbxassetid://135836738518083",["rbxassetid://14111617269"]="rbxassetid://135836738518083",["rbxassetid://14111617408"]="rbxassetid://135836738518083",["rbxassetid://75229437160477"]="rbxassetid://135836738518083",["rbxassetid://88326684922300"]="rbxassetid://135836738518083"},
["Lava Lamp"] = {["rbxassetid://14812965418"]="rbxassetid://126501912769166"},
["Lightning Bolt"] = {["rbxassetid://118748685078128"]="rbxassetid://130523978733899",["rbxassetid://12222208"]="rbxassetid://101419032712753",["rbxassetid://125777995479531"]="rbxassetid://101419032712753",["rbxassetid://13160326139"]="rbxassetid://130523978733899",["rbxassetid://133090858473825"]="rbxassetid://130523978733899",["rbxassetid://13455968853"]="rbxassetid://130523978733899",["rbxassetid://14000023392"]="rbxassetid://130523978733899",["rbxassetid://14000023581"]="rbxassetid://130523978733899",["rbxassetid://14427782350"]="rbxassetid://130523978733899",["rbxassetid://14427935597"]="rbxassetid://130523978733899",["rbxassetid://14798337918"]="rbxassetid://101419032712753",["rbxassetid://71387264231358"]="rbxassetid://130523978733899",["rbxassetid://82637145735352"]="rbxassetid://130523978733899",["rbxassetid://86510987016114"]="rbxassetid://130523978733899",["rbxassetid://89056031983351"]="rbxassetid://130523978733899",["rbxassetid://90757583550672"]="rbxassetid://130523978733899",["rbxassetid://96253147006478"]="rbxassetid://130523978733899"},
["Linked Sword"] = {["rbxassetid://118748685078128"]="rbxassetid://114436319908436",["rbxassetid://13160326139"]="rbxassetid://114436319908436",["rbxassetid://133090858473825"]="rbxassetid://114436319908436",["rbxassetid://13455968853"]="rbxassetid://114436319908436",["rbxassetid://14000023392"]="rbxassetid://114436319908436",["rbxassetid://14000023581"]="rbxassetid://114436319908436",["rbxassetid://14427782350"]="rbxassetid://114436319908436",["rbxassetid://14427935597"]="rbxassetid://114436319908436",["rbxassetid://71387264231358"]="rbxassetid://114436319908436",["rbxassetid://82637145735352"]="rbxassetid://114436319908436",["rbxassetid://86510987016114"]="rbxassetid://114436319908436",["rbxassetid://89056031983351"]="rbxassetid://114436319908436",["rbxassetid://90757583550672"]="rbxassetid://114436319908436",["rbxassetid://96253147006478"]="rbxassetid://114436319908436"},
["Mammoth Horn"] = {["rbxassetid://101461584188367"]="rbxassetid://116889597355364",["rbxassetid://106770345116398"]="rbxassetid://116889597355364",["rbxassetid://73325703605178"]="rbxassetid://116889597355364",["rbxassetid://94406584083681"]="rbxassetid://116889597355364"},
["Medkitty"] = {["rbxassetid://100664516053133"]="rbxassetid://134160823775126",["rbxassetid://106994976644858"]="rbxassetid://134160823775126",["rbxassetid://108380234827963"]="rbxassetid://134160823775126",["rbxassetid://110122962237431"]="rbxassetid://134160823775126",["rbxassetid://112097244349559"]="rbxassetid://134160823775126",["rbxassetid://114436319908436"]="rbxassetid://134160823775126",["rbxassetid://117326796133738"]="rbxassetid://134160823775126",["rbxassetid://11956590"]="rbxassetid://134160823775126",["rbxassetid://120574582651469"]="rbxassetid://128632959026124",["rbxassetid://123443443495942"]="rbxassetid://92941076104902",["rbxassetid://128809359344035"]="rbxassetid://134160823775126",["rbxassetid://130113370"]="rbxassetid://92941076104902",["rbxassetid://13158330383"]="rbxassetid://128632959026124",["rbxassetid://13158330555"]="rbxassetid://134160823775126",["rbxassetid://13158735106"]="rbxassetid://134160823775126",["rbxassetid://13160326139"]="rbxassetid://134160823775126",["rbxassetid://13160400937"]="rbxassetid://134160823775126",["rbxassetid://13169152449"]="rbxassetid://134160823775126",["rbxassetid://13235979356"]="rbxassetid://128632959026124",["rbxassetid://13236026280"]="rbxassetid://128632959026124",["rbxassetid://13236549929"]="rbxassetid://134160823775126",["rbxassetid://13236549962"]="rbxassetid://134160823775126",["rbxassetid://132926867312544"]="rbxassetid://134160823775126",["rbxassetid://134472359434980"]="rbxassetid://134160823775126",["rbxassetid://13455395017"]="rbxassetid://134160823775126",["rbxassetid://13456860532"]="rbxassetid://92941076104902",["rbxassetid://13456860578"]="rbxassetid://92941076104902",["rbxassetid://13483008798"]="rbxassetid://134160823775126",["rbxassetid://134917124344503"]="rbxassetid://92941076104902",["rbxassetid://13505411336"]="rbxassetid://128632959026124",["rbxassetid://13505411414"]="rbxassetid://128632959026124",["rbxassetid://13515046921"]="rbxassetid://134160823775126",["rbxassetid://13515046988"]="rbxassetid://134160823775126",["rbxassetid://137232955524669"]="rbxassetid://134160823775126",["rbxassetid://137300623286123"]="rbxassetid://134160823775126",["rbxassetid://137900058595276"]="rbxassetid://134160823775126",["rbxassetid://139955889483895"]="rbxassetid://134160823775126",["rbxassetid://14000093824"]="rbxassetid://134160823775126",["rbxassetid://14241444681"]="rbxassetid://134160823775126",["rbxassetid://14427935597"]="rbxassetid://92941076104902",["rbxassetid://17092564046"]="rbxassetid://92941076104902",["rbxassetid://17123622923"]="rbxassetid://134160823775126",["rbxassetid://17274387490"]="rbxassetid://134160823775126",["rbxassetid://17640978498"]="rbxassetid://134160823775126",["rbxassetid://17803360572"]="rbxassetid://134160823775126",["rbxassetid://18128896162"]="rbxassetid://134160823775126",["rbxassetid://18128949754"]="rbxassetid://134160823775126",["rbxassetid://71387264231358"]="rbxassetid://134160823775126",["rbxassetid://73931497990415"]="rbxassetid://134160823775126",["rbxassetid://75549206431714"]="rbxassetid://134160823775126",["rbxassetid://76703369839400"]="rbxassetid://128632959026124",["rbxassetid://82721606455832"]="rbxassetid://92941076104902",["rbxassetid://84163808107137"]="rbxassetid://134160823775126",["rbxassetid://90757583550672"]="rbxassetid://92941076104902",["rbxassetid://93178963908825"]="rbxassetid://134160823775126",["rbxassetid://96253147006478"]="rbxassetid://134160823775126",["rbxassetid://97621886814272"]="rbxassetid://128632959026124"},
["Mega Drill"] = {["rbxassetid://13645858825"]="rbxassetid://13645858587",["rbxassetid://13645858977"]="rbxassetid://13645858587"},
["Milk & Cookies"] = {["rbxassetid://100664516053133"]="rbxassetid://78700624599503",["rbxassetid://106994976644858"]="rbxassetid://78700624599503",["rbxassetid://108380234827963"]="rbxassetid://78700624599503",["rbxassetid://110122962237431"]="rbxassetid://78700624599503",["rbxassetid://112097244349559"]="rbxassetid://78700624599503",["rbxassetid://114436319908436"]="rbxassetid://78700624599503",["rbxassetid://117326796133738"]="rbxassetid://78700624599503",["rbxassetid://11956590"]="rbxassetid://78700624599503",["rbxassetid://120574582651469"]="rbxassetid://92914419322840",["rbxassetid://128809359344035"]="rbxassetid://78700624599503",["rbxassetid://13158330383"]="rbxassetid://92914419322840",["rbxassetid://13158330555"]="rbxassetid://78700624599503",["rbxassetid://13158735106"]="rbxassetid://78700624599503",["rbxassetid://13160326139"]="rbxassetid://78700624599503",["rbxassetid://13160400937"]="rbxassetid://78700624599503",["rbxassetid://13169152449"]="rbxassetid://78700624599503",["rbxassetid://13235979356"]="rbxassetid://92914419322840",["rbxassetid://13236026280"]="rbxassetid://92914419322840",["rbxassetid://13236549929"]="rbxassetid://78700624599503",["rbxassetid://13236549962"]="rbxassetid://78700624599503",["rbxassetid://132926867312544"]="rbxassetid://78700624599503",["rbxassetid://134472359434980"]="rbxassetid://78700624599503",["rbxassetid://13455395017"]="rbxassetid://78700624599503",["rbxassetid://13456860578"]="rbxassetid://78700624599503",["rbxassetid://13483008798"]="rbxassetid://78700624599503",["rbxassetid://13505411336"]="rbxassetid://92914419322840",["rbxassetid://13505411414"]="rbxassetid://92914419322840",["rbxassetid://13515046921"]="rbxassetid://78700624599503",["rbxassetid://13515046988"]="rbxassetid://78700624599503",["rbxassetid://137232955524669"]="rbxassetid://78700624599503",["rbxassetid://137300623286123"]="rbxassetid://78700624599503",["rbxassetid://137900058595276"]="rbxassetid://78700624599503",["rbxassetid://139955889483895"]="rbxassetid://78700624599503",["rbxassetid://14000093824"]="rbxassetid://78700624599503",["rbxassetid://14241444681"]="rbxassetid://78700624599503",["rbxassetid://17123622923"]="rbxassetid://78700624599503",["rbxassetid://17274387490"]="rbxassetid://78700624599503",["rbxassetid://17640978498"]="rbxassetid://78700624599503",["rbxassetid://17803360572"]="rbxassetid://78700624599503",["rbxassetid://18128896162"]="rbxassetid://78700624599503",["rbxassetid://18128949754"]="rbxassetid://78700624599503",["rbxassetid://71387264231358"]="rbxassetid://78700624599503",["rbxassetid://73931497990415"]="rbxassetid://78700624599503",["rbxassetid://75549206431714"]="rbxassetid://78700624599503",["rbxassetid://76703369839400"]="rbxassetid://92914419322840",["rbxassetid://84163808107137"]="rbxassetid://78700624599503",["rbxassetid://93178963908825"]="rbxassetid://78700624599503",["rbxassetid://96253147006478"]="rbxassetid://78700624599503",["rbxassetid://97621886814272"]="rbxassetid://92914419322840"},
["Money Gun"] = {["rbxassetid://110122962237431"]="rbxassetid://13236026280",["rbxassetid://13158330383"]="rbxassetid://13236026280",["rbxassetid://13158330555"]="rbxassetid://13236026280",["rbxassetid://13158330666"]="rbxassetid://13236026280",["rbxassetid://13158735106"]="rbxassetid://13236026280",["rbxassetid://13456860578"]="rbxassetid://13236026280",["rbxassetid://14241444681"]="rbxassetid://13236026280",["rbxassetid://17247776127"]="rbxassetid://13236026280",["rbxassetid://82721606455832"]="rbxassetid://13236026280",["rbxassetid://84163808107137"]="rbxassetid://13236026280",["rbxassetid://96253147006478"]="rbxassetid://13236026280"},
["Paper Planes"] = {["rbxassetid://99837158417289"]="rbxassetid://95109725539980"},
["Peppergun"] = {["rbxassetid://100664516053133"]="rbxassetid://13456860578",["rbxassetid://104731232227748"]="rbxassetid://116197718267373",["rbxassetid://110122962237431"]="rbxassetid://13456860578",["rbxassetid://123443443495942"]="rbxassetid://13456860578",["rbxassetid://130113370"]="rbxassetid://13456860578",["rbxassetid://13158330383"]="rbxassetid://13456860578",["rbxassetid://13158330479"]="rbxassetid://116197718267373",["rbxassetid://13158735106"]="rbxassetid://13456860578",["rbxassetid://13235979356"]="rbxassetid://13456860578",["rbxassetid://13236026280"]="rbxassetid://13456860578",["rbxassetid://13483008798"]="rbxassetid://13456860578",["rbxassetid://134917124344503"]="rbxassetid://13456860578",["rbxassetid://14240943641"]="rbxassetid://13456860578",["rbxassetid://14240944327"]="rbxassetid://13456860578",["rbxassetid://14240944488"]="rbxassetid://13456860578",["rbxassetid://14241444681"]="rbxassetid://13456860578",["rbxassetid://14417088974"]="rbxassetid://13456860578",["rbxassetid://14417089046"]="rbxassetid://13456860578",["rbxassetid://14417089152"]="rbxassetid://13456860578",["rbxassetid://14417089307"]="rbxassetid://116197718267373",["rbxassetid://17803360572"]="rbxassetid://13456860578",["rbxassetid://17803630344"]="rbxassetid://116197718267373",["rbxassetid://71387264231358"]="rbxassetid://13456860578",["rbxassetid://75549206431714"]="rbxassetid://13456860578",["rbxassetid://90757583550672"]="rbxassetid://13456860578"},
["Peppermint Sheriff"] = {["rbxassetid://100664516053133"]="rbxassetid://13456860578",["rbxassetid://104731232227748"]="rbxassetid://137835445333923",["rbxassetid://110122962237431"]="rbxassetid://13456860578",["rbxassetid://123443443495942"]="rbxassetid://13456860578",["rbxassetid://130113370"]="rbxassetid://13456860578",["rbxassetid://13158330383"]="rbxassetid://13456860578",["rbxassetid://13158330479"]="rbxassetid://137835445333923",["rbxassetid://13158735106"]="rbxassetid://13456860578",["rbxassetid://13235979356"]="rbxassetid://13456860578",["rbxassetid://13236026280"]="rbxassetid://13456860578",["rbxassetid://13483008798"]="rbxassetid://13456860578",["rbxassetid://134917124344503"]="rbxassetid://13456860578",["rbxassetid://14240943641"]="rbxassetid://13456860578",["rbxassetid://14240944327"]="rbxassetid://13456860578",["rbxassetid://14240944488"]="rbxassetid://13456860578",["rbxassetid://14241444681"]="rbxassetid://13456860578",["rbxassetid://14417088974"]="rbxassetid://13456860578",["rbxassetid://14417089046"]="rbxassetid://13456860578",["rbxassetid://14417089152"]="rbxassetid://13456860578",["rbxassetid://14417089307"]="rbxassetid://137835445333923",["rbxassetid://17803360572"]="rbxassetid://13456860578",["rbxassetid://17803630344"]="rbxassetid://137835445333923",["rbxassetid://71387264231358"]="rbxassetid://13456860578",["rbxassetid://75549206431714"]="rbxassetid://13456860578",["rbxassetid://90757583550672"]="rbxassetid://13456860578"},
["Pixel Burst"] = {["rbxassetid://110122962237431"]="rbxassetid://17650837718",["rbxassetid://124080696816628"]="rbxassetid://17650837718",["rbxassetid://13087362838"]="rbxassetid://17650837718",["rbxassetid://13158735106"]="rbxassetid://17650945056",["rbxassetid://13160326139"]="rbxassetid://17650945056",["rbxassetid://13236549929"]="rbxassetid://17650945056",["rbxassetid://13236549962"]="rbxassetid://17650945056",["rbxassetid://13455395017"]="rbxassetid://17650945056",["rbxassetid://18763517194"]="rbxassetid://17650837718",["rbxassetid://90757583550672"]="rbxassetid://17650837718",["rbxassetid://96253147006478"]="rbxassetid://17650945056"},
["Pixel Crossbow"] = {["rbxassetid://100943371677728"]="rbxassetid://84676580117737",["rbxassetid://127610347219152"]="rbxassetid://17650837861",["rbxassetid://13682532502"]="rbxassetid://17650837861",["rbxassetid://76155503538875"]="rbxassetid://17650837861",["rbxassetid://77840212230515"]="rbxassetid://17650837861",["rbxassetid://82715240396507"]="rbxassetid://84676580117737"},
["Pixel Handgun"] = {["rbxassetid://110122962237431"]="rbxassetid://17650945056",["rbxassetid://13110197220"]="rbxassetid://17650837718",["rbxassetid://13110197302"]="rbxassetid://17650837718",["rbxassetid://13158330383"]="rbxassetid://17650945056",["rbxassetid://13158330479"]="rbxassetid://17650837718",["rbxassetid://13158330555"]="rbxassetid://17650945056",["rbxassetid://13158330666"]="rbxassetid://17650945056",["rbxassetid://13158610792"]="rbxassetid://17650837861",["rbxassetid://13158735106"]="rbxassetid://17650945056",["rbxassetid://13456860578"]="rbxassetid://17650945056",["rbxassetid://13907558634"]="rbxassetid://17650945056",["rbxassetid://13907558696"]="rbxassetid://17650945056",["rbxassetid://14241444681"]="rbxassetid://17650945056",["rbxassetid://17247776127"]="rbxassetid://17650945056",["rbxassetid://17803231630"]="rbxassetid://17650945056",["rbxassetid://17803231954"]="rbxassetid://17650945056",["rbxassetid://76996559479025"]="rbxassetid://17650837718",["rbxassetid://82721606455832"]="rbxassetid://17650945056",["rbxassetid://84163808107137"]="rbxassetid://17650945056",["rbxassetid://96253147006478"]="rbxassetid://17650945056"},
["Pixel Katana"] = {["rbxassetid://101733853413710"]="rbxassetid://17650945056",["rbxassetid://108891371725091"]="rbxassetid://17650945056",["rbxassetid://110122962237431"]="rbxassetid://17650945056",["rbxassetid://118748685078128"]="rbxassetid://106994976644858",["rbxassetid://12222208"]="rbxassetid://17650945056",["rbxassetid://125777995479531"]="rbxassetid://114054077914317",["rbxassetid://130523978733899"]="rbxassetid://17650945056",["rbxassetid://13160326139"]="rbxassetid://106994976644858",["rbxassetid://133090858473825"]="rbxassetid://106994976644858",["rbxassetid://13455968789"]="rbxassetid://17650945056",["rbxassetid://13455968853"]="rbxassetid://106994976644858",["rbxassetid://13456860578"]="rbxassetid://17650945056",["rbxassetid://14000023392"]="rbxassetid://106994976644858",["rbxassetid://14000023581"]="rbxassetid://106994976644858",["rbxassetid://14427782350"]="rbxassetid://106994976644858",["rbxassetid://14427935597"]="rbxassetid://17650945056",["rbxassetid://14798337918"]="rbxassetid://114054077914317",["rbxassetid://17092564046"]="rbxassetid://17650945056",["rbxassetid://17640978271"]="rbxassetid://17650945056",["rbxassetid://17640978498"]="rbxassetid://17650945056",["rbxassetid://17803360572"]="rbxassetid://17650945056",["rbxassetid://71387264231358"]="rbxassetid://106994976644858",["rbxassetid://76064160033456"]="rbxassetid://17650945056",["rbxassetid://82637145735352"]="rbxassetid://106994976644858",["rbxassetid://86510987016114"]="rbxassetid://106994976644858",["rbxassetid://89056031983351"]="rbxassetid://106994976644858",["rbxassetid://90757583550672"]="rbxassetid://106994976644858",["rbxassetid://96253147006478"]="rbxassetid://106994976644858"},
["Pixel Sniper"] = {["rbxassetid://100664516053133"]="rbxassetid://17650837861",["rbxassetid://110122962237431"]="rbxassetid://17650837861",["rbxassetid://115657023572170"]="rbxassetid://17650837718",["rbxassetid://13158735106"]="rbxassetid://17650837861",["rbxassetid://13236549929"]="rbxassetid://17650837861",["rbxassetid://13236549962"]="rbxassetid://17650837861",["rbxassetid://13270206087"]="rbxassetid://17650837718",["rbxassetid://13270206222"]="rbxassetid://17650837718",["rbxassetid://13455229044"]="rbxassetid://17650945056",["rbxassetid://13455229188"]="rbxassetid://17650945056",["rbxassetid://13455394948"]="rbxassetid://17650837861",["rbxassetid://13455395017"]="rbxassetid://17650837861",["rbxassetid://13455395090"]="rbxassetid://17650837718",["rbxassetid://18763645923"]="rbxassetid://17650837861",["rbxassetid://71304774842482"]="rbxassetid://17650837718",["rbxassetid://96253147006478"]="rbxassetid://17650837861"},
["Potion Satchel"] = {["rbxassetid://75265411785539"]="rbxassetid://98591199808287"},
["Repulsor"] = {["rbxassetid://17266070755"]="rbxassetid://85840257279125",["rbxassetid://17266070911"]="rbxassetid://80245415527547",["rbxassetid://17266071099"]="rbxassetid://77653562642556"},
["Rocket Launcher"] = {["rbxassetid://13456746131"]="rbxassetid://13456746075"},
["Saber"] = {["rbxassetid://118748685078128"]="rbxassetid://17640978271",["rbxassetid://12222208"]="rbxassetid://17640978498",["rbxassetid://125777995479531"]="rbxassetid://17640978498",["rbxassetid://13160326139"]="rbxassetid://17640978271",["rbxassetid://133090858473825"]="rbxassetid://17640978271",["rbxassetid://13455968853"]="rbxassetid://17640978271",["rbxassetid://14000023392"]="rbxassetid://17640978271",["rbxassetid://14000023581"]="rbxassetid://17640978498",["rbxassetid://14427782350"]="rbxassetid://17640978271",["rbxassetid://14427935597"]="rbxassetid://17640978271",["rbxassetid://14798337918"]="rbxassetid://17640978498",["rbxassetid://71387264231358"]="rbxassetid://17640978271",["rbxassetid://82637145735352"]="rbxassetid://17640978271",["rbxassetid://86510987016114"]="rbxassetid://17640978271",["rbxassetid://89056031983351"]="rbxassetid://17640978271",["rbxassetid://90757583550672"]="rbxassetid://17640978271",["rbxassetid://96253147006478"]="rbxassetid://17640978271"},
["Sandwich"] = {["rbxassetid://100664516053133"]="rbxassetid://18128895977",["rbxassetid://106994976644858"]="rbxassetid://18128895977",["rbxassetid://108380234827963"]="rbxassetid://18128895977",["rbxassetid://110122962237431"]="rbxassetid://18128895977",["rbxassetid://112097244349559"]="rbxassetid://18128895977",["rbxassetid://114436319908436"]="rbxassetid://18128895977",["rbxassetid://117326796133738"]="rbxassetid://18128895977",["rbxassetid://11956590"]="rbxassetid://18128895977",["rbxassetid://128809359344035"]="rbxassetid://18128895977",["rbxassetid://13158330555"]="rbxassetid://18128895977",["rbxassetid://13158735106"]="rbxassetid://18128895977",["rbxassetid://13160326139"]="rbxassetid://18128895977",["rbxassetid://13160400937"]="rbxassetid://18128895977",["rbxassetid://13169152449"]="rbxassetid://18128895977",["rbxassetid://13236026280"]="rbxassetid://18128895977",["rbxassetid://13236549929"]="rbxassetid://18128895977",["rbxassetid://13236549962"]="rbxassetid://18128895977",["rbxassetid://132926867312544"]="rbxassetid://18128895977",["rbxassetid://134472359434980"]="rbxassetid://18128895977",["rbxassetid://13455395017"]="rbxassetid://18128895977",["rbxassetid://13456860578"]="rbxassetid://18128895977",["rbxassetid://13483008798"]="rbxassetid://18128895977",["rbxassetid://13515046921"]="rbxassetid://18128895977",["rbxassetid://13515046988"]="rbxassetid://18128895977",["rbxassetid://137232955524669"]="rbxassetid://18128895977",["rbxassetid://137300623286123"]="rbxassetid://18128895977",["rbxassetid://137900058595276"]="rbxassetid://18128895977",["rbxassetid://139955889483895"]="rbxassetid://18128895977",["rbxassetid://14000093824"]="rbxassetid://18128895977",["rbxassetid://14241444681"]="rbxassetid://18128895977",["rbxassetid://17123622923"]="rbxassetid://18128895977",["rbxassetid://17274387490"]="rbxassetid://18128895977",["rbxassetid://17640978498"]="rbxassetid://18128895977",["rbxassetid://17803360572"]="rbxassetid://18128895977",["rbxassetid://18128896162"]="rbxassetid://18128895977",["rbxassetid://18128949754"]="rbxassetid://18128895977",["rbxassetid://71387264231358"]="rbxassetid://18128895977",["rbxassetid://73931497990415"]="rbxassetid://18128895977",["rbxassetid://75549206431714"]="rbxassetid://18128895977",["rbxassetid://84163808107137"]="rbxassetid://18128895977",["rbxassetid://93178963908825"]="rbxassetid://18128895977",["rbxassetid://96253147006478"]="rbxassetid://18128895977"},
["Sheriff"] = {["rbxassetid://100664516053133"]="rbxassetid://13456860578",["rbxassetid://104731232227748"]="rbxassetid://137835445333923",["rbxassetid://110122962237431"]="rbxassetid://13456860578",["rbxassetid://123443443495942"]="rbxassetid://13456860578",["rbxassetid://130113370"]="rbxassetid://13456860578",["rbxassetid://13158330383"]="rbxassetid://13456860578",["rbxassetid://13158330479"]="rbxassetid://137835445333923",["rbxassetid://13158735106"]="rbxassetid://13456860578",["rbxassetid://13235979356"]="rbxassetid://13456860578",["rbxassetid://13236026280"]="rbxassetid://13456860578",["rbxassetid://13483008798"]="rbxassetid://13456860578",["rbxassetid://134917124344503"]="rbxassetid://13456860578",["rbxassetid://14240943641"]="rbxassetid://13456860578",["rbxassetid://14240944327"]="rbxassetid://13456860578",["rbxassetid://14240944488"]="rbxassetid://13456860578",["rbxassetid://14241444681"]="rbxassetid://13456860578",["rbxassetid://14417088974"]="rbxassetid://13456860578",["rbxassetid://14417089046"]="rbxassetid://13456860578",["rbxassetid://14417089152"]="rbxassetid://13456860578",["rbxassetid://14417089307"]="rbxassetid://137835445333923",["rbxassetid://17803360572"]="rbxassetid://13456860578",["rbxassetid://17803630344"]="rbxassetid://137835445333923",["rbxassetid://71387264231358"]="rbxassetid://13456860578",["rbxassetid://75549206431714"]="rbxassetid://13456860578",["rbxassetid://90757583550672"]="rbxassetid://13456860578"},
["Shotkey"] = {["rbxassetid://100664516053133"]="rbxassetid://71387264231358",["rbxassetid://106994976644858"]="rbxassetid://71387264231358",["rbxassetid://108380234827963"]="rbxassetid://71387264231358",["rbxassetid://108887853497578"]="rbxassetid://115657023572170",["rbxassetid://110122962237431"]="rbxassetid://71387264231358",["rbxassetid://112097244349559"]="rbxassetid://71387264231358",["rbxassetid://114436319908436"]="rbxassetid://71387264231358",["rbxassetid://117326796133738"]="rbxassetid://71387264231358",["rbxassetid://117893025759206"]="rbxassetid://115657023572170",["rbxassetid://11956590"]="rbxassetid://71387264231358",["rbxassetid://128809359344035"]="rbxassetid://71387264231358",["rbxassetid://13158330555"]="rbxassetid://71387264231358",["rbxassetid://13158735106"]="rbxassetid://71387264231358",["rbxassetid://13160326139"]="rbxassetid://71387264231358",["rbxassetid://13160400937"]="rbxassetid://71387264231358",["rbxassetid://13169152449"]="rbxassetid://71387264231358",["rbxassetid://13235979356"]="rbxassetid://71387264231358",["rbxassetid://13236026280"]="rbxassetid://71387264231358",["rbxassetid://13236549929"]="rbxassetid://71387264231358",["rbxassetid://13236549962"]="rbxassetid://71387264231358",["rbxassetid://132926867312544"]="rbxassetid://71387264231358",["rbxassetid://134472359434980"]="rbxassetid://71387264231358",["rbxassetid://13455395017"]="rbxassetid://71387264231358",["rbxassetid://13456860578"]="rbxassetid://71387264231358",["rbxassetid://13479562219"]="rbxassetid://115657023572170",["rbxassetid://13483008798"]="rbxassetid://71387264231358",["rbxassetid://13515046872"]="rbxassetid://71387264231358",["rbxassetid://13515046921"]="rbxassetid://71387264231358",["rbxassetid://13515046988"]="rbxassetid://71387264231358",["rbxassetid://13531443905"]="rbxassetid://115657023572170",["rbxassetid://137232955524669"]="rbxassetid://71387264231358",["rbxassetid://137300623286123"]="rbxassetid://71387264231358",["rbxassetid://137900058595276"]="rbxassetid://71387264231358",["rbxassetid://139955889483895"]="rbxassetid://71387264231358",["rbxassetid://14000093824"]="rbxassetid://71387264231358",["rbxassetid://14241444681"]="rbxassetid://71387264231358",["rbxassetid://17123622923"]="rbxassetid://71387264231358",["rbxassetid://17274387490"]="rbxassetid://71387264231358",["rbxassetid://17640978498"]="rbxassetid://71387264231358",["rbxassetid://17803360572"]="rbxassetid://71387264231358",["rbxassetid://18128896162"]="rbxassetid://71387264231358",["rbxassetid://18128949754"]="rbxassetid://71387264231358",["rbxassetid://18763645670"]="rbxassetid://71387264231358",["rbxassetid://73931497990415"]="rbxassetid://71387264231358",["rbxassetid://75549206431714"]="rbxassetid://71387264231358",["rbxassetid://83828319245396"]="rbxassetid://115657023572170",["rbxassetid://84163808107137"]="rbxassetid://71387264231358",["rbxassetid://93178963908825"]="rbxassetid://71387264231358",["rbxassetid://96253147006478"]="rbxassetid://71387264231358"},
["Singularity"] = {["rbxassetid://17266070755"]="rbxassetid://17672502566",["rbxassetid://17266070911"]="rbxassetid://17672502879",["rbxassetid://17266071099"]="rbxassetid://17672502716"},
["Skull Launcher"] = {["rbxassetid://13455968895"]="rbxassetid://17274369233"},
["Snowball Gun"] = {["rbxassetid://13110197220"]="rbxassetid://78027467712109",["rbxassetid://13110197302"]="rbxassetid://78027467712109",["rbxassetid://13158330479"]="rbxassetid://78027467712109",["rbxassetid://76996559479025"]="rbxassetid://78027467712109"},
["Soul Rifle"] = {["rbxassetid://105876698718377"]="rbxassetid://134917124344503",["rbxassetid://108166862465565"]="rbxassetid://72989650712897",["rbxassetid://18763517194"]="rbxassetid://72989650712897",["rbxassetid://73644074370077"]="rbxassetid://72989650712897"},
["Stealth Handgun"] = {["rbxassetid://13110197220"]="rbxassetid://108185335541864",["rbxassetid://13110197302"]="rbxassetid://108185335541864",["rbxassetid://13158330479"]="rbxassetid://108185335541864",["rbxassetid://76996559479025"]="rbxassetid://108185335541864"},
["Temporal Ray"] = {["rbxassetid://18431054958"]="rbxassetid://18431054535"},
["The Shred"] = {["rbxassetid://100664516053133"]="rbxassetid://135262581066376",["rbxassetid://106994976644858"]="rbxassetid://135262581066376",["rbxassetid://108380234827963"]="rbxassetid://135262581066376",["rbxassetid://110122962237431"]="rbxassetid://135262581066376",["rbxassetid://112097244349559"]="rbxassetid://135262581066376",["rbxassetid://114436319908436"]="rbxassetid://135262581066376",["rbxassetid://117326796133738"]="rbxassetid://135262581066376",["rbxassetid://11956590"]="rbxassetid://135262581066376",["rbxassetid://128809359344035"]="rbxassetid://135262581066376",["rbxassetid://13158330555"]="rbxassetid://135262581066376",["rbxassetid://13158735106"]="rbxassetid://135262581066376",["rbxassetid://13160326139"]="rbxassetid://135262581066376",["rbxassetid://13160400937"]="rbxassetid://135262581066376",["rbxassetid://13169152449"]="rbxassetid://135262581066376",["rbxassetid://13236026280"]="rbxassetid://135262581066376",["rbxassetid://13236549929"]="rbxassetid://135262581066376",["rbxassetid://13236549962"]="rbxassetid://135262581066376",["rbxassetid://132926867312544"]="rbxassetid://135262581066376",["rbxassetid://134472359434980"]="rbxassetid://135262581066376",["rbxassetid://13455395017"]="rbxassetid://135262581066376",["rbxassetid://13456860578"]="rbxassetid://135262581066376",["rbxassetid://13483008798"]="rbxassetid://135262581066376",["rbxassetid://13515046921"]="rbxassetid://135262581066376",["rbxassetid://13515046988"]="rbxassetid://135262581066376",["rbxassetid://137232955524669"]="rbxassetid://135262581066376",["rbxassetid://137300623286123"]="rbxassetid://135262581066376",["rbxassetid://137900058595276"]="rbxassetid://135262581066376",["rbxassetid://139955889483895"]="rbxassetid://135262581066376",["rbxassetid://14000093824"]="rbxassetid://135262581066376",["rbxassetid://14241444681"]="rbxassetid://135262581066376",["rbxassetid://17123622923"]="rbxassetid://135262581066376",["rbxassetid://17274387490"]="rbxassetid://135262581066376",["rbxassetid://17640978498"]="rbxassetid://135262581066376",["rbxassetid://17803360572"]="rbxassetid://135262581066376",["rbxassetid://18128896162"]="rbxassetid://135262581066376",["rbxassetid://18128949754"]="rbxassetid://135262581066376",["rbxassetid://71387264231358"]="rbxassetid://135262581066376",["rbxassetid://73931497990415"]="rbxassetid://135262581066376",["rbxassetid://75549206431714"]="rbxassetid://135262581066376",["rbxassetid://84163808107137"]="rbxassetid://135262581066376",["rbxassetid://93178963908825"]="rbxassetid://135262581066376",["rbxassetid://96253147006478"]="rbxassetid://135262581066376"},
["Tommy Gun"] = {["rbxassetid://110122962237431"]="rbxassetid://17662574783",["rbxassetid://124080696816628"]="rbxassetid://17662574783",["rbxassetid://13087362838"]="rbxassetid://17662574783",["rbxassetid://18763517194"]="rbxassetid://17662574783",["rbxassetid://90757583550672"]="rbxassetid://17662574783"},
["Trumpet"] = {["rbxassetid://101461584188367"]="rbxassetid://112012319935983",["rbxassetid://106770345116398"]="rbxassetid://112012319935983",["rbxassetid://73325703605178"]="rbxassetid://112012319935983",["rbxassetid://94406584083681"]="rbxassetid://112012319935983"},
["Void Pistols"] = {["rbxassetid://100664516053133"]="rbxassetid://112097244349559",["rbxassetid://110122962237431"]="rbxassetid://112097244349559",["rbxassetid://120386834342865"]="rbxassetid://94684661380385",["rbxassetid://123443443495942"]="rbxassetid://112097244349559",["rbxassetid://130113370"]="rbxassetid://112097244349559",["rbxassetid://13158330383"]="rbxassetid://112097244349559",["rbxassetid://13158330555"]="rbxassetid://112097244349559",["rbxassetid://13158735106"]="rbxassetid://112097244349559",["rbxassetid://13160326139"]="rbxassetid://112097244349559",["rbxassetid://132138482130551"]="rbxassetid://94684661380385",["rbxassetid://13235979356"]="rbxassetid://112097244349559",["rbxassetid://13236026280"]="rbxassetid://112097244349559",["rbxassetid://13456860532"]="rbxassetid://112097244349559",["rbxassetid://13456860578"]="rbxassetid://112097244349559",["rbxassetid://13483008798"]="rbxassetid://112097244349559",["rbxassetid://134917124344503"]="rbxassetid://112097244349559",["rbxassetid://14241444681"]="rbxassetid://112097244349559",["rbxassetid://14427935597"]="rbxassetid://112097244349559",["rbxassetid://17092564046"]="rbxassetid://112097244349559",["rbxassetid://17803360572"]="rbxassetid://112097244349559",["rbxassetid://18763517194"]="rbxassetid://94684661380385",["rbxassetid://71387264231358"]="rbxassetid://112097244349559",["rbxassetid://82721606455832"]="rbxassetid://112097244349559",["rbxassetid://84163808107137"]="rbxassetid://112097244349559",["rbxassetid://90757583550672"]="rbxassetid://112097244349559"},
["Void Rifle"] = {["rbxassetid://105876698718377"]="rbxassetid://112097244349559",["rbxassetid://108166862465565"]="rbxassetid://138243794425918",["rbxassetid://134917124344503"]="rbxassetid://112097244349559",["rbxassetid://18763517194"]="rbxassetid://138243794425918",["rbxassetid://72989650712897"]="rbxassetid://138243794425918",["rbxassetid://73644074370077"]="rbxassetid://138243794425918"},
["Wrapped Flare Gun"] = {["rbxassetid://100664516053133"]="rbxassetid://123443443495942",["rbxassetid://110122962237431"]="rbxassetid://123443443495942",["rbxassetid://130113370"]="rbxassetid://123443443495942",["rbxassetid://13158330383"]="rbxassetid://123443443495942",["rbxassetid://13158330555"]="rbxassetid://123443443495942",["rbxassetid://13158735106"]="rbxassetid://123443443495942",["rbxassetid://13160326139"]="rbxassetid://123443443495942",["rbxassetid://13235979356"]="rbxassetid://123443443495942",["rbxassetid://13236026280"]="rbxassetid://123443443495942",["rbxassetid://13456860532"]="rbxassetid://123443443495942",["rbxassetid://13456860578"]="rbxassetid://123443443495942",["rbxassetid://13483008798"]="rbxassetid://123443443495942",["rbxassetid://134917124344503"]="rbxassetid://123443443495942",["rbxassetid://14241444681"]="rbxassetid://123443443495942",["rbxassetid://14427935597"]="rbxassetid://123443443495942",["rbxassetid://17092564046"]="rbxassetid://123443443495942",["rbxassetid://17803360572"]="rbxassetid://123443443495942",["rbxassetid://71387264231358"]="rbxassetid://123443443495942",["rbxassetid://82721606455832"]="rbxassetid://123443443495942",["rbxassetid://84163808107137"]="rbxassetid://123443443495942",["rbxassetid://90757583550672"]="rbxassetid://123443443495942"},
["Wrapped Freeze Ray"] = {["rbxassetid://13682183816"]="rbxassetid://123443443495942",["rbxassetid://17274369044"]="rbxassetid://123443443495942",["rbxassetid://18429138544"]="rbxassetid://123443443495942"},
}
local ah = {}
for ix, he in pairs(ao) do
for _, hb in ipairs(he) do
ah[hb] = ix
end
end
local ar = nil
local at = nil
local as = nil
local az = {}
local ge = {}
local aw = nil
local au = m .. " - "
local av = #au
local function dl()
if ar then return ar end
local fd, gc = pcall(function()
return k
:WaitForChild("PlayerScripts", 3)
:WaitForChild("Modules", 3)
:WaitForChild("ClientReplicatedClasses", 3)
:WaitForChild("ClientFighter", 3)
:WaitForChild("ClientItem", 3)
end)
if fd and gc then ar = gc end
return ar
end
local function fv(ix)
for k in next, az do az[k] = nil end
if not ix then return end
local gx = ai.ActiveSkins[ix]
if not gx then return end
local gf = ag[gx]
if not gf then return end
for base, fw in next, gf do az[base] = fw end
end
local function fk(et)
local cc = dl()
if not cc then return end
for _, fc in next, cc:GetChildren() do
if fc:IsA("Sound") then
local fw = et[fc.SoundId]
if fw then fc.SoundId = fw end
end
end
end
local function bv(it, fx)
local gd = {}
for base, sk in next, fx do gd[sk] = base end
ge[it] = gd
return gd
end
local function db()
if aw then return end
local cc = dl()
if not cc then return end
aw = cc.ChildAdded:Connect(function(fc)
if fc:IsA("Sound") then
local fw = az[fc.SoundId]
if fw then fc.SoundId = fw end
end
end)
end
local function hk()
task.spawn(function()
local di = at
if not di then
local ih = workspace:FindFirstChild("ViewModels") or workspace:WaitForChild("ViewModels", 10)
if not ih then return end
di = ih:FindFirstChild("FirstPerson") or ih:WaitForChild("FirstPerson", 10)
if not di then return end
at = di
end
local function fj(ey)
if string.sub(ey, 1, av) ~= au then return nil end
local ga = string.sub(ey, av + 1)
return string.match(ga, "^(.+) %- .+$")
end
di.ChildAdded:Connect(function(bz)
local iz = fj(bz.Name)
if not iz then return end
as = iz
fv(iz)
fk(az)
end)
di.ChildRemoved:Connect(function(bz)
local iz = fj(bz.Name)
if iz == as then
as = nil
for k in next, az do az[k] = nil end
end
end)
for _, bz in next, di:GetChildren() do
local iz = fj(bz.Name)
if iz then
as = iz
fv(iz)
break
end
end
end)
end
task.spawn(function()
dl()
db()
hk()
end)
bk = function(it, gx, cy)
if cy and gx then
local fx = ag[gx]
if not fx then return end
bv(it, fx)
if as == it then
fv(it)
fk(az)
end
else
local fx = gx and ag[gx]
if fx then
if as == it then
local gd = ge[it] or bv(it, fx)
fk(gd)
for k in next, az do az[k] = nil end
end
ge[it] = nil
end
end
end
local function gu(ew, ev)
local cn = 0
for _, v in ipairs(ew:GetDescendants()) do
if (v:IsA("MeshPart") or v:IsA("BasePart") or v:IsA("Part")) and not string.find(string.lower(v.Name), "primary") then
v.Material = Enum.Material[ev]
cn = cn + 1
end
end
return cn
end
local function gw(ew, ic)
local cn = 0
for _, v in ipairs(ew:GetDescendants()) do
if (v:IsA("MeshPart") or v:IsA("BasePart") or v:IsA("Part")) and not string.find(string.lower(v.Name), "primary") then
v.Transparency = ic / 100
cn = cn + 1
end
end
return cn
end
local function ia()
if not ai.MaterialEnabled then return end
local id = ReplicatedStorage.Assets.Temp.ViewModels
for _, ih in ipairs(id:GetChildren()) do
if string.find(ih.Name, m .. " -", 1, true) == 1 then
local ig = ih:FindFirstChild("ItemVisual")
if ig then
gu(ig, ai.CurrentMaterial)
gw(ig, ai.Transparency)
end
end
end
end
local aj = aq:AddTab("Skin Changer")
local g = aj:AddLeftGroupbox("Weapons")
local h = aj:AddRightGroupbox("Skins")
local z = nil
local ae = ""
local ad = ""
local n = Color3.fromRGB(99, 102, 241)
local o = Color3.fromRGB(10, 10, 16)
local t = Color3.fromRGB(18, 18, 28)
local v = Color3.fromRGB(28, 28, 50)
local x = Color3.fromRGB(225, 225, 240)
local u = Color3.fromRGB(130, 130, 155)
local w = Color3.fromRGB(55, 55, 80)
local function gq(fh, ft)
local bx = Instance.new("UICorner")
bx.CornerRadius = UDim.new(0, ft or 6)
bx.Parent = fh
return bx
end
local function gr(fh, cg, ho, hs)
local gh = Instance.new("UIStroke")
gh.Color = cg or w
gh.Thickness = ho or 1
gh.Transparency = hs or 0.6
gh.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
gh.Parent = fh
return gh
end
local il = Instance.new("Frame")
il.Size = UDim2.new(1, 0, 0, 28)
il.BackgroundColor3 = o
il.BorderSizePixel = 0
gq(il, 6)
gr(il, w, 1, 0.4)
local ik = Instance.new("TextBox")
ik.Size = UDim2.new(1, -30, 1, 0)
ik.Position = UDim2.new(0, 28, 0, 0)
ik.BackgroundTransparency = 1
ik.Text = ""
ik.PlaceholderText = "Search weapons..."
ik.PlaceholderColor3 = u
ik.TextColor3 = x
ik.TextSize = 12
ik.Font = Enum.Font.GothamMedium
ik.TextXAlignment = Enum.TextXAlignment.Left
ik.ClearTextOnFocus = false
ik.Parent = il
local im = Instance.new("ImageLabel")
im.Size = UDim2.fromOffset(14, 14)
im.Position = UDim2.new(0, 7, 0.5, -7)
im.BackgroundTransparency = 1
im.Image = "rbxassetid://3926305904"
im.ImageRectOffset = Vector2.new(964, 324)
im.ImageRectSize = Vector2.new(36, 36)
im.ImageColor3 = u
im.Parent = il
g:AddUIPassthrough("SC_WSearch", { Instance = il, Height = 28 })
local io = Instance.new("ScrollingFrame")
io.Size = UDim2.new(1, 0, 1, 0)
io.BackgroundColor3 = o
io.BorderSizePixel = 0
io.ScrollBarThickness = 3
io.ScrollBarImageColor3 = n
io.CanvasSize = UDim2.new(0, 0, 0, 0)
io.AutomaticCanvasSize = Enum.AutomaticSize.Y
gq(io, 6)
Instance.new("UIListLayout", io).Padding = UDim.new(0, 2)
io:FindFirstChildOfClass("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder
local ij = Instance.new("UIPadding", io)
ij.PaddingTop = UDim.new(0, 3)
ij.PaddingBottom = UDim.new(0, 3)
ij.PaddingLeft = UDim.new(0, 3)
ij.PaddingRight = UDim.new(0, 6)
g:AddUIPassthrough("SC_WScroll", { Instance = io, Height = 295 })
local gl = Instance.new("Frame")
gl.Size = UDim2.new(1, 0, 0, 28)
gl.BackgroundColor3 = o
gl.BorderSizePixel = 0
gq(gl, 6)
gr(gl, w, 1, 0.4)
local gk = Instance.new("TextBox")
gk.Size = UDim2.new(1, -30, 1, 0)
gk.Position = UDim2.new(0, 28, 0, 0)
gk.BackgroundTransparency = 1
gk.PlaceholderText = "Search skins..."
gk.PlaceholderColor3 = u
gk.TextColor3 = x
gk.TextSize = 12
gk.Text = ""
gk.Font = Enum.Font.GothamMedium
gk.TextXAlignment = Enum.TextXAlignment.Left
gk.ClearTextOnFocus = false
gk.Parent = gl
local gm = Instance.new("ImageLabel")
gm.Size = UDim2.fromOffset(14, 14)
gm.Position = UDim2.new(0, 7, 0.5, -7)
gm.BackgroundTransparency = 1
gm.Image = "rbxassetid://3926305904"
gm.ImageRectOffset = Vector2.new(964, 324)
gm.ImageRectSize = Vector2.new(36, 36)
gm.ImageColor3 = u
gm.Parent = gl
h:AddUIPassthrough("SC_SSearch", { Instance = gl, Height = 28 })
local gn = Instance.new("ScrollingFrame")
gn.Size = UDim2.new(1, 0, 1, 0)
gn.BackgroundColor3 = o
gn.BorderSizePixel = 0
gn.ScrollBarThickness = 3
gn.ScrollBarImageColor3 = n
gn.CanvasSize = UDim2.new(0, 0, 0, 0)
gn.AutomaticCanvasSize = Enum.AutomaticSize.Y
gq(gn, 6)
local gi = Instance.new("UIGridLayout", gn)
gi.CellSize = UDim2.fromOffset(102, 100)
gi.CellPadding = UDim2.fromOffset(4, 4)
gi.SortOrder = Enum.SortOrder.LayoutOrder
local gj = Instance.new("UIPadding", gn)
gj.PaddingTop = UDim.new(0, 4)
gj.PaddingBottom = UDim.new(0, 4)
gj.PaddingLeft = UDim.new(0, 4)
gj.PaddingRight = UDim.new(0, 4)
h:AddUIPassthrough("SC_SScroll", { Instance = gn, Height = 295 })
local function ab(ey, fg)
local bu = Instance.new("TextButton")
bu.Size = UDim2.new(1, 0, 0, 30)
bu.BackgroundColor3 = t
bu.BorderSizePixel = 0
bu.Text = ""
bu.LayoutOrder = fg
gq(bu, 5)
local hm = gr(bu, w, 1, 0.75)
local eb = Instance.new("ImageLabel", bu)
eb.Size = UDim2.fromOffset(50,50)
eb.Position = UDim2.new(0, -10, 0.1, -10)
eb.BackgroundTransparency = 1
eb.Image = af[ey] or af["MISSING_WEAPON"]
eb.ScaleType = Enum.ScaleType.Fit
local ek = Instance.new("TextLabel", bu)
ek.Size = UDim2.new(1, -40, 1, 0)
ek.Position = UDim2.new(0, 32, 0, 0)
ek.BackgroundTransparency = 1
ek.Text = ey
ek.TextColor3 = x
ek.TextSize = 11
ek.Font = Enum.Font.GothamMedium
ek.TextXAlignment = Enum.TextXAlignment.Left
ek.TextTruncate = Enum.TextTruncate.AtEnd
local cx = Instance.new("Frame", bu)
cx.Size = UDim2.fromOffset(5, 5)
cx.Position = UDim2.new(1, -9, 0.5, -2)
cx.BackgroundColor3 = n
cx.BorderSizePixel = 0
cx.Visible = (ai.ActiveSkins[ey] ~= nil)
gq(cx, 3)
local function gv(ff)
bu.BackgroundColor3 = ff and v or t
hm.Color = ff and n or w
hm.Transparency = ff and 0 or 0.75
end
bu.MouseEnter:Connect(function()
if z ~= ey then bu.BackgroundColor3 = v end
end)
bu.MouseLeave:Connect(function()
if z ~= ey then gv(false) end
end)
bu.MouseButton1Click:Connect(function()
z = ey
ad = ""
gk.Text = ""
for _, ch in ipairs(io:GetChildren()) do
if ch:IsA("TextButton") then
ch.BackgroundColor3 = t
local hj = ch:FindFirstChildOfClass("UIStroke")
if hj then hj.Color = w; hj.Transparency = 0.75 end
end
end
gv(true)
SC_refreshSkins()
end)
y[bu] = { cx = cx, gv = gv }
return bu
end
local function aa(hb, iv, fg)
local eg = (hb == "Default")
local eh = eg and (ai.ActiveSkins[iv] == nil)
or (not eg and ai.ActiveSkins[iv] == hb)
local by = Instance.new("TextButton")
by.Size = UDim2.fromOffset(80, 86)
by.BackgroundColor3 = eh and v or t
by.BorderSizePixel = 0
by.Text = ""
by.LayoutOrder = fg
gq(by, 7)
local hm = gr(by, eh and n or w, 1, eh and 0 or 0.7)
local ed = Instance.new("ImageLabel", by)
ed.Size = UDim2.new(2, 0, 1, 0)
ed.Position = UDim2.new(0, -50, 0, 0)
ed.BackgroundTransparency = 1
ed.ScaleType = Enum.ScaleType.Crop
ed.ZIndex = 1
gq(ed, 7)
if eg then
ed.Image = af[iv] or af["MISSING_SKIN"]
else
ed.Image = af[hb] or af["MISSING_SKIN"]
end
local ez = Instance.new("TextLabel", by)
ez.Size = UDim2.new(1, 0, 0, 20)
ez.Position = UDim2.new(0, 0, 1, -20)
ez.BackgroundTransparency = 1
ez.Text = hb
ez.TextColor3 = x
ez.TextSize = 9
ez.Font = Enum.Font.GothamMedium
ez.TextTruncate = Enum.TextTruncate.AtEnd
ez.ZIndex = 2
local br = Instance.new("Frame", by)
br.Size = UDim2.fromOffset(7, 7)
br.Position = UDim2.new(1, -10, 0, 3)
br.BackgroundColor3 = n
br.BorderSizePixel = 0
br.Visible = eh
gq(br, 4)
by.MouseEnter:Connect(function()
local dc = eg and (ai.ActiveSkins[iv] == nil)
or (ai.ActiveSkins[iv] == hb)
if not dc then by.BackgroundColor3 = v end
end)
by.MouseLeave:Connect(function()
local dc = eg and (ai.ActiveSkins[iv] == nil)
or (ai.ActiveSkins[iv] == hb)
if not dc then by.BackgroundColor3 = t end
end)
by.MouseButton1Click:Connect(function()
if eg then
bj(iv, nil, false)
else
bj(iv, hb, true)
end
SC_refreshSkins()
for _, ch in ipairs(io:GetChildren()) do
if ch:IsA("TextButton") and y[ch] then
local el = ch:FindFirstChildOfClass("TextLabel")
if el and el.Text == iv then
y[ch].dot.Visible = (ai.ActiveSkins[iv] ~= nil)
end
end
end
end)
return by
end
function SC_refreshSkins()
for _, v in ipairs(gn:GetChildren()) do
if v:IsA("TextButton") then v:Destroy() end
end
if not z then return end
local he = ao[z]
if not he then return end
local dh = ad:lower()
local fg = 0
if dh == "" or ("default"):find(dh, 1, true) then
fg = fg + 1
aa("Default", z, fg).Parent = gn
end
for _, gh in ipairs(he) do
if dh == "" or string.lower(gh):find(dh, 1, true) then
fg = fg + 1
aa(gh, z, fg).Parent = gn
end
end
end
ik:GetPropertyChangedSignal("Text"):Connect(function()
ae = ik.Text
SC_buildWeapons()
end)
gk:GetPropertyChangedSignal("Text"):Connect(function()
ad = gk.Text
SC_refreshSkins()
end)
function SC_buildWeapons()
table.clear(y)
for _, v in ipairs(io:GetChildren()) do
if v:IsA("TextButton") then v:Destroy() end
end
local hi = {}
for ey in pairs(ao) do ef(hi, ey) end
table.sort(hi)
local dh = ae:lower()
local fg = 0
for _, ey in ipairs(hi) do
if dh == "" or string.lower(ey):find(dh, 1, true) then
fg = fg + 1
local bu = ab(ey, fg)
bu.Parent = io
if ey == z and y[bu] then
y[bu].setSelected(true)
end
end
end
end
SC_buildWeapons()
local ak = aq:AddTab("Weapon Changer")
local i = ak:AddLeftGroupbox("Settings")
i:AddCheckbox("EnableMaterial", {
Text = "Enable",
Default = ai.MaterialEnabled,
Callback = function(ib)
ai.MaterialEnabled = ib
go()
ia()
end
})
i:AddDropdown("MaterialSelect", {
Values = l,
Default = ai.CurrentMaterial,
Text = "Select Material",
Callback = function(ib)
ai.CurrentMaterial = ib
go()
ia()
end
})
i:AddSlider("TransparencySlider", {
Text = "Transparency %",
Default = ai.Transparency,
Min = 0,
Max = 100,
Rounding = 0,
Callback = function(ib)
ai.Transparency = ib
go()
ia()
end
})
do
local cs = false
ReplicatedStorage.Assets.Temp.ViewModels.ChildAdded:Connect(function()
if cs then return end
cs = true
task.delay(0.1, function()
ia()
cs = false
end)
end)
end
local function gg()
Lighting.GlobalShadows = false
Lighting.FogEnd = 100000
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(178, 178, 178)
Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
for _, effect in ipairs(Lighting:GetChildren()) do
if effect:IsA("PostEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect")
or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
effect.Enabled = false
end
end
workspace.Terrain.WaterWaveSize = 0
workspace.Terrain.WaterWaveSpeed = 0
workspace.Terrain.WaterReflectance = 0
workspace.Terrain.WaterTransparency = 0
workspace.StreamingEnabled = true
local ds = UserSettings():GetService("UserGameSettings")
ds.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
settings().Rendering.QualityLevel = 1
settings().Rendering.EnableFRM = false
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = true
for _, v in ipairs(workspace:GetDescendants()) do
local cd = v.ClassName
if v:IsA("BasePart") then
v.CastShadow = false
if cd == "MeshPart" then
v.RenderFidelity = Enum.RenderFidelity.Automatic
v.TextureID = ""
end
elseif cd == "Texture" or cd == "Decal" then
v.Transparency = 1
elseif cd == "ParticleEmitter" or cd == "Trail" or cd == "Beam"
or cd == "BillboardGui" or cd == "SurfaceGui" then
v.Enabled = false
end
end
end
task.defer(function()
task.wait(1)
for it, gx in pairs(ai.ActiveSkins) do
bj(it, gx, true)
end
if ai.MaterialEnabled then
ia()
end
hl()
task.spawn(function()
while true do
task.wait(0.1)
for it, gx in pairs(ai.ActiveSkins) do
hy(it, gx)
hx(it, gx)
hw(it, gx)
end
end
end)
end)
local b = {}
do
b["fists_equip"] = "rbxassetid://12557487419"
b["fists_idle"] = "rbxassetid://12557500357"
b["fists_inspect"] = "rbxassetid://12557511090"
b["fists_attack1"] = "rbxassetid://12557515008"
b["fists_attack2"] = "rbxassetid://12557516966"
b["fists_boxinggloves_inspect"] = "rbxassetid://106138480662148"
b["fists_fistsofhurt_inspect"] = "rbxassetid://106138480662148"
b["fists_fistsofhurt_attack1"] = "rbxassetid://12557515008"
b["fists_fistsofhurt_attack2"] = "rbxassetid://12557516966"
b["knife_equip"] = "rbxassetid://12613363718"
b["knife_idle"] = "rbxassetid://12613190591"
b["knife_inspect"] = "rbxassetid://12613329711"
b["knife_inspect_rare"] = "rbxassetid://12613320859"
b["knife_attack1"] = "rbxassetid://12613340305"
b["knife_attack2"] = "rbxassetid://12613350645"
b["knife_heavyattack1"] = "rbxassetid://12613354440"
b["knife_karambit_equip"] = "rbxassetid://18742841521"
b["knife_karambit_idle"] = "rbxassetid://18742849437"
b["knife_karambit_inspect"] = "rbxassetid://18742879471"
b["knife_karambit_attack1"] = "rbxassetid://18742860878"
b["knife_karambit_attack2"] = "rbxassetid://18742864831"
b["knife_karambit_heavyattack1"] = "rbxassetid://18742868264"
b["knife_karambit_heavyattack_hit"] = "rbxassetid://18742872634"
b["knife_balisong_equip"] = "rbxassetid://130021374819064"
b["knife_balisong_idle"] = "rbxassetid://90095202332049"
b["knife_balisong_inspect"] = "rbxassetid://86667035849478"
b["knife_balisong_attack1"] = "rbxassetid://100199777831515"
b["knife_balisong_attack2"] = "rbxassetid://76981758062644"
b["knife_balisong_heavyattack1"] = "rbxassetid://125644419135995"
b["knife_balisong_heavyattack_hit"] = "rbxassetid://123415605337684"
b["knife_armature001_heavyattack_hit"] = "rbxassetid://123415605337684"
b["knife_keyrambit_equip"] = "rbxassetid://18742841521"
b["knife_keyrambit_idle"] = "rbxassetid://18742849437"
b["knife_keyrambit_inspect"] = "rbxassetid://18742879471"
b["knife_keyrambit_attack1"] = "rbxassetid://18742860878"
b["knife_keyrambit_attack2"] = "rbxassetid://18742864831"
b["knife_keyrambit_heavyattack1"] = "rbxassetid://18742868264"
b["knife_keyrambit_heavyattack_hit"] = "rbxassetid://18742872634"
b["knife_keylisong_equip"] = "rbxassetid://130021374819064"
b["knife_keylisong_idle"] = "rbxassetid://90095202332049"
b["knife_keylisong_inspect"] = "rbxassetid://86667035849478"
b["knife_keylisong_attack1"] = "rbxassetid://100199777831515"
b["knife_keylisong_attack2"] = "rbxassetid://76981758062644"
b["knife_keylisong_heavyattack1"] = "rbxassetid://125644419135995"
b["knife_keylisong_heavyattack_hit"] = "rbxassetid://123415605337684"
b["flaregun_equip"] = "rbxassetid://107723798183621"
b["flaregun_idle"] = "rbxassetid://100034818685270"
b["flaregun_inspect"] = "rbxassetid://94266255406175"
b["flaregun_shoot1"] = "rbxassetid://82554316427258"
b["flaregun_reload"] = "rbxassetid://135013466651620"
b["flaregun_dynamitegun_shoot1"] = "rbxassetid://82554316427258"
b["flaregun_wrappedflaregun_equip"] = "rbxassetid://107723798183621"
b["flaregun_bananaflare_equip"] = "rbxassetid://108891996013575"
b["flaregun_bananaflare_idle"] = "rbxassetid://87971702279131"
b["flaregun_bananaflare_inspect"] = "rbxassetid://79689191626211"
b["flaregun_bananaflare_inspect_rare"] = "rbxassetid://131446950441679"
b["flaregun_bananaflare_shoot1"] = "rbxassetid://113241001718358"
b["flaregun_bananaflare_reload"] = "rbxassetid://84174328965062"
b["assaultrifle_equip"] = "rbxassetid://13010870236"
b["assaultrifle_idle"] = "rbxassetid://13010885336"
b["assaultrifle_inspect"] = "rbxassetid://13010893629"
b["assaultrifle_shoot1"] = "rbxassetid://13010911854"
b["assaultrifle_reload"] = "rbxassetid://13010900962"
b["assaultrifle_ak47_shoot1"] = "rbxassetid://13010911854"
b["assaultrifle_aug_equip"] = "rbxassetid://18875555761"
b["assaultrifle_aug_idle"] = "rbxassetid://18875814511"
b["assaultrifle_aug_inspect"] = "rbxassetid://18875805841"
b["assaultrifle_aug_shoot1"] = "rbxassetid://18875560888"
b["assaultrifle_aug_reload"] = "rbxassetid://18887149414"
b["assaultrifle_aug_shoot1"] = "rbxassetid://18875560888"
b["assaultrifle_boneclawrifle_shoot1"] = "rbxassetid://13010911854"
b["assaultrifle_akey47_equip"] = "rbxassetid://13010870236"
b["assaultrifle_akey47_inspect"] = "rbxassetid://13010893629"
b["assaultrifle_akey47_shoot1"] = "rbxassetid://13010911854"
b["assaultrifle_akey47_reload"] = "rbxassetid://13010900962"
b["assaultrifle_gingerbreadaug_equip"] = "rbxassetid://18875555761"
b["assaultrifle_gingerbreadaug_idle"] = "rbxassetid://18875814511"
b["assaultrifle_gingerbreadaug_inspect"] = "rbxassetid://18875805841"
b["assaultrifle_gingerbreadaug_shoot1"] = "rbxassetid://18875560888"
b["assaultrifle_gingerbreadaug_reload"] = "rbxassetid://18887149414"
b["assaultrifle_gingerbreadaug_shoot1"] = "rbxassetid://18875560888"
b["assaultrifle_tommygun_equip"] = "rbxassetid://113547428826965"
b["assaultrifle_tommygun_equip_empty"] = "rbxassetid://116998046735700"
b["assaultrifle_tommygun_idle"] = "rbxassetid://102761331433561"
b["assaultrifle_tommygun_idle_empty"] = "rbxassetid://110157627168165"
b["assaultrifle_tommygun_inspect"] = "rbxassetid://136686405315688"
b["assaultrifle_tommygun_inspect_empty"] = "rbxassetid://86375930369491"
b["assaultrifle_tommygun_shoot1"] = "rbxassetid://114667858672789"
b["assaultrifle_tommygun_shoot_final"] = "rbxassetid://124757946965274"
b["assaultrifle_tommygun_reload"] = "rbxassetid://137086406367920"
b["assaultrifle_tommygun_reload_empty"] = "rbxassetid://113855213548942"
b["handgun_equip"] = "rbxassetid://13154853798"
b["handgun_idle"] = "rbxassetid://13154895356"
b["handgun_inspect"] = "rbxassetid://13154906500"
b["handgun_shoot1"] = "rbxassetid://13154881027"
b["handgun_shoot_final"] = "rbxassetid://13154885740"
b["handgun_reload"] = "rbxassetid://13154930776"
b["handgun_reload_empty"] = "rbxassetid://13154926508"
b["handgun_blaster_shoot1"] = "rbxassetid://13154881027"
b["handgun_blaster_shoot_final"] = "rbxassetid://13154885740"
b["handgun_handgun_equip"] = "rbxassetid://93414477291099"
b["handgun_handgun_idle"] = "rbxassetid://78172322720346"
b["handgun_handgun_inspect"] = "rbxassetid://111100721217263"
b["handgun_handgun_inspect_rare"] = "rbxassetid://99063024708659"
b["handgun_handgun_shoot1"] = "rbxassetid://105106265753829"
b["handgun_handgun_shoot_final"] = "rbxassetid://115013107801522"
b["handgun_handgun_reload"] = "rbxassetid://117434936040478"
b["handgun_handgun_reload_empty"] = "rbxassetid://91615994075180"
b["handgun_pixelhandgun_equip"] = "rbxassetid://118752513068339"
b["handgun_pixelhandgun_idle"] = "rbxassetid://86191621754187"
b["handgun_pixelhandgun_inspect"] = "rbxassetid://97926404725251"
b["handgun_pixelhandgun_shoot1"] = "rbxassetid://120234343979123"
b["handgun_pixelhandgun_shoot_final"] = "rbxassetid://106732170905381"
b["handgun_pixelhandgun_reload"] = "rbxassetid://127709391114217"
b["handgun_pixelhandgun_reload_empty"] = "rbxassetid://128342393738851"
b["handgun_gumballhandgun_shoot1"] = "rbxassetid://13154881027"
b["handgun_gumballhandgun_shoot_final"] = "rbxassetid://13154885740"
b["handgun_stealthhandgun_shoot1"] = "rbxassetid://13154881027"
b["handgun_stealthhandgun_shoot_final"] = "rbxassetid://13154885740"
b["burstrifle_equip"] = "rbxassetid://13204376695"
b["burstrifle_idle"] = "rbxassetid://13204384262"
b["burstrifle_inspect"] = "rbxassetid://13204401654"
b["burstrifle_shoot1"] = "rbxassetid://13204428113"
b["burstrifle_reload"] = "rbxassetid://13204413250"
b["burstrifle_electrorifle_shoot1"] = "rbxassetid://13204428113"
b["burstrifle_electrorifle_reload"] = "rbxassetid://13204413250"
b["burstrifle_aquaburst_shoot1"] = "rbxassetid://13204428113"
b["burstrifle_pixelburst_equip"] = "rbxassetid://96027715467221"
b["burstrifle_pixelburst_idle"] = "rbxassetid://77419114573216"
b["burstrifle_pixelburst_inspect"] = "rbxassetid://89127204291789"
b["burstrifle_pixelburst_shoot1"] = "rbxassetid://118071222377726"
b["burstrifle_pixelburst_reload"] = "rbxassetid://118150505413279"
b["burstrifle_spectralburst_shoot1"] = "rbxassetid://13204428113"
b["burstrifle_famas_equip"] = "rbxassetid://127566905137304"
b["burstrifle_famas_idle"] = "rbxassetid://140530564891164"
b["burstrifle_famas_inspect"] = "rbxassetid://103143768895353"
b["burstrifle_famas_shoot1"] = "rbxassetid://131175568572355"
b["burstrifle_famas_reload"] = "rbxassetid://106301555292110"
b["burstrifle_famas_reload_empty"] = "rbxassetid://137052028272348"
b["burstrifle_keystrifle_equip"] = "rbxassetid://105402901613987"
b["burstrifle_keystrifle_idle"] = "rbxassetid://93156459127482"
b["burstrifle_keystrifle_inspect"] = "rbxassetid://130335149853469"
b["burstrifle_keystrifle_shoot1"] = "rbxassetid://93585501212722"
b["burstrifle_keystrifle_reload"] = "rbxassetid://73026124060302"
b["sniper_equip"] = "rbxassetid://13269929260"
b["sniper_idle"] = "rbxassetid://13269931582"
b["sniper_inspect"] = "rbxassetid://13269934368"
b["sniper_shoot1"] = "rbxassetid://13269963346"
b["sniper_reload"] = "rbxassetid://13642104835"
b["sniper_reload_empty"] = "rbxassetid://13269951125"
b["sniper_pixelsniper_equip"] = "rbxassetid://17664629760"
b["sniper_pixelsniper_idle"] = "rbxassetid://17664646174"
b["sniper_pixelsniper_inspect"] = "rbxassetid://17664656355"
b["sniper_pixelsniper_shoot1"] = "rbxassetid://17664683617"
b["sniper_pixelsniper_reload"] = "rbxassetid://17664661034"
b["sniper_pixelsniper_reload_empty"] = "rbxassetid://17664666318"
b["sniper_hypersniper_shoot1"] = "rbxassetid://13269963346"
b["sniper_keyper_equip"] = "rbxassetid://13269929260"
b["sniper_keyper_shoot1"] = "rbxassetid://13269963346"
b["sniper_eyethingsniper_shoot1"] = "rbxassetid://13269963346"
b["sniper_eventhorizon_equip"] = "rbxassetid://81764105421530"
b["sniper_eventhorizon_idle"] = "rbxassetid://133028871112073"
b["sniper_eventhorizon_inspect"] = "rbxassetid://89426100452654"
b["sniper_eventhorizon_shoot1"] = "rbxassetid://131324265853213"
b["sniper_eventhorizon_reload"] = "rbxassetid://121991964753861"
b["sniper_eventhorizon_reload_empty"] = "rbxassetid://130611507137983"
b["rpg_equip"] = "rbxassetid://13335178466"
b["rpg_idle"] = "rbxassetid://13335180955"
b["rpg_inspect"] = "rbxassetid://13335184987"
b["rpg_inspect_rare"] = "rbxassetid://13396781660"
b["rpg_shoot1"] = "rbxassetid://13335195024"
b["rpg_reload"] = "rbxassetid://13335191169"
b["rpg_rpkey_equip"] = "rbxassetid://13335178466"
b["rpg_rocketlauncher_equip"] = "rbxassetid://112967181529004"
b["rpg_rocketlauncher_idle"] = "rbxassetid://82972943629410"
b["rpg_rocketlauncher_inspect"] = "rbxassetid://119225703794121"
b["rpg_rocketlauncher_shoot1"] = "rbxassetid://74886439860700"
b["rpg_rocketlauncher_reload"] = "rbxassetid://102363612297181"
b["medkit_equip"] = "rbxassetid://13437797120"
b["medkit_idle"] = "rbxassetid://13437801643"
b["medkit_inspect"] = "rbxassetid://13437816050"
b["medkit_use"] = "rbxassetid://13437821805"
b["medkit_use_quick"] = "rbxassetid://17123088750"
b["medkit_sandwich_equip"] = "rbxassetid://18128493215"
b["medkit_sandwich_idle"] = "rbxassetid://18128523246"
b["medkit_sandwich_inspect"] = "rbxassetid://18128519617"
b["medkit_sandwich_use"] = "rbxassetid://18128529819"
b["medkit_sandwich_use_quick"] = "rbxassetid://18128547498"
b["medkit_laptop_equip"] = "rbxassetid://74779247512135"
b["medkit_laptop_idle"] = "rbxassetid://140705688469607"
b["medkit_laptop_inspect"] = "rbxassetid://101520056323490"
b["medkit_laptop_inspect_rare"] = "rbxassetid://93950020034372"
b["medkit_laptop_use"] = "rbxassetid://75591243949775"
b["medkit_laptop_use_quick"] = "rbxassetid://127669453468764"
b["medkit_bucketofcandy_equip"] = "rbxassetid://119978097963336"
b["medkit_bucketofcandy_idle"] = "rbxassetid://130335495105654"
b["medkit_bucketofcandy_inspect"] = "rbxassetid://71076970298091"
b["medkit_bucketofcandy_use"] = "rbxassetid://129891449854042"
b["medkit_bucketofcandy_use_quick"] = "rbxassetid://70512622419347"
b["medkit_milkcookies_equip"] = "rbxassetid://136037824054254"
b["medkit_milkcookies_idle"] = "rbxassetid://88755378283243"
b["medkit_milkcookies_inspect"] = "rbxassetid://82996474970905"
b["medkit_milkcookies_use"] = "rbxassetid://125083681862025"
b["medkit_milkcookies_use_quick"] = "rbxassetid://130281150831400"
b["medkit_medkitty_equip"] = "rbxassetid://125702854498615"
b["medkit_medkitty_idle"] = "rbxassetid://107279115994172"
b["medkit_medkitty_inspect"] = "rbxassetid://100889196535171"
b["medkit_medkitty_use"] = "rbxassetid://110347503562914"
b["medkit_medkitty_use_quick"] = "rbxassetid://111869708774983"
b["medkit_boxofchocolates_equip"] = "rbxassetid://102404234519543"
b["medkit_boxofchocolates_idle"] = "rbxassetid://101384793202664"
b["medkit_boxofchocolates_inspect"] = "rbxassetid://131686935405881"
b["medkit_boxofchocolates_use"] = "rbxassetid://98207968795604"
b["medkit_boxofchocolates_use_quick"] = "rbxassetid://105191866364479"
b["shorty_equip"] = "rbxassetid://13471194741"
b["shorty_idle"] = "rbxassetid://13471198159"
b["shorty_inspect"] = "rbxassetid://13471203403"
b["shorty_inspect_rare"] = "rbxassetid://13471205979"
b["shorty_shoot1"] = "rbxassetid://13471217688"
b["shorty_reload"] = "rbxassetid://13471211137"
b["shorty_reload_empty"] = "rbxassetid://13471209686"
b["shorty_demonshorty_shoot1"] = "rbxassetid://13471217688"
b["shorty_wrappedshorty_equip"] = "rbxassetid://13471194741"
b["shorty_balloonshorty_inspect_rare"] = "rbxassetid://13471205979"
b["shorty_balloonshorty_shoot1"] = "rbxassetid://13471217688"
b["shorty_balloonshorty_reload"] = "rbxassetid://13471211137"
b["shorty_balloonshorty_reload_empty"] = "rbxassetid://13471209686"
b["shotgun_equip"] = "rbxassetid://13512539232"
b["shotgun_idle"] = "rbxassetid://13539007834"
b["shotgun_inspect"] = "rbxassetid://13539030829"
b["shotgun_inspect_rare"] = "rbxassetid://93315729146822"
b["shotgun_shoot1"] = "rbxassetid://13512545291"
b["shotgun_reload_start"] = "rbxassetid://13530523395"
b["shotgun_reload_segment"] = "rbxassetid://13512569119"
b["shotgun_reload_finish"] = "rbxassetid://13530568302"
b["shotgun_reload_finish2"] = "rbxassetid://13539195649"
b["shotgun_reload_empty_start"] = "rbxassetid://13512566172"
b["shotgun_reload_empty_finish"] = "rbxassetid://13512572126"
b["shotgun_reload_empty_finish2"] = "rbxassetid://13539199531"
b["shotgun_balloonshotgun_equip"] = "rbxassetid://13512539232"
b["shotgun_balloonshotgun_inspect"] = "rbxassetid://13539030829"
b["shotgun_balloonshotgun_inspect_rare"] = "rbxassetid://93315729146822"
b["shotgun_balloonshotgun_shoot1"] = "rbxassetid://13512545291"
b["shotgun_balloonshotgun_reload_segment"] = "rbxassetid://13512569119"
b["shotgun_balloonshotgun_reload_finish"] = "rbxassetid://13530568302"
b["shotgun_balloonshotgun_reload_empty_start"] = "rbxassetid://13512566172"
b["shotgun_balloonshotgun_reload_empty_finish2"] = "rbxassetid://13539199531"
b["shotgun_hypershotgun_shoot1"] = "rbxassetid://13512545291"
b["shotgun_broomstick_equip"] = "rbxassetid://13512539232"
b["shotgun_broomstick_shoot1"] = "rbxassetid://13512545291"
b["shotgun_wrappedshotgun_equip"] = "rbxassetid://13512539232"
b["shotgun_cactusshotgun_shoot1"] = "rbxassetid://13512545291"
b["shotgun_shotkey_equip"] = "rbxassetid://116242819561717"
b["shotgun_shotkey_idle"] = "rbxassetid://96752276425565"
b["shotgun_shotkey_inspect"] = "rbxassetid://87442080531945"
b["shotgun_shotkey_inspect_empty"] = "rbxassetid://130034066004112"
b["shotgun_shotkey_shoot1"] = "rbxassetid://78706462366313"
b["shotgun_shotkey_shoot_aiming"] = "rbxassetid://134933454018055"
b["shotgun_shotkey_reload_start"] = "rbxassetid://132872168301462"
b["shotgun_shotkey_reload_segment"] = "rbxassetid://138670695095776"
b["shotgun_shotkey_reload_finish"] = "rbxassetid://134551698849845"
b["shotgun_shotkey_reload_empty_start"] = "rbxassetid://71864463423892"
b["shotgun_shotkey_reload_empty_finish2"] = "rbxassetid://133311700920375"
b["chainsaw_equip"] = "rbxassetid://13592814661"
b["chainsaw_idle"] = "rbxassetid://13592826733"
b["chainsaw_inspect"] = "rbxassetid://13592833402"
b["chainsaw_attack1"] = "rbxassetid://13592837146"
b["chainsaw_attack2"] = "rbxassetid://13592839019"
b["chainsaw_hold_start"] = "rbxassetid://13592848848"
b["chainsaw_hold_loop"] = "rbxassetid://13592852203"
b["chainsaw_hold_finish"] = "rbxassetid://13592854657"
b["chainsaw_handsaws_equip"] = "rbxassetid://18768563958"
b["chainsaw_handsaws_idle"] = "rbxassetid://18768614714"
b["chainsaw_handsaws_inspect"] = "rbxassetid://18768601757"
b["chainsaw_handsaws_attack1"] = "rbxassetid://18768589465"
b["chainsaw_handsaws_attack2"] = "rbxassetid://18768596653"
b["chainsaw_handsaws_hold_start"] = "rbxassetid://18768627836"
b["chainsaw_handsaws_hold_loop"] = "rbxassetid://18768640190"
b["chainsaw_handsaws_hold_finish"] = "rbxassetid://18768647131"
b["chainsaw_buzzsaw_equip"] = "rbxassetid://104765805760754"
b["chainsaw_buzzsaw_idle"] = "rbxassetid://84690854234268"
b["chainsaw_buzzsaw_inspect"] = "rbxassetid://125038435858226"
b["chainsaw_buzzsaw_attack1"] = "rbxassetid://115238100942031"
b["chainsaw_buzzsaw_attack2"] = "rbxassetid://106271546194776"
b["chainsaw_buzzsaw_hold_start"] = "rbxassetid://72813856622105"
b["chainsaw_buzzsaw_hold_loop"] = "rbxassetid://71978100155149"
b["chainsaw_buzzsaw_hold_finish"] = "rbxassetid://84141669226809"
b["chainsaw_megadrill_equip"] = "rbxassetid://138372275073193"
b["chainsaw_megadrill_idle"] = "rbxassetid://140629755205961"
b["chainsaw_megadrill_inspect"] = "rbxassetid://100278468126849"
b["chainsaw_megadrill_attack1"] = "rbxassetid://91522107959844"
b["chainsaw_megadrill_attack2"] = "rbxassetid://124800571097886"
b["chainsaw_megadrill_hold_start"] = "rbxassetid://133316959169350"
b["chainsaw_megadrill_hold_loop"] = "rbxassetid://114437991323948"
b["chainsaw_megadrill_hold_finish"] = "rbxassetid://71679978204304"
b["bow_equip"] = "rbxassetid://13642496052"
b["bow_idle"] = "rbxassetid://13642501577"
b["bow_inspect"] = "rbxassetid://13642509258"
b["bow_shoot1"] = "rbxassetid://13642513747"
b["bow_reload"] = "rbxassetid://13642520989"
b["bow_charge"] = "rbxassetid://13676489206"
b["bow_charge_loop"] = "rbxassetid://13676495796"
b["bow_charge_release"] = "rbxassetid://13676498915"
b["bow_batbow_shoot1"] = "rbxassetid://13642513747"
b["bow_batbow_charge_release"] = "rbxassetid://13676498915"
b["bow_frostbitebow_equip"] = "rbxassetid://13642496052"
b["bow_frostbitebow_shoot1"] = "rbxassetid://13642513747"
b["bow_frostbitebow_charge_release"] = "rbxassetid://13676498915"
b["bow_dreambow_equip"] = "rbxassetid://13642496052"
b["bow_dreambow_shoot1"] = "rbxassetid://13642513747"
b["bow_dreambow_charge_release"] = "rbxassetid://13676498915"
b["bow_keybow_equip"] = "rbxassetid://136030150879596"
b["bow_keybow_idle"] = "rbxassetid://74371389482037"
b["bow_keybow_inspect"] = "rbxassetid://139932086040651"
b["bow_keybow_inspect_empty"] = "rbxassetid://130279781816659"
b["bow_keybow_inspect_rare"] = "rbxassetid://91971620850946"
b["bow_keybow_shoot1"] = "rbxassetid://125660443379764"
b["bow_keybow_reload"] = "rbxassetid://133326669224875"
b["bow_keybow_charge"] = "rbxassetid://131280856943088"
b["bow_keybow_charge_loop"] = "rbxassetid://122553378232337"
b["bow_keybow_charge_release"] = "rbxassetid://119256598220992"
b["bow_belovedbow_equip"] = "rbxassetid://13642496052"
b["bow_belovedbow_shoot1"] = "rbxassetid://13642513747"
b["bow_belovedbow_charge_release"] = "rbxassetid://13676498915"
b["bow_balloonbow_equip"] = "rbxassetid://13642496052"
b["bow_balloonbow_shoot1"] = "rbxassetid://13642513747"
b["bow_balloonbow_reload"] = "rbxassetid://13642520989"
b["bow_balloonbow_charge_release"] = "rbxassetid://13676498915"
b["katana_equip"] = "rbxassetid://13992707294"
b["katana_idle"] = "rbxassetid://13992711211"
b["katana_inspect"] = "rbxassetid://13992715669"
b["katana_inspect_rare"] = "rbxassetid://14411504784"
b["katana_attack1"] = "rbxassetid://13992724397"
b["katana_attack2"] = "rbxassetid://13992729204"
b["katana_deflect_loop"] = "rbxassetid://14761240825"
b["katana_deflect_idle"] = "rbxassetid://14761220206"
b["katana_deflect1"] = "rbxassetid://14761234917"
b["katana_deflect2"] = "rbxassetid://14761221711"
b["katana_deflect3"] = "rbxassetid://14761223422"
b["katana_deflect4"] = "rbxassetid://14761225204"
b["katana_deflect5"] = "rbxassetid://14761232380"
b["katana_saber_equip"] = "rbxassetid://13992707294"
b["katana_saber_inspect"] = "rbxassetid://13992715669"
b["katana_saber_inspect_rare"] = "rbxassetid://14411504784"
b["katana_saber_attack1"] = "rbxassetid://13992724397"
b["katana_saber_attack2"] = "rbxassetid://13992729204"
b["katana_saber_deflect_idle"] = "rbxassetid://14761220206"
b["katana_lightningbolt_equip"] = "rbxassetid://13992707294"
b["katana_lightningbolt_attack1"] = "rbxassetid://13992724397"
b["katana_lightningbolt_attack2"] = "rbxassetid://13992729204"
b["katana_lightningbolt_deflect_idle"] = "rbxassetid://14761220206"
b["katana_lightningbolt_inspect_rare"] = "rbxassetid://14411504784"
b["katana_pixelkatana_equip"] = "rbxassetid://122263627054963"
b["katana_pixelkatana_idle"] = "rbxassetid://125738633343752"
b["katana_pixelkatana_inspect"] = "rbxassetid://117465562832405"
b["katana_pixelkatana_inspect_rare"] = "rbxassetid://112998398756937"
b["katana_pixelkatana_attack1"] = "rbxassetid://126968210478839"
b["katana_pixelkatana_attack2"] = "rbxassetid://88862181003815"
b["katana_pixelkatana_deflect_idle"] = "rbxassetid://14761220206"
b["katana_devilstrident_attack1"] = "rbxassetid://13992724397"
b["katana_devilstrident_attack2"] = "rbxassetid://13992729204"
b["katana_keytana_equip"] = "rbxassetid://89039553556992"
b["katana_keytana_idle"] = "rbxassetid://113213899857455"
b["katana_keytana_inspect"] = "rbxassetid://90320152875293"
b["katana_keytana_inspect_rare"] = "rbxassetid://99791769251359"
b["katana_keytana_attack1"] = "rbxassetid://128078260433100"
b["katana_keytana_attack2"] = "rbxassetid://139279839095541"
b["katana_keytana_deflect_idle"] = "rbxassetid://90436105114997"
b["katana_keytana_deflect1"] = "rbxassetid://90797895557136"
b["katana_keytana_deflect2"] = "rbxassetid://77995180947430"
b["katana_keytana_deflect3"] = "rbxassetid://111943779640553"
b["katana_archkatana_equip"] = "rbxassetid://132067233727648"
b["katana_archkatana_idle"] = "rbxassetid://121111797899373"
b["katana_archkatana_inspect"] = "rbxassetid://119980219668284"
b["katana_archkatana_attack1"] = "rbxassetid://74282353959486"
b["katana_archkatana_attack2"] = "rbxassetid://74531272029155"
b["katana_archkatana_deflect_idle"] = "rbxassetid://131072510521727"
b["katana_archkatana_deflect1"] = "rbxassetid://132022220827223"
b["katana_archkatana_deflect2"] = "rbxassetid://116315405171252"
b["katana_archkatana_deflect3"] = "rbxassetid://110358509711635"
b["katana_archkatana_deflect4"] = "rbxassetid://98242486936084"
b["katana_archkatana_deflect5"] = "rbxassetid://81132288854196"
b["katana_crystalkatana_equip"] = "rbxassetid://86296007010026"
b["katana_crystalkatana_idle"] = "rbxassetid://97649815339773"
b["katana_crystalkatana_inspect"] = "rbxassetid://80311683206206"
b["katana_crystalkatana_attack1"] = "rbxassetid://140639286289428"
b["katana_crystalkatana_attack2"] = "rbxassetid://93640391159216"
b["katana_crystalkatana_deflect_idle"] = "rbxassetid://123293403148826"
b["katana_crystalkatana_deflect1"] = "rbxassetid://136354716301184"
b["katana_crystalkatana_deflect2"] = "rbxassetid://120567011479119"
b["katana_crystalkatana_deflect3"] = "rbxassetid://92502373956550"
b["katana_crystalkatana_deflect4"] = "rbxassetid://83541611040586"
b["katana_crystalkatana_deflect5"] = "rbxassetid://92773106977434"
b["katana_linkedsword_equip"] = "rbxassetid://13992707294"
b["katana_linkedsword_attack1"] = "rbxassetid://13992724397"
b["katana_linkedsword_attack2"] = "rbxassetid://13992729204"
b["katana_linkedsword_deflect_idle"] = "rbxassetid://14761220206"
b["katana_linkedsword_inspect"] = "rbxassetid://13992715669"
b["katana_linkedsword_inspect_rare"] = "rbxassetid://14411504784"
b["scythe_equip"] = "rbxassetid://14138291124"
b["scythe_idle"] = "rbxassetid://14098250940"
b["scythe_inspect"] = "rbxassetid://14098254579"
b["scythe_attack1"] = "rbxassetid://14098261698"
b["scythe_attack2"] = "rbxassetid://14098268759"
b["scythe_anchor_attack1"] = "rbxassetid://14098261698"
b["scythe_anchor_attack2"] = "rbxassetid://14098268759"
b["scythe_keythe_equip"] = "rbxassetid://14138291124"
b["scythe_keythe_attack1"] = "rbxassetid://14098261698"
b["scythe_keythe_attack2"] = "rbxassetid://14098268759"
b["scythe_batscythe_attack1"] = "rbxassetid://14098261698"
b["scythe_batscythe_attack2"] = "rbxassetid://14098268759"
b["scythe_cryoscythe_equip"] = "rbxassetid://14138291124"
b["scythe_cryoscythe_attack1"] = "rbxassetid://14098261698"
b["scythe_cryoscythe_attack2"] = "rbxassetid://14098268759"
b["scythe_bugnet_equip"] = "rbxassetid://72581859641113"
b["scythe_bugnet_idle"] = "rbxassetid://104640627790913"
b["scythe_bugnet_inspect"] = "rbxassetid://77903446956736"
b["scythe_bugnet_attack1"] = "rbxassetid://106103094958053"
b["scythe_bugnet_attack2"] = "rbxassetid://114793103297427"
b["scythe_crystalscythe_equip"] = "rbxassetid://121781045768080"
b["scythe_crystalscythe_idle"] = "rbxassetid://120563323644494"
b["scythe_crystalscythe_inspect"] = "rbxassetid://94820576007871"
b["scythe_crystalscythe_attack1"] = "rbxassetid://82483342316178"
b["scythe_crystalscythe_attack2"] = "rbxassetid://104468717779359"
b["scythe_crystalscythe_dash"] = "rbxassetid://121218508773058"
b["uzi_equip"] = "rbxassetid://14138257464"
b["uzi_idle"] = "rbxassetid://14138268430"
b["uzi_inspect"] = "rbxassetid://14138270478"
b["uzi_shoot1"] = "rbxassetid://14138281432"
b["uzi_reload"] = "rbxassetid://14138276657"
b["uzi_wateruzi_shoot1"] = "rbxassetid://14138281432"
b["uzi_electrouzi_shoot1"] = "rbxassetid://14138281432"
b["uzi_electrouzi_reload"] = "rbxassetid://14138276657"
b["uzi_demonuzi_shoot1"] = "rbxassetid://14138281432"
b["uzi_moneygun_equip"] = "rbxassetid://139001927579440"
b["uzi_moneygun_idle"] = "rbxassetid://107487391279233"
b["uzi_moneygun_inspect"] = "rbxassetid://76403055241854"
b["uzi_moneygun_shoot1"] = "rbxassetid://118788477258631"
b["uzi_moneygun_reload"] = "rbxassetid://96031828912967"
b["uzi_keyzi_equip"] = "rbxassetid://128245025878841"
b["uzi_keyzi_idle"] = "rbxassetid://114529536180921"
b["uzi_keyzi_inspect"] = "rbxassetid://128515067091034"
b["uzi_keyzi_shoot1"] = "rbxassetid://105713449228227"
b["uzi_keyzi_reload"] = "rbxassetid://119997151817807"
b["revolver_equip"] = "rbxassetid://14240512707"
b["revolver_idle"] = "rbxassetid://14240522872"
b["revolver_inspect"] = "rbxassetid://14240489357"
b["revolver_shoot1"] = "rbxassetid://14240539145"
b["revolver_reload"] = "rbxassetid://14240528877"
b["revolver_reload_empty"] = "rbxassetid://16044334617"
b["revolver_quickshot"] = "rbxassetid://17279511949"
b["revolver_deserteagle_equip"] = "rbxassetid://13154853798"
b["revolver_deserteagle_shoot1"] = "rbxassetid://13154881027"
b["revolver_deserteagle_shoot_final"] = "rbxassetid://13154885740"
b["revolver_deserteagle_reload"] = "rbxassetid://13154930776"
b["revolver_deserteagle_reload_empty"] = "rbxassetid://13154926508"
b["revolver_sheriff_equip"] = "rbxassetid://108300193907109"
b["revolver_sheriff_idle"] = "rbxassetid://99955048196277"
b["revolver_sheriff_inspect"] = "rbxassetid://131859054385320"
b["revolver_sheriff_shoot1"] = "rbxassetid://139945997186504"
b["revolver_sheriff_reload"] = "rbxassetid://108180442239756"
b["revolver_sheriff_reload_empty"] = "rbxassetid://104629734165265"
b["revolver_sheriff_quickshot"] = "rbxassetid://139945997186504"
b["revolver_boneclawrevolver_shoot1"] = "rbxassetid://14240539145"
b["revolver_boneclawrevolver_quickshot"] = "rbxassetid://17279511949"
b["revolver_peppermintsheriff_equip"] = "rbxassetid://108300193907109"
b["revolver_peppermintsheriff_idle"] = "rbxassetid://99955048196277"
b["revolver_peppermintsheriff_inspect"] = "rbxassetid://131859054385320"
b["revolver_peppermintsheriff_shoot1"] = "rbxassetid://139945997186504"
b["revolver_peppermintsheriff_reload"] = "rbxassetid://108180442239756"
b["revolver_peppermintsheriff_reload_empty"] = "rbxassetid://104629734165265"
b["revolver_peppermintsheriff_quickshot"] = "rbxassetid://139945997186504"
b["revolver_keyvolver_equip"] = "rbxassetid://84138589142138"
b["revolver_keyvolver_equip_empty"] = "rbxassetid://116651140159923"
b["revolver_keyvolver_idle"] = "rbxassetid://91577443060643"
b["revolver_keyvolver_idle_empty"] = "rbxassetid://140310580827476"
b["revolver_keyvolver_inspect"] = "rbxassetid://135350552290102"
b["revolver_keyvolver_inspect_empty"] = "rbxassetid://114774175871004"
b["revolver_keyvolver_shoot1"] = "rbxassetid://122075161812586"
b["revolver_keyvolver_shoot_final"] = "rbxassetid://124991831074522"
b["revolver_keyvolver_reload"] = "rbxassetid://76088917064213"
b["revolver_keyvolver_reload_empty"] = "rbxassetid://125324249312147"
b["revolver_keyvolver_quickshot"] = "rbxassetid://77315821032705"
b["revolver_peppergun_equip"] = "rbxassetid://97880134425387"
b["revolver_peppergun_equip_empty"] = "rbxassetid://79411410494868"
b["revolver_peppergun_idle"] = "rbxassetid://120830817971670"
b["revolver_peppergun_idle_empty"] = "rbxassetid://87131754536429"
b["revolver_peppergun_inspect"] = "rbxassetid://85960422993700"
b["revolver_peppergun_inspect_empty"] = "rbxassetid://83593711590927"
b["revolver_peppergun_shoot1"] = "rbxassetid://129218999592808"
b["revolver_peppergun_shoot_final"] = "rbxassetid://127096212738416"
b["revolver_peppergun_reload"] = "rbxassetid://113487790313668"
b["revolver_peppergun_reload_empty"] = "rbxassetid://135886692737051"
b["revolver_peppergun_quickshot"] = "rbxassetid://114281111962535"
b["grenade_equip"] = "rbxassetid://14509948480"
b["grenade_idle"] = "rbxassetid://14509967864"
b["grenade_inspect"] = "rbxassetid://14509964565"
b["grenade_throw"] = "rbxassetid://14514005799"
b["grenade_throw_pinpull"] = "rbxassetid://14513998818"
b["grenade_throw_start"] = "rbxassetid://14510034776"
b["grenade_throw_start_pinpull"] = "rbxassetid://14510062019"
b["grenade_throw_idle"] = "rbxassetid://14510038568"
b["grenade_throw_finish"] = "rbxassetid://14510046795"
b["grenade_lob"] = "rbxassetid://14510505277"
b["grenade_lob_pinpull"] = "rbxassetid://14510494068"
b["grenade_lob_start"] = "rbxassetid://14580355189"
b["grenade_lob_start_pinpull"] = "rbxassetid://14580344400"
b["grenade_lob_idle"] = "rbxassetid://14580363373"
b["grenade_lob_finish"] = "rbxassetid://14580368724"
b["grenade_pixelgrenade_equip"] = "rbxassetid://136753110631418"
b["grenade_pixelgrenade_idle"] = "rbxassetid://112806875793096"
b["grenade_pixelgrenade_inspect"] = "rbxassetid://85980282865176"
b["grenade_pixelgrenade_throw"] = "rbxassetid://74196837445450"
b["grenade_pixelgrenade_throw_pinpull"] = "rbxassetid://72376445277562"
b["grenade_pixelgrenade_throw_start"] = "rbxassetid://110382453361578"
b["grenade_pixelgrenade_throw_start_pinpull"] = "rbxassetid://95723786367696"
b["grenade_pixelgrenade_throw_idle"] = "rbxassetid://76082622582461"
b["grenade_pixelgrenade_throw_finish"] = "rbxassetid://82618724140198"
b["grenade_pixelgrenade_lob_start"] = "rbxassetid://88967588246666"
b["grenade_pixelgrenade_lob_start_pinpull"] = "rbxassetid://85676126167359"
b["grenade_pixelgrenade_lob_idle"] = "rbxassetid://129914905771608"
b["grenade_pixelgrenade_lob_finish"] = "rbxassetid://136262255050548"
b["grenade_jinglegrenade_equip"] = "rbxassetid://14509948480"
b["grenade_jinglegrenade_throw_finish"] = "rbxassetid://14510046795"
b["grenade_jinglegrenade_throw_start"] = "rbxassetid://14510034776"
b["grenade_jinglegrenade_lob_finish"] = "rbxassetid://14580368724"
b["grenade_jinglegrenade_lob_start"] = "rbxassetid://14580355189"
b["grenade_jinglegrenade_inspect"] = "rbxassetid://14509964565"
b["grenade_keynade_equip"] = "rbxassetid://99784649946058"
b["grenade_keynade_idle"] = "rbxassetid://138613177890181"
b["grenade_keynade_inspect"] = "rbxassetid://118832975932987"
b["grenade_keynade_throw_start_pinpull"] = "rbxassetid://123368854506447"
b["grenade_keynade_throw_idle"] = "rbxassetid://95887720657783"
b["grenade_keynade_throw_finish"] = "rbxassetid://98498351754343"
b["grenade_keynade_lob_finish"] = "rbxassetid://116760723605331"
b["grenade_cuddlebomb_equip"] = "rbxassetid://79844736691092"
b["grenade_cuddlebomb_idle"] = "rbxassetid://138764713369182"
b["grenade_cuddlebomb_inspect"] = "rbxassetid://108918206769010"
b["grenade_cuddlebomb_inspect_rare"] = "rbxassetid://101944532198318"
b["grenade_cuddlebomb_throw_start"] = "rbxassetid://80591312171092"
b["grenade_cuddlebomb_throw_idle"] = "rbxassetid://92373975604493"
b["grenade_cuddlebomb_throw_finish"] = "rbxassetid://131292616458723"
b["grenade_cuddlebomb_lob_start"] = "rbxassetid://111679328952975"
b["grenade_cuddlebomb_lob_idle"] = "rbxassetid://114315018470621"
b["grenade_cuddlebomb_lob_finish"] = "rbxassetid://78841131284533"
b["molotov_idle"] = "rbxassetid://14509967864"
b["molotov_coffee_inspect"] = "rbxassetid://17814343961"
b["molotov_hotcoals_equip"] = "rbxassetid://131765857557768"
b["molotov_hotcoals_idle"] = "rbxassetid://98354023638551"
b["molotov_hotcoals_lob_start"] = "rbxassetid://92022828926411"
b["molotov_hotcoals_lob_idle"] = "rbxassetid://139307957641580"
b["molotov_hotcoals_lob_finish"] = "rbxassetid://87253330127448"
b["molotov_hotcoals_throw_start"] = "rbxassetid://97142312196752"
b["molotov_hotcoals_throw_idle"] = "rbxassetid://105809346534293"
b["molotov_hotcoals_throw_finish"] = "rbxassetid://97185294334435"
b["molotov_lavalamp_idle"] = "rbxassetid://14509967864"
b["paintballgun_equip"] = "rbxassetid://17091614951"
b["paintballgun_idle"] = "rbxassetid://17091725958"
b["paintballgun_inspect"] = "rbxassetid://17091628355"
b["paintballgun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_reload"] = "rbxassetid://17091638436"
b["paintballgun_slimegun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_bobagun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_snowballgun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_ketchupgun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_paintballoongun_shoot1"] = "rbxassetid://17091647837"
b["paintballgun_paintballoongun_reload"] = "rbxassetid://17091638436"
b["slingshot_equip"] = "rbxassetid://17092021682"
b["slingshot_idle"] = "rbxassetid://17092028447"
b["slingshot_inspect"] = "rbxassetid://17092039611"
b["slingshot_shoot1"] = "rbxassetid://17092050680"
b["slingshot_harp_equip"] = "rbxassetid://80703656934772"
b["slingshot_harp_idle"] = "rbxassetid://100188043011775"
b["slingshot_harp_inspect"] = "rbxassetid://117975672707737"
b["slingshot_harp_shoot1"] = "rbxassetid://109678106217466"
b["trowel_equip"] = "rbxassetid://17131400507"
b["trowel_idle"] = "rbxassetid://17131421814"
b["trowel_inspect"] = "rbxassetid://17131449446"
b["trowel_attack1"] = "rbxassetid://17131431965"
b["trowel_attack2"] = "rbxassetid://17131442249"
b["trowel_build"] = "rbxassetid://17132520954"
b["minigun_equip"] = "rbxassetid://17245211573"
b["minigun_idle"] = "rbxassetid://17245230599"
b["minigun_inspect"] = "rbxassetid://17245250490"
b["minigun_charge_start"] = "rbxassetid://17246064123"
b["minigun_charge_loop"] = "rbxassetid://17246072427"
b["minigun_charge_finish"] = "rbxassetid://17246078139"
b["minigun_pixelminigun_equip"] = "rbxassetid://18768324323"
b["minigun_pixelminigun_idle"] = "rbxassetid://18768398606"
b["minigun_pixelminigun_inspect"] = "rbxassetid://18768368592"
b["minigun_pixelminigun_charge_start"] = "rbxassetid://18768403866"
b["minigun_pixelminigun_charge_loop"] = "rbxassetid://18768414513"
b["minigun_pixelminigun_charge_finish"] = "rbxassetid://18768408669"
b["minigun_wrappedminigun_equip"] = "rbxassetid://17245211573"
b["minigun_fighterjet_equip"] = "rbxassetid://127180554423985"
b["minigun_fighterjet_idle"] = "rbxassetid://119991591578295"
b["minigun_fighterjet_inspect"] = "rbxassetid://99090979665873"
b["minigun_fighterjet_charge_start"] = "rbxassetid://77199969923734"
b["minigun_fighterjet_charge_loop"] = "rbxassetid://72003025592807"
b["minigun_fighterjet_charge_finish"] = "rbxassetid://134137051449040"
b["flamethrower_equip"] = "rbxassetid://17256361728"
b["flamethrower_idle"] = "rbxassetid://17256378778"
b["flamethrower_inspect"] = "rbxassetid://17256382954"
b["flamethrower_pixelflamethrower_equip"] = "rbxassetid://17772124218"
b["flamethrower_pixelflamethrower_idle"] = "rbxassetid://17772126042"
b["flamethrower_pixelflamethrower_inspect"] = "rbxassetid://17772128766"
b["flamethrower_snowblower_equip"] = "rbxassetid://116031826092231"
b["flamethrower_snowblower_idle"] = "rbxassetid://90300148354924"
b["flamethrower_snowblower_inspect"] = "rbxassetid://109110552816250"
b["flamethrower_keythrower_equip"] = "rbxassetid://94165284906315"
b["flamethrower_keythrower_idle"] = "rbxassetid://100011231670833"
b["flamethrower_keythrower_inspect"] = "rbxassetid://115243339802018"
b["exogun_equip"] = "rbxassetid://17265973154"
b["exogun_idle"] = "rbxassetid://17265982767"
b["exogun_inspect"] = "rbxassetid://17265985966"
b["exogun_shoot1"] = "rbxassetid://17266006385"
b["exogun_reload"] = "rbxassetid://17266003293"
b["exogun_singularity_equip"] = "rbxassetid://17265973154"
b["exogun_singularity_shoot1"] = "rbxassetid://17266006385"
b["exogun_singularity_reload"] = "rbxassetid://17266003293"
b["exogun_repulsor_equip"] = "rbxassetid://125901748801913"
b["exogun_repulsor_idle"] = "rbxassetid://103876947002733"
b["exogun_repulsor_inspect"] = "rbxassetid://73631022862928"
b["exogun_repulsor_shoot1"] = "rbxassetid://70722132986776"
b["exogun_repulsor_reload"] = "rbxassetid://109054764128221"
b["grenadelauncher_equip"] = "rbxassetid://17274280065"
b["grenadelauncher_idle"] = "rbxassetid://17274286860"
b["grenadelauncher_inspect"] = "rbxassetid://17274309896"
b["grenadelauncher_shoot1"] = "rbxassetid://17274291035"
b["grenadelauncher_reload"] = "rbxassetid://17274297872"
b["grenadelauncher_snowballlauncher_equip"] = "rbxassetid://17274280065"
b["grenadelauncher_gearnadelauncher_equip"] = "rbxassetid://17274280065"
b["grenadelauncher_gearnadelauncher_inspect"] = "rbxassetid://17274309896"
b["grenadelauncher_gearnadelauncher_shoot1"] = "rbxassetid://17274291035"
b["grenadelauncher_gearnadelauncher_reload"] = "rbxassetid://17274297872"
b["grenadelauncher_skulllauncher_shoot1"] = "rbxassetid://17274291035"
b["grenadelauncher_balloonlauncher_equip"] = "rbxassetid://17274280065"
b["grenadelauncher_balloonlauncher_inspect"] = "rbxassetid://17274309896"
b["grenadelauncher_balloonlauncher_shoot1"] = "rbxassetid://17274291035"
b["grenadelauncher_balloonlauncher_reload"] = "rbxassetid://17274297872"
b["freezeray_equip"] = "rbxassetid://18428271717"
b["freezeray_idle"] = "rbxassetid://18428288807"
b["freezeray_inspect"] = "rbxassetid://18428284255"
b["freezeray_shoot1"] = "rbxassetid://18428279492"
b["freezeray_temporalray_shoot1"] = "rbxassetid://18428279492"
b["freezeray_bubbleray_equip"] = "rbxassetid://18428271717"
b["freezeray_spiderray_equip"] = "rbxassetid://94964889601885"
b["freezeray_spiderray_idle"] = "rbxassetid://113666394979264"
b["freezeray_spiderray_inspect"] = "rbxassetid://82328148880773"
b["freezeray_spiderray_shoot1"] = "rbxassetid://88213743409629"
b["freezeray_wrappedfreezeray_equip"] = "rbxassetid://18428271717"
b["satchel_equip"] = "rbxassetid://14509948480"
b["satchel_detonate"] = "rbxassetid://102330687628603"
b["satchel_advancedsatchel_detonate"] = "rbxassetid://102330687628603"
b["satchel_suspiciousgift_equip"] = "rbxassetid://14509948480"
b["satchel_potionsatchel_detonate"] = "rbxassetid://102330687628603"
b["elixir_equip"] = "rbxassetid://14509948480"
b["battleaxe_equip"] = "rbxassetid://85516047468034"
b["battleaxe_idle"] = "rbxassetid://108689983824240"
b["battleaxe_inspect"] = "rbxassetid://129465959541316"
b["battleaxe_attack1"] = "rbxassetid://109733633551931"
b["battleaxe_attack2"] = "rbxassetid://73035390792843"
b["battleaxe_spinattack"] = "rbxassetid://88842201450798"
b["battleaxe_theshred_inspect"] = "rbxassetid://119530424313850"
b["battleaxe_theshred_attack1"] = "rbxassetid://109733633551931"
b["battleaxe_theshred_attack2"] = "rbxassetid://73035390792843"
b["battleaxe_theshred_spinattack"] = "rbxassetid://88842201450798"
b["battleaxe_ceruleanaxe_attack1"] = "rbxassetid://109733633551931"
b["battleaxe_ceruleanaxe_attack2"] = "rbxassetid://73035390792843"
b["battleaxe_ceruleanaxe_spinattack"] = "rbxassetid://88842201450798"
b["battleaxe_mimicaxe_attack1"] = "rbxassetid://109733633551931"
b["battleaxe_mimicaxe_attack2"] = "rbxassetid://73035390792843"
b["battleaxe_mimicaxe_spinattack"] = "rbxassetid://88842201450798"
b["battleaxe_keyttleaxe_equip"] = "rbxassetid://134736048588578"
b["battleaxe_keyttleaxe_idle"] = "rbxassetid://94042066486965"
b["battleaxe_keyttleaxe_inspect"] = "rbxassetid://94531213270822"
b["battleaxe_keyttleaxe_attack1"] = "rbxassetid://118334586871272"
b["battleaxe_keyttleaxe_attack2"] = "rbxassetid://102851800593489"
b["battleaxe_keyttleaxe_spinattack"] = "rbxassetid://83184654306176"
b["battleaxe_balloonaxe_attack1"] = "rbxassetid://109733633551931"
b["battleaxe_balloonaxe_attack2"] = "rbxassetid://73035390792843"
b["battleaxe_balloonaxe_spinattack"] = "rbxassetid://88842201450798"
b["riotshield_equip"] = "rbxassetid://88688485300271"
b["riotshield_idle"] = "rbxassetid://113424922520630"
b["riotshield_inspect"] = "rbxassetid://123199510530979"
b["riotshield_attack1"] = "rbxassetid://123168926126302"
b["riotshield_attack2"] = "rbxassetid://107451146275032"
b["riotshield_energyshield_equip"] = "rbxassetid://88688485300271"
b["riotshield_energyshield_attack1"] = "rbxassetid://123168926126302"
b["riotshield_energyshield_attack2"] = "rbxassetid://107451146275032"
b["warhorn_equip"] = "rbxassetid://81951883744250"
b["warhorn_idle"] = "rbxassetid://78544849697314"
b["warhorn_inspect"] = "rbxassetid://118241731290742"
b["warhorn_use"] = "rbxassetid://120111163675397"
b["warhorn_trumpet_use"] = "rbxassetid://120111163675397"
b["warhorn_mammothhorn_use"] = "rbxassetid://120111163675397"
b["warhorn_megaphone_use"] = "rbxassetid://120111163675397"
b["warhorn_airhorn_use"] = "rbxassetid://120111163675397"
b["warhorn_boneclawhorn_equip"] = "rbxassetid://81951883744250"
b["warhorn_boneclawhorn_use"] = "rbxassetid://120111163675397"
b["daggers_equip"] = "rbxassetid://129248911141724"
b["daggers_idle"] = "rbxassetid://119886777451265"
b["daggers_inspect"] = "rbxassetid://76331161535117"
b["daggers_shoot1"] = "rbxassetid://136507313237137"
b["daggers_shoot2"] = "rbxassetid://91782309305074"
b["daggers_reload"] = "rbxassetid://129248911141724"
b["daggers_aces_shoot1"] = "rbxassetid://136507313237137"
b["daggers_aces_shoot2"] = "rbxassetid://91782309305074"
b["daggers_aces_reload"] = "rbxassetid://129248911141724"
b["daggers_cookies_reload"] = "rbxassetid://129248911141724"
b["daggers_crystaldaggers_equip"] = "rbxassetid://129248911141724"
b["daggers_crystaldaggers_inspect"] = "rbxassetid://76331161535117"
b["daggers_crystaldaggers_shoot1"] = "rbxassetid://136507313237137"
b["daggers_crystaldaggers_shoot2"] = "rbxassetid://91782309305074"
b["daggers_crystaldaggers_reload"] = "rbxassetid://129248911141724"
b["daggers_paperplanes_reload"] = "rbxassetid://129248911141724"
b["daggers_shurikens_shoot1"] = "rbxassetid://136507313237137"
b["daggers_shurikens_shoot2"] = "rbxassetid://91782309305074"
b["daggers_batdaggers_shoot1"] = "rbxassetid://136507313237137"
b["daggers_batdaggers_shoot2"] = "rbxassetid://91782309305074"
b["daggers_keynais_equip"] = "rbxassetid://92527815421098"
b["daggers_keynais_idle"] = "rbxassetid://95318866540833"
b["daggers_keynais_inspect"] = "rbxassetid://138921174963297"
b["daggers_keynais_shoot1"] = "rbxassetid://95472048087093"
b["daggers_keynais_shoot2"] = "rbxassetid://77149665703840"
b["daggers_keynais_reload"] = "rbxassetid://92527815421098"
b["daggers_brokenhearts_equip"] = "rbxassetid://129248911141724"
b["daggers_brokenhearts_shoot1"] = "rbxassetid://136507313237137"
b["daggers_brokenhearts_shoot2"] = "rbxassetid://91782309305074"
b["crossbow_equip"] = "rbxassetid://112687956509295"
b["crossbow_idle"] = "rbxassetid://104427457349511"
b["crossbow_inspect"] = "rbxassetid://133850935692254"
b["crossbow_shoot1"] = "rbxassetid://70595132902958"
b["crossbow_reload"] = "rbxassetid://110216216870037"
b["crossbow_pixelcrossbow_equip"] = "rbxassetid://103643750042150"
b["crossbow_pixelcrossbow_idle"] = "rbxassetid://106311811493877"
b["crossbow_pixelcrossbow_inspect"] = "rbxassetid://71813324759745"
b["crossbow_pixelcrossbow_shoot1"] = "rbxassetid://98701983274324"
b["crossbow_pixelcrossbow_reload"] = "rbxassetid://92452742658438"
b["crossbow_frostbitecrossbow_equip"] = "rbxassetid://112687956509295"
b["crossbow_frostbitecrossbow_shoot1"] = "rbxassetid://70595132902958"
b["crossbow_frostbitecrossbow_reload"] = "rbxassetid://110216216870037"
b["crossbow_harpooncrossbow_equip"] = "rbxassetid://113634615351386"
b["crossbow_harpooncrossbow_idle"] = "rbxassetid://100027877564133"
b["crossbow_harpooncrossbow_inspect"] = "rbxassetid://75870947119848"
b["crossbow_harpooncrossbow_shoot1"] = "rbxassetid://89736046636380"
b["crossbow_harpooncrossbow_reload"] = "rbxassetid://99318049380818"
b["crossbow_violincrossbow_shoot1"] = "rbxassetid://70595132902958"
b["crossbow_violincrossbow_reload"] = "rbxassetid://110216216870037"
b["crossbow_violincrossbow_idle"] = "rbxassetid://115670597903376"
b["crossbow_violincrossbow_inspect_rare"] = "rbxassetid://109479622157514"
b["crossbow_archcrossbow_equip"] = "rbxassetid://75912270381788"
b["crossbow_archcrossbow_idle"] = "rbxassetid://139012099919554"
b["crossbow_archcrossbow_inspect"] = "rbxassetid://76999540737871"
b["crossbow_archcrossbow_inspect_empty"] = "rbxassetid://117878629142097"
b["crossbow_archcrossbow_shoot1"] = "rbxassetid://133769779992853"
b["crossbow_archcrossbow_reload"] = "rbxassetid://107693118046922"
b["energyrifle_equip"] = "rbxassetid://72422642343011"
b["energyrifle_idle"] = "rbxassetid://75168005748198"
b["energyrifle_inspect"] = "rbxassetid://127570025528282"
b["energyrifle_shoot1"] = "rbxassetid://74256235556369"
b["energyrifle_hydrorifle_shoot1"] = "rbxassetid://74256235556369"
b["energyrifle_voidrifle_equip"] = "rbxassetid://72422642343011"
b["energyrifle_voidrifle_shoot1"] = "rbxassetid://74256235556369"
b["energyrifle_soulrifle_equip"] = "rbxassetid://72422642343011"
b["energyrifle_soulrifle_shoot1"] = "rbxassetid://74256235556369"
b["energypistols_equip"] = "rbxassetid://77364542705513"
b["energypistols_idle"] = "rbxassetid://138266300610910"
b["energypistols_inspect"] = "rbxassetid://79031054510997"
b["energypistols_shoot1"] = "rbxassetid://106792693952041"
b["energypistols_voidpistols_equip"] = "rbxassetid://77364542705513"
b["energypistols_voidpistols_inspect"] = "rbxassetid://79031054510997"
b["energypistols_voidpistols_shoot1"] = "rbxassetid://106792693952041"
b["energypistols_hydropistols_shoot1"] = "rbxassetid://106792693952041"
b["energypistols_soulpistols_equip"] = "rbxassetid://77364542705513"
b["energypistols_soulpistols_shoot1"] = "rbxassetid://106792693952041"
b["energypistols_hyperlaserguns_equip"] = "rbxassetid://77364542705513"
b["energypistols_hyperlaserguns_shoot1"] = "rbxassetid://106792693952041"
b["spray_equip"] = "rbxassetid://76039637184194"
b["spray_idle"] = "rbxassetid://72139594132723"
b["spray_inspect"] = "rbxassetid://101291746039853"
b["spray_shoot1"] = "rbxassetid://83184613322262"
b["spray_shoot_final"] = "rbxassetid://134694404748023"
b["spray_reload"] = "rbxassetid://78199986436723"
b["spray_reload_empty"] = "rbxassetid://105154405257700"
b["spray_nailgun_shoot1"] = "rbxassetid://83184613322262"
b["spray_nailgun_shoot_final"] = "rbxassetid://134694404748023"
b["spray_nailgun_reload_empty"] = "rbxassetid://114968443367098"
b["spray_spraybottle_equip"] = "rbxassetid://76039637184194"
b["spray_spraybottle_reload"] = "rbxassetid://122266428544149"
b["spray_spraybottle_reload_empty"] = "rbxassetid://130226847052923"
b["spray_spraybottle_shoot1"] = "rbxassetid://83184613322262"
b["spray_spraybottle_shoot_final"] = "rbxassetid://134694404748023"
b["spray_boneclawspray_shoot1"] = "rbxassetid://83184613322262"
b["spray_boneclawspray_shoot_final"] = "rbxassetid://134694404748023"
b["spray_keyspray_equip"] = "rbxassetid://97582090350123"
b["spray_keyspray_idle"] = "rbxassetid://106021363331171"
b["spray_keyspray_inspect"] = "rbxassetid://134721015932538"
b["spray_keyspray_shoot1"] = "rbxassetid://112716040145019"
b["spray_keyspray_shoot_final"] = "rbxassetid://121471178586540"
b["spray_keyspray_reload"] = "rbxassetid://97394747063759"
b["spray_keyspray_reload_empty"] = "rbxassetid://140179054239284"
b["gunblade_equip"] = "rbxassetid://109443635796450"
b["gunblade_idle"] = "rbxassetid://70930538484537"
b["gunblade_inspect"] = "rbxassetid://112290168704979"
b["gunblade_shoot1"] = "rbxassetid://123114191854550"
b["gunblade_to_blade"] = "rbxassetid://73564659275626"
b["gunblade_equip_blade"] = "rbxassetid://77281294634819"
b["gunblade_idle_blade"] = "rbxassetid://97599809082208"
b["gunblade_inspect_blade"] = "rbxassetid://90693818575970"
b["gunblade_attack1_blade"] = "rbxassetid://78583815320764"
b["gunblade_attack2_blade"] = "rbxassetid://137119092277962"
b["gunblade_attack_blade_onhit"] = "rbxassetid://76566021425065"
b["gunblade_to_gun"] = "rbxassetid://118759981666373"
b["gunblade_to_gun2"] = "rbxassetid://121447887775072"
b["gunblade_hypergunblade_shoot1"] = "rbxassetid://123114191854550"
b["gunblade_hypergunblade_attack1_blade"] = "rbxassetid://78583815320764"
b["gunblade_hypergunblade_attack2_blade"] = "rbxassetid://137119092277962"
b["gunblade_hypergunblade_attack_blade_onhit"] = "rbxassetid://76566021425065"
b["gunblade_gunsaw_equip"] = "rbxassetid://83479043029527"
b["gunblade_gunsaw_idle"] = "rbxassetid://78336147103235"
b["gunblade_gunsaw_inspect"] = "rbxassetid://126335573816531"
b["gunblade_gunsaw_shoot1"] = "rbxassetid://115667806905676"
b["gunblade_gunsaw_to_blade"] = "rbxassetid://134528487515364"
b["gunblade_gunsaw_equip_blade"] = "rbxassetid://101310388309220"
b["gunblade_gunsaw_idle_blade"] = "rbxassetid://109981344755854"
b["gunblade_gunsaw_inspect_blade"] = "rbxassetid://101811536364977"
b["gunblade_gunsaw_attack1_blade"] = "rbxassetid://133170263218164"
b["gunblade_gunsaw_attack2_blade"] = "rbxassetid://94739681534171"
b["gunblade_gunsaw_attack_blade_onhit"] = "rbxassetid://82424661220835"
b["gunblade_gunsaw_to_gun"] = "rbxassetid://129837116388793"
b["gunblade_gunsaw_to_gun2"] = "rbxassetid://103062631757945"
b["glasscannon_equip"] = "rbxassetid://124756351705623"
b["glasscannon_idle"] = "rbxassetid://139032149509780"
b["glasscannon_inspect"] = "rbxassetid://75217632595082"
b["glasscannon_shoot1"] = "rbxassetid://72629327841208"
b["scepter_equip"] = "rbxassetid://92503956908042"
b["scepter_idle"] = "rbxassetid://139364535120411"
b["scepter_inspect"] = "rbxassetid://104670697482252"
b["scepter_shoot1"] = "rbxassetid://131158883774652"
b["warper_equip"] = "rbxassetid://135982161639168"
b["warper_idle"] = "rbxassetid://72619181459840"
b["warper_inspect"] = "rbxassetid://140295106796455"
b["warper_shoot1"] = "rbxassetid://87109276416874"
b["warper_electropunkwarper_shoot1"] = "rbxassetid://87109276416874"
b["warper_hotelbell_equip"] = "rbxassetid://99406644405398"
b["warper_hotelbell_idle"] = "rbxassetid://125570761040083"
b["warper_hotelbell_inspect"] = "rbxassetid://85181104152247"
b["warper_hotelbell_shoot1"] = "rbxassetid://137751282854181"
b["warper_arcanewarper_equip"] = "rbxassetid://120554083589647"
b["warper_arcanewarper_idle"] = "rbxassetid://135582873090025"
b["warper_arcanewarper_inspect"] = "rbxassetid://105635099415734"
b["warper_arcanewarper_shoot1"] = "rbxassetid://124192662575806"
b["distortion_equip"] = "rbxassetid://85438719166528"
b["distortion_idle"] = "rbxassetid://111873368548470"
b["distortion_inspect"] = "rbxassetid://128045595599336"
b["distortion_inspect2"] = "rbxassetid://77474024880963"
b["distortion_shoot1"] = "rbxassetid://122042727533904"
b["distortion_electropunkdistortion_shoot1"] = "rbxassetid://122042727533904"
b["warpstone_warpeye_equip"] = "rbxassetid://136448352154525"
b["warpstone_warpeye_idle"] = "rbxassetid://127023134645174"
b["warpstone_warpeye_inspect"] = "rbxassetid://72124077534136"
b["warpstone_warpeye_throw_start"] = "rbxassetid://113379908468089"
b["warpstone_warpeye_throw_idle"] = "rbxassetid://78898486523965"
b["warpstone_warpeye_throw_finish"] = "rbxassetid://110454659256897"
b["warpstone_warpeye_lob_start"] = "rbxassetid://115710622911452"
b["warpstone_warpeye_lob_idle"] = "rbxassetid://95833970250310"
b["warpstone_warpeye_lob_finish"] = "rbxassetid://94841328368422"
b["warpstone_teleportdisc_equip"] = "rbxassetid://83325587921561"
b["warpstone_teleportdisc_idle"] = "rbxassetid://83126250721355"
b["warpstone_teleportdisc_inspect"] = "rbxassetid://81463244149507"
b["warpstone_teleportdisc_throw_start"] = "rbxassetid://101835359363518"
b["warpstone_teleportdisc_throw_idle"] = "rbxassetid://82002899960688"
b["warpstone_teleportdisc_throw_finish"] = "rbxassetid://82372984543974"
b["warpstone_teleportdisc_lob_start"] = "rbxassetid://101835359363518"
b["warpstone_teleportdisc_lob_idle"] = "rbxassetid://82002899960688"
b["warpstone_teleportdisc_lob_finish"] = "rbxassetid://122981652688266"
b["warpstone_warpstar_equip"] = "rbxassetid://125008724396129"
b["warpstone_warpstar_idle"] = "rbxassetid://72494043407021"
b["warpstone_warpstar_inspect"] = "rbxassetid://133261026901410"
b["warpstone_warpstar_throw_start"] = "rbxassetid://136311704296058"
b["warpstone_warpstar_throw_idle"] = "rbxassetid://125411282290620"
b["warpstone_warpstar_throw_finish"] = "rbxassetid://85806895988629"
b["warpstone_warpstar_lob_start"] = "rbxassetid://136311704296058"
b["warpstone_warpstar_lob_idle"] = "rbxassetid://125411282290620"
b["warpstone_warpstar_lob_finish"] = "rbxassetid://120087768543628"
b["subspacetripmine_equip"] = "rbxassetid://94365547657211"
b["subspacetripmine_idle"] = "rbxassetid://92088543519542"
b["subspacetripmine_inspect"] = "rbxassetid://137491701790888"
b["subspacetripmine_use"] = "rbxassetid://129840517161835"
b["rngdice_equip"] = "rbxassetid://91881102017810"
b["rngdice_idle"] = "rbxassetid://98915052561603"
b["rngdice_inspect"] = "rbxassetid://135632661338689"
b["rngdice_use"] = "rbxassetid://119412082511275"
b["jumppad_equip"] = "rbxassetid://81670481604070"
b["jumppad_idle"] = "rbxassetid://138434956891886"
b["jumppad_inspect"] = "rbxassetid://79606174504414"
b["jumppad_use"] = "rbxassetid://100465502825461"
b["maul_equip"] = "rbxassetid://86001036209496"
b["maul_idle"] = "rbxassetid://87042341232425"
b["maul_inspect"] = "rbxassetid://93658927351349"
b["maul_attack1"] = "rbxassetid://106604256709247"
b["maul_attack2"] = "rbxassetid://89749875065644"
b["maul_charge_intro"] = "rbxassetid://74483042385971"
b["maul_charge_loop"] = "rbxassetid://107266465204815"
b["maul_charge_outro"] = "rbxassetid://105628753095053"
b["maul_slam_intro"] = "rbxassetid://123193601075296"
b["maul_slam_loop"] = "rbxassetid://87254412149828"
b["maul_slam_outro"] = "rbxassetid://98778214016089"
b["maul_sleighmaul_attack1"] = "rbxassetid://106604256709247"
b["maul_sleighmaul_attack2"] = "rbxassetid://89749875065644"
b["maul_sleighmaul_charge_outro"] = "rbxassetid://105628753095053"
b["maul_banhammer_attack1"] = "rbxassetid://106604256709247"
b["maul_banhammer_attack2"] = "rbxassetid://89749875065644"
b["permafrost_equip"] = "rbxassetid://135788901539002"
b["permafrost_idle"] = "rbxassetid://101235694402253"
b["permafrost_inspect"] = "rbxassetid://140544068349290"
b["permafrost_shoot1"] = "rbxassetid://109487359043648"
b["permafrost_reload"] = "rbxassetid://72943194687792"
b["permafrost_throw"] = "rbxassetid://132291298412377"
end
local a = {}
for ey, id in pairs(b) do
if not a[id] then
a[id] = ey
end
end
local ap = {
["Assault Rifle"] = "assaultrifle",
["Bow"] = "bow",
["Burst Rifle"] = "burstrifle",
["Chainsaw"] = "chainsaw",
["RPG"] = "rpg",
["Exogun"] = "exogun",
["Fists"] = "fists",
["Flamethrower"] = "flamethrower",
["Flare Gun"] = "flaregun",
["Freeze Ray"] = "freezeray",
["Grenade"] = "grenade",
["Grenade Launcher"] = "grenadelauncher",
["Handgun"] = "handgun",
["Katana"] = "katana",
["Minigun"] = "minigun",
["Paintball Gun"] = "paintballgun",
["Revolver"] = "revolver",
["Slingshot"] = "slingshot",
["Subspace Tripmine"] = "subspacetripmine",
["Uzi"] = "uzi",
["Sniper"] = "sniper",
["Knife"] = "knife",
["Shotgun"] = "shotgun",
["Crossbow"] = "crossbow",
["Daggers"] = "daggers",
["Distortion"] = "distortion",
["Energy Rifle"] = "energyrifle",
["Energy Pistols"] = "energypistols",
["Gunblade"] = "gunblade",
["Battle Axe"] = "battleaxe",
["Riot Shield"] = "riotshield",
["Scythe"] = "scythe",
["Trowel"] = "trowel",
["Medkit"] = "medkit",
["Molotov"] = "molotov",
["Satchel"] = "satchel",
["Smoke Grenade"] = "smokegrenade",
["War Horn"] = "warhorn",
["Warpstone"] = "warpstone",
["Flashbang"] = "flashbang",
["Jump Pad"] = "jumppad",
["Warper"] = "warper",
["Shorty"] = "shorty",
["Maul"] = "maul",
["Spray"] = "spray",
["Permafrost"] = "permafrost",
}
local function fb(gx)
return gx:lower():gsub("[^%a%d]", "")
end
local dz = {}
local function dt(ew, iv)
if dz[ew] then return end
dz[ew] = true
local fs = ap[iv]
if not fs then return end
local be
pcall(function()
local ax = ew:WaitForChild("AnimationController", 5)
if ax then be = ax:WaitForChild("Animator", 5) end
end)
if not be then return end
local ee = {}
local df = fs .. "_"
local function hv(hr)
if not hr or not hr.Animation then return end
local bb = hr.Animation.AnimationId
if ee[bb] then return end
local bc = a[bb]
if not bc then return end
if bc:sub(1, #df) ~= df then return end
local co = ai.ActiveSkins[iv]
if not co or co == "Default" then return end
local fa = fb(co)
local bd = bc:sub(#df + 1)
local ha = fs .. "_" .. normalSkin .. "_" .. animType
local gz = b[ha]
if not gz or gz == bb then return end
ee[gz] = true
hr:Stop(0)
local gy = Instance.new("Animation")
gy.AnimationId = gz
local hd = be:LoadAnimation(gy)
hd.Looped = hr.Looped
hd:Play(0)
hd.Stopped:Connect(function()
ee[gz] = nil
end)
end
be.AnimationPlayed:Connect(hv)
for _, hr in ipairs(be:GetPlayingAnimationTracks()) do
hv(hr)
end
end
task.spawn(function()
local ii = workspace:WaitForChild("ViewModels", 15)
if not ii then return end
local dj = ii:WaitForChild("FirstPerson", 10)
if not dj then return end
local function hu(ew)
if not ew:IsA("Model") then return end
local ix = ew.Name:match("^.+ %- (.+) %- .+$")
if ix and ap[ix] then
task.spawn(dt, ew, ix)
end
end
for _, bz in ipairs(dj:GetChildren()) do
hu(bz)
end
dj.ChildAdded:Connect(hu)
end)
