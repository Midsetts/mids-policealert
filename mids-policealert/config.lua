Config = {}
Config.Enable = {}
Config.Timer = {}

---------------------------------------------------------------
Config.Locale = 'en'
Config.CheckVersion = false
Config.CheckVersionDelay = 60 -- Minutes

-- use phone_number instead of player name for 911 calls
Config.PhoneNumber = false

-- use mdt notifications for 911 calls instead of WF_Alerts
Config.Default911 = true

-- enable alerts when cops break the law and print to console
Config.Debug = false

-- sets report chance to 100%
Config.DebugChance = true

-- enable default alerts
Config.Enable.Speeding = false
Config.Enable.Shooting = true
Config.Enable.Autotheft = true
Config.Enable.Melee = true
Config.Enable.PlayerDowned = true
---------------------------------------------------------------

Citizen.CreateThread(function()
    if not GetPlayerPed(-1) then return end
    while not firstname do
        Citizen.Wait(10)
    end

    if notLoaded then
        for k, v in pairs(Config.Enable) do
            if Config.Enable[k] ~= false then
                Config[k] = {}
                Config.Timer[k] = 0 -- Default to 0 seconds
                Config[k].Success = 300 -- Default to 30 seconds
                Config[k].Fail = 20 -- Default to 2 seconds
            end
        end
        -- If you want to set specific timers, do it here
        if Config.Shooting then
            Config.Shooting.Success = 100 -- 10 seconds
            Config.Shooting.Fail = 0 -- 0 seconds
        end
            
        notLoaded = nil
    end

    Config.WeaponBlacklist = {
        'WEAPON_GRENADE',
        'WEAPON_BZGAS',
        'WEAPON_MOLOTOV',
        'WEAPON_STICKYBOMB',
        'WEAPON_PROXMINE',
        'WEAPON_SNOWBALL',
        'WEAPON_PIPEBOMB',
        'WEAPON_BALL',
        'WEAPON_SMOKEGRENADE',
        'WEAPON_FLARE',
        'WEAPON_PETROLCAN',
        'WEAPON_FIREEXTINGUISHER',
        'WEAPON_HAZARDCAN',
        'WEAPON_RAYCARBINE',
        'WEAPON_STUNGUN',
        'WEAPON_MUSKET'
    }

    Config.Colours = {
        ['0'] = "Metalik Siyah",
        ['1'] = "Metalik Grafit Siyah",
        ['2'] = "Metalik Siyah Çelik",
        ['3'] = "Metalik Siyah Gümüş",
        ['4'] = "Metalik Gümüş",
        ['5'] = "Metalik Mavi Gümüş",
        ['6'] = "Metalik Çelik Gri",
        ['7'] = "Metalik Gölge Gümüş",
        ['8'] = "Metalik Kaya Gümüş",
        ['9'] = "Metalik Gece Yarısı Gümüş",
        ['10'] = "Metalik Silah Metal",
        ['11'] = "Metalik Antrasit Gri",
        ['12'] = "Mat Siyah",
        ['13'] = "Mat Gri",
        ['14'] = "Mat Işık Gri",
        ['15'] = "Util Siyah",
        ['16'] = "Util Siyah Poli",
        ['17'] = "Util Siyah Gümüş",
        ['18'] = "Util Gümüş",
        ['19'] = "Util Silah Metal",
        ['20'] = "Util Gölge Gümüş",
        ['21'] = "Yıpranmış Siyah",
        ['22'] = "Yıpranmış Grafit",
        ['23'] = "Yıpranmış Gümüş Gri",
        ['24'] = "Yıpranmış Gümüş",
        ['25'] = "Yıpranmış Mavi Gümüş",
        ['26'] = "Yıpranmış Gölge Gümüş",
        ['27'] = "Metalik Kırmızı",
        ['28'] = "Metalik Torino Kırmızı",
        ['29'] = "Metalik Formula Kırmızı",
        ['30'] = "Metalik Alev Kırmızı",
        ['31'] = "Metalik Zarif Kırmızı",
        ['32'] = "Metalik Granat Kırmızı",
        ['33'] = "Metalik Çöl Kırmızı",
        ['34'] = "Metalik Cabernet Kırmızı",
        ['35'] = "Metalik Şeker Kırmızı",
        ['36'] = "Metalik Güneş Turuncu",
        ['37'] = "Metalik Klasik Altın",
        ['38'] = "Metalik Turuncu",
        ['39'] = "Mat Kırmızı",
        ['40'] = "Mat Siyah Kırmızı",
        ['41'] = "Mat Turuncu",
        ['42'] = "Mat Sarı",
        ['43'] = "Util Kırmızı",
        ['44'] = "Util Parlak Kırmızı",
        ['45'] = "Util Granat Kırmızı",
        ['46'] = "Yıpranmış Kırmızı",
        ['47'] = "Yıpranmış Altın Kırmızı",
        ['48'] = "Yıpranmış Siyah Kırmızı",
        ['49'] = "Metalik Siyah Yeşil",
        ['50'] = "Metalik Yarış Yeşil",
        ['51'] = "Metalik Deniz Yeşil",
        ['52'] = "Metalik Zeytin Yeşil",
        ['53'] = "Metalik Yeşil",
        ['54'] = "Metalik Benzin Mavi Yeşil",
        ['55'] = "Mat Limon Yeşil",
        ['56'] = "Util Siyah Yeşil",
        ['57'] = "Util Yeşil",
        ['58'] = "Yıpranmış Siyah Yeşil",
        ['59'] = "Yıpranmış Yeşil",
        ['60'] = "Yıpranmış Deniz Yıkama",
        ['61'] = "Metalik Gece yarısı Mavi",
        ['62'] = "Metalik Siyah Mavi",
        ['63'] = "Metalik Saxony Mavi",
        ['64'] = "Metalik Mavi",
        ['65'] = "Metalik Denizi Mavi",
        ['66'] = "Metalik Limon Mavi",
        ['67'] = "Metalik Elmas Mavi",
        ['68'] = "Metalik Sörf Mavi",
        ['69'] = "Metalik Deniz Mavi",
        ['70'] = "Metalik Parlak Mavi",
        ['71'] = "Metalik Mor Mavi",
        ['72'] = "Metalik Fırıldak Mavi",
        ['73'] = "Metalik Ultra Mavi",
        ['74'] = "Metalik Parlak Mavi",
        ['75'] = "Util Siyah Mavi",
        ['76'] = "Util Gece yarısı Mavi",
        ['77'] = "Util Mavi",
        ['78'] = "Util Deniz Köpüğü Mavi",
        ['79'] = "Uil Yıldırım Mavi",
        ['80'] = "Util Maui Mavi Poli",
        ['81'] = "Util Parlak Mavi",
        ['82'] = "Mat Siyah Mavi",
        ['83'] = "Mat Mavi",
        ['84'] = "Mat Gece yarısı Mavi",
        ['85'] = "Yıpranmış Siyah Mavi",
        ['86'] = "Yıpranmış Mavi",
        ['87'] = "Yıpranmış Işık Mavi",
        ['88'] = "Metalik Taxi Sarı",
        ['89'] = "Metalik Yarış Sarı",
        ['90'] = "Metalik Bronz",
        ['91'] = "Metalik Sarı Kuş",
        ['92'] = "Metalik Limon",
        ['93'] = "Metalik Şampanya",
        ['94'] = "Metalik Pueblo Bej",
        ['95'] = "Metalik Siyah Fildişi",
        ['96'] = "Metalik Çikolata Kahverengi",
        ['97'] = "Metalik Altınen Kahverengi",
        ['98'] = "Metalik Işık Kahverengi",
        ['99'] = "Metalik Pipet Bej",
        ['100'] = "Metalik Moss Kahverengi",
        ['101'] = "Metalik Biston Kahverengi",
        ['102'] = "Metalik Beechwood",
        ['103'] = "Metalik Siyah Beechwood",
        ['104'] = "Metalik Çikolata Turuncu",
        ['105'] = "Metalik Beach Sand",
        ['106'] = "Metalik Sun Bleeched Sand",
        ['107'] = "Metalik Krem",
        ['108'] = "Util Kahverengi",
        ['109'] = "Util Medium Kahverengi",
        ['110'] = "Util Işık Kahverengi",
        ['111'] = "Metalik Beyaz",
        ['112'] = "Metalik Don Beyaz",
        ['113'] = "Yıpranmış Bal Bej",
        ['114'] = "Yıpranmış Kahverengi",
        ['115'] = "Yıpranmış Siyah Kahverengi",
        ['116'] = "Yıpranmış Pipet Bej",
        ['117'] = "Fırçalanmış Çelik",
        ['118'] = "Fırçalanmış Siyah Çelik",
        ['119'] = "Fırçalanmış Aliminyum",
        ['120'] = "Krom",
        ['121'] = "Yıpranmış Off Beyaz",
        ['122'] = "Util Off Beyaz",
        ['123'] = "Yıpranmış Turuncu",
        ['124'] = "Yıpranmış Işık Turuncu",
        ['125'] = "Metalik Güvenlik Yeşil",
        ['126'] = "Yıpranmış Taxi Sarı",
        ['127'] = "Polis Araç Mavi",
        ['128'] = "Mat Yeşil",
        ['129'] = "Mat Kahverengi",
        ['130'] = "Yıpranmış Turuncu",
        ['131'] = "Mat Beyaz",
        ['132'] = "Yıpranmış Beyaz",
        ['133'] = "Yıpranmış Zeytin Army Yeşil",
        ['134'] = "Saf Beyaz",
        ['135'] = "Sıcak Pembe",
        ['136'] = "Somon Pembe",
        ['137'] = "Metalik Vermillion Pembe",
        ['138'] = "Turuncu",
        ['139'] = "Yeşil",
        ['140'] = "Mavi",
        ['141'] = "Metalik Siyah Mavi",
        ['142'] = "Metalik Siyah Mor",
        ['143'] = "Metalik Siyah Red",
        ['144'] = "Avcı Yeşil",
        ['145'] = "Metalik Mor",
        ['146'] = "Metalik Siyah Mavi",
        ['147'] = "Siyah",
        ['148'] = "Mat Mor",
        ['149'] = "Mat Siyah Mor",
        ['150'] = "Metalik Lav Red",
        ['151'] = "Mat Orman Yeşil",
        ['152'] = "Mat Zeytin",
        ['153'] = "Mat Çöl Kahverengi",
        ['154'] = "Mat Çöl Tan",
        ['155'] = "Mat Yaprak Yeşil",
        ['156'] = "Alaşım Rengi",
        ['157'] = "Epsilon Mavi",
        ['158'] = "Saf Altın",
        ['159'] = "Fırçalanmış Altın",
        ['160'] = "MP100"
    }

end)
