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
        ['2'] = "Metalik Siyah ??elik",
        ['3'] = "Metalik Siyah G??m????",
        ['4'] = "Metalik G??m????",
        ['5'] = "Metalik Mavi G??m????",
        ['6'] = "Metalik ??elik Gri",
        ['7'] = "Metalik G??lge G??m????",
        ['8'] = "Metalik Kaya G??m????",
        ['9'] = "Metalik Gece Yar??s?? G??m????",
        ['10'] = "Metalik Silah Metal",
        ['11'] = "Metalik Antrasit Gri",
        ['12'] = "Mat Siyah",
        ['13'] = "Mat Gri",
        ['14'] = "Mat I????k Gri",
        ['15'] = "Util Siyah",
        ['16'] = "Util Siyah Poli",
        ['17'] = "Util Siyah G??m????",
        ['18'] = "Util G??m????",
        ['19'] = "Util Silah Metal",
        ['20'] = "Util G??lge G??m????",
        ['21'] = "Y??pranm???? Siyah",
        ['22'] = "Y??pranm???? Grafit",
        ['23'] = "Y??pranm???? G??m???? Gri",
        ['24'] = "Y??pranm???? G??m????",
        ['25'] = "Y??pranm???? Mavi G??m????",
        ['26'] = "Y??pranm???? G??lge G??m????",
        ['27'] = "Metalik K??rm??z??",
        ['28'] = "Metalik Torino K??rm??z??",
        ['29'] = "Metalik Formula K??rm??z??",
        ['30'] = "Metalik Alev K??rm??z??",
        ['31'] = "Metalik Zarif K??rm??z??",
        ['32'] = "Metalik Granat K??rm??z??",
        ['33'] = "Metalik ????l K??rm??z??",
        ['34'] = "Metalik Cabernet K??rm??z??",
        ['35'] = "Metalik ??eker K??rm??z??",
        ['36'] = "Metalik G??ne?? Turuncu",
        ['37'] = "Metalik Klasik Alt??n",
        ['38'] = "Metalik Turuncu",
        ['39'] = "Mat K??rm??z??",
        ['40'] = "Mat Siyah K??rm??z??",
        ['41'] = "Mat Turuncu",
        ['42'] = "Mat Sar??",
        ['43'] = "Util K??rm??z??",
        ['44'] = "Util Parlak K??rm??z??",
        ['45'] = "Util Granat K??rm??z??",
        ['46'] = "Y??pranm???? K??rm??z??",
        ['47'] = "Y??pranm???? Alt??n K??rm??z??",
        ['48'] = "Y??pranm???? Siyah K??rm??z??",
        ['49'] = "Metalik Siyah Ye??il",
        ['50'] = "Metalik Yar???? Ye??il",
        ['51'] = "Metalik Deniz Ye??il",
        ['52'] = "Metalik Zeytin Ye??il",
        ['53'] = "Metalik Ye??il",
        ['54'] = "Metalik Benzin Mavi Ye??il",
        ['55'] = "Mat Limon Ye??il",
        ['56'] = "Util Siyah Ye??il",
        ['57'] = "Util Ye??il",
        ['58'] = "Y??pranm???? Siyah Ye??il",
        ['59'] = "Y??pranm???? Ye??il",
        ['60'] = "Y??pranm???? Deniz Y??kama",
        ['61'] = "Metalik Gece yar??s?? Mavi",
        ['62'] = "Metalik Siyah Mavi",
        ['63'] = "Metalik Saxony Mavi",
        ['64'] = "Metalik Mavi",
        ['65'] = "Metalik Denizi Mavi",
        ['66'] = "Metalik Limon Mavi",
        ['67'] = "Metalik Elmas Mavi",
        ['68'] = "Metalik S??rf Mavi",
        ['69'] = "Metalik Deniz Mavi",
        ['70'] = "Metalik Parlak Mavi",
        ['71'] = "Metalik Mor Mavi",
        ['72'] = "Metalik F??r??ldak Mavi",
        ['73'] = "Metalik Ultra Mavi",
        ['74'] = "Metalik Parlak Mavi",
        ['75'] = "Util Siyah Mavi",
        ['76'] = "Util Gece yar??s?? Mavi",
        ['77'] = "Util Mavi",
        ['78'] = "Util Deniz K??p?????? Mavi",
        ['79'] = "Uil Y??ld??r??m Mavi",
        ['80'] = "Util Maui Mavi Poli",
        ['81'] = "Util Parlak Mavi",
        ['82'] = "Mat Siyah Mavi",
        ['83'] = "Mat Mavi",
        ['84'] = "Mat Gece yar??s?? Mavi",
        ['85'] = "Y??pranm???? Siyah Mavi",
        ['86'] = "Y??pranm???? Mavi",
        ['87'] = "Y??pranm???? I????k Mavi",
        ['88'] = "Metalik Taxi Sar??",
        ['89'] = "Metalik Yar???? Sar??",
        ['90'] = "Metalik Bronz",
        ['91'] = "Metalik Sar?? Ku??",
        ['92'] = "Metalik Limon",
        ['93'] = "Metalik ??ampanya",
        ['94'] = "Metalik Pueblo Bej",
        ['95'] = "Metalik Siyah Fildi??i",
        ['96'] = "Metalik ??ikolata Kahverengi",
        ['97'] = "Metalik Alt??nen Kahverengi",
        ['98'] = "Metalik I????k Kahverengi",
        ['99'] = "Metalik Pipet Bej",
        ['100'] = "Metalik Moss Kahverengi",
        ['101'] = "Metalik Biston Kahverengi",
        ['102'] = "Metalik Beechwood",
        ['103'] = "Metalik Siyah Beechwood",
        ['104'] = "Metalik ??ikolata Turuncu",
        ['105'] = "Metalik Beach Sand",
        ['106'] = "Metalik Sun Bleeched Sand",
        ['107'] = "Metalik Krem",
        ['108'] = "Util Kahverengi",
        ['109'] = "Util Medium Kahverengi",
        ['110'] = "Util I????k Kahverengi",
        ['111'] = "Metalik Beyaz",
        ['112'] = "Metalik Don Beyaz",
        ['113'] = "Y??pranm???? Bal Bej",
        ['114'] = "Y??pranm???? Kahverengi",
        ['115'] = "Y??pranm???? Siyah Kahverengi",
        ['116'] = "Y??pranm???? Pipet Bej",
        ['117'] = "F??r??alanm???? ??elik",
        ['118'] = "F??r??alanm???? Siyah ??elik",
        ['119'] = "F??r??alanm???? Aliminyum",
        ['120'] = "Krom",
        ['121'] = "Y??pranm???? Off Beyaz",
        ['122'] = "Util Off Beyaz",
        ['123'] = "Y??pranm???? Turuncu",
        ['124'] = "Y??pranm???? I????k Turuncu",
        ['125'] = "Metalik G??venlik Ye??il",
        ['126'] = "Y??pranm???? Taxi Sar??",
        ['127'] = "Polis Ara?? Mavi",
        ['128'] = "Mat Ye??il",
        ['129'] = "Mat Kahverengi",
        ['130'] = "Y??pranm???? Turuncu",
        ['131'] = "Mat Beyaz",
        ['132'] = "Y??pranm???? Beyaz",
        ['133'] = "Y??pranm???? Zeytin Army Ye??il",
        ['134'] = "Saf Beyaz",
        ['135'] = "S??cak Pembe",
        ['136'] = "Somon Pembe",
        ['137'] = "Metalik Vermillion Pembe",
        ['138'] = "Turuncu",
        ['139'] = "Ye??il",
        ['140'] = "Mavi",
        ['141'] = "Metalik Siyah Mavi",
        ['142'] = "Metalik Siyah Mor",
        ['143'] = "Metalik Siyah Red",
        ['144'] = "Avc?? Ye??il",
        ['145'] = "Metalik Mor",
        ['146'] = "Metalik Siyah Mavi",
        ['147'] = "Siyah",
        ['148'] = "Mat Mor",
        ['149'] = "Mat Siyah Mor",
        ['150'] = "Metalik Lav Red",
        ['151'] = "Mat Orman Ye??il",
        ['152'] = "Mat Zeytin",
        ['153'] = "Mat ????l Kahverengi",
        ['154'] = "Mat ????l Tan",
        ['155'] = "Mat Yaprak Ye??il",
        ['156'] = "Ala????m Rengi",
        ['157'] = "Epsilon Mavi",
        ['158'] = "Saf Alt??n",
        ['159'] = "F??r??alanm???? Alt??n",
        ['160'] = "MP100"
    }

end)
