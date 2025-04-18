local song_timers = {}

song_buffs = {
    [195] = 'paeon',
    [196] = 'ballad',
    [197] = 'minne',
    [198] = 'minuet',
    [199] = 'madrigal',
    [200] = 'prelude',
    [201] = 'mambo',
    [202] = 'aubade',
    [203] = 'pastoral',
    [205] = 'fantasia',
    [206] = 'operetta',
    [207] = 'capriccio',
    [209] = 'round',
    [210] = 'gavotte',
	[213] = 'aira',
    [214] = 'march',
    [215] = 'etude',
    [216] = 'carol',
    [218] = 'hymnus',
    [219] = 'mazurka',
    [220] = 'sirvente',
    [221] = 'dirge',
    [222] = 'scherzo',
    }

local equip_mods = {
    [18342] = {0.2},            -- 'Gjallarhorn',    -- 75
    [18577] = {0.2},            -- 'Gjallarhorn',    -- 80
    [18578] = {0.2},            -- 'Gjallarhorn',    -- 85
    [18579] = {0.3},            -- 'Gjallarhorn',    -- 90
    [18580] = {0.3},            -- 'Gjallarhorn',    -- 95
    [18572] = {0.4},            -- 'Gjallarhorn',    -- 99
    [18840] = {0.4},            -- 'Gjallarhorn',    -- 99-2
    [18575] = {0.25},           -- 'Daurdabla',      -- 90
    [18576] = {0.25},           -- 'Daurdabla',      -- 95
    [18571] = {0.3},            -- 'Daurdabla',      -- 99
    [18839] = {0.3},            -- 'Daurdabla',      -- 99-2
    [19000] = {0.1},            -- 'Carnwenhan',     -- 75
    [19069] = {0.2},            -- 'Carnwenhan',     -- 80
    [19089] = {0.3},            -- 'Carnwenhan',     -- 85
    [19621] = {0.4},            -- 'Carnwenhan',     -- 90
    [19719] = {0.4},            -- 'Carnwenhan',     -- 95
    [19828] = {0.5},            -- 'Carnwenhan',     -- 99
    [19957] = {0.5},            -- 'Carnwenhan',     -- 99-2
    [20561] = {0.5},            -- 'Carnwenhan',     -- 119
    [20562] = {0.5},            -- 'Carnwenhan',     -- 119-2
    [20586] = {0.5},            -- 'Carnwenhan',     -- 119-3
    [21398] = {0.5},            -- 'Marsyas',
    [21400] = {0.1},            -- 'Blurred Harp',
    [21401] = {0.2,Ballad=0.2}, -- 'Blurred Harp +1',
    [21405] = {0.2} ,           -- 'Eminent Flute',
    [21404] = {0.3},			-- 'Linos'			-- assumes +2 songs augment
    [20629] = {0.05},           -- 'Legato Dagger',
    [20599] = {0.05},           -- 'Kali',
	[22305] = {0.2},			-- Prime Stage 3
	[22306] = {0.2},			-- Prime Stage 4
	[22307] = {0.3},			-- Prime Stage 5 (Final)
    [27672] = {Paeon=0.1},      -- 'Brioso Roundlet',
    [27693] = {Paeon=0.1},      -- 'Brioso Roundlet +1',
    [23049] = {Paeon=0.1},      -- 'Brioso Roundlet +2',
    [23384] = {Paeon=0.1},      -- 'Brioso Roundlet +3',
    [28074] = {0.1},            -- 'Mdk. Shalwar +1',
    [25865] = {0.12},           -- 'Inyanga Shalwar',
    [25866] = {0.15},           -- 'Inyanga Shalwar +1',
    [25882] = {0.17},           -- 'Inyanga Shalwar +2',
    [28232] = {0.1},            -- 'Brioso Slippers',
    [28253] = {0.11},           -- 'Brioso Slippers +1',
    [23317] = {0.13},           -- 'Brioso Slippers +2',
    [23652] = {0.15},           -- 'Brioso Slippers +3',
    [11073] = {Madrigal=0.1},   -- 'Aoidos\' Calot +2',
    [11093] = {0.1,Minuet=0.1}, -- 'Aoidos\' Hngrln. +2',
    [11113] = {March=0.1},      -- 'Ad. Mnchtte. +2',
    [11133] = {Ballad=0.1},     -- 'Aoidos\' Rhing. +2',
    [11153] = {Scherzo=0.1},    -- 'Aoidos\' Cothrn. +2',
    [11618] = {0.1},            -- 'Aoidos\' Matinee',
    [26031] = {0.1},            -- 'Brioso Whistle',
    [26032] = {0.2},            -- 'Moonbow Whistle',
    [26033] = {0.3},            -- 'Mnbw. Whistle +1',
    [26758] = {Madrigal=0.1},   -- 'Fili Calot',
    [26759] = {Madrigal=0.1},   -- 'Fili Calot +1',
    [23094] = {Madrigal=0.1},   -- 'Fili Calot +2',
    [23429] = {Madrigal=0.1},   -- 'Fili Calot +3',
    [26916] = {0.11,Minuet=0.1},-- 'Fili Hongreline',
    [26917] = {0.12,Minuet=0.1},-- 'Fili Hongreline +1',
    [23161] = {0.13,Minuet=0.1},-- 'Fili Hongreline +2',
    [23496] = {0.14,Minuet=0.1},-- 'Fili Hongreline +3',
    [27070] = {March=0.1},      -- 'Fili Manchettes',
    [27071] = {March=0.1},      -- 'Fili Manchettes +1',
    [23228] = {March=0.1},      -- 'Fili Manchettes +2',
    [23563] = {March=0.1},      -- 'Fili Manchettes +3',
    [27255] = {Ballad=0.1},     -- 'Fili Rhingrave',
    [27256] = {Ballad=0.1},     -- 'Fili Rhingrave +1',
    [23295] = {Ballad=0.1},     -- 'Fili Rhingrave +2',
    [23630] = {Ballad=0.1},     -- 'Fili Rhingrave +3',
    [27429] = {Scherzo=0.1},    -- 'Fili Cothurnes',
    [27430] = {Scherzo=0.1},    -- 'Fili Cothurnes +1',
    [23362] = {Scherzo=0.1},    -- 'Fili Cothurnes +2',
    [23697] = {Scherzo=0.1},    -- 'Fili Cothurnes +3',
    [26255] = {Madrigal=0.1,Prelude=0.1}, -- 'Intarabus\'s Cape',
    [25561] = {Etude=0.1},      -- 'Mousai Turban',
    [25562] = {Etude=0.2},      -- 'Mousai Turban +1',
    [25988] = {Carol=0.1},      -- 'Mousai Gages',
    [25989] = {Carol=0.2},      -- 'Mousai Gages +1',
    [25901] = {Minne=0.1},      -- 'Mousai Seraweels',
    [25902] = {Minne=0.2},      -- 'Mousai Seraweels +1',
    [25968] = {Mambo=0.1},      -- 'Mousai Crackows',
    [25969] = {Mambo=0.2},      -- 'Mousai Crackows +1',
    }

local slots = {'main','sub','range','head','neck','body','hands','legs','feet','back'}

function song_timers.calc_dur(song_name, buffs, mult)
    local dur = 120
    if buffs.troubadour then mult = mult*2 end
    if song_name == 'Sentinel\'s Scherzo' then 
        if buffs['soul voice'] then
            mult = mult*2 
        elseif buffs.marcato then
            mult = mult*1.5
        end
    end
    dur = math.floor(mult * dur)
    if buffs.marcato then dur = dur + get.jp_mods.marcato end
    if buffs.tenuto then dur = dur + get.jp_mods.tenuto end
    if buffs['clarion call'] then dur = dur + get.jp_mods.clarion end
    return dur
end

function song_timers.duration(song_name, buffs)
    local mult = get.jp_mods.mult and 1.05 or 1
    local item = windower.ffxi.get_items('equipment')
    local buff_name
    for _,slot in ipairs(slots) do
        local mod = equip_mods[windower.ffxi.get_items(item[slot..'_bag'],item[slot]).id]
        if mod then
            for k,v in pairs(mod) do
                if k == 1 then
                    mult = mult + v
                elseif string.find(song_name, k) then
                    mult = mult + v
                    buff_name = k
                end
            end
        end
    end

    return song_timers.calc_dur(song_name, buffs, mult)
end

function song_timers.buff_lost(targ_id,buff_id)
    local buff = get.songs[song_buffs[buff_id]]

    if buff then
        local targ = windower.ffxi.get_mob_by_id(targ_id)
        if not targ.name then return end
        if not timers[targ.name] then return end

        local minimum,song
        for k,song_name in pairs(buff) do
            local song_timer = timers[targ.name][song_name]
            if song_timer and (not minimum or song_timer.ts < minimum) then
                minimum = song_timer.ts
                song = song_name
            end
        end

        if not song then return end
		if settings.aoe.party then
			local party = windower.ffxi.get_party()
			
			for slot in get.party_slots:it() do
				if settings.aoe[slot] and party[slot] and party[slot].name == targ.name then
					song_timers.delete(song,'AoE')
				end
			end
		end
		if targ.name == windower.ffxi.get_player().name then
			song_timers.delete(song,'AoE')
		end
		song_timers.delete(song,targ.name)
        return
    end
end

function song_timers.update(targ)
    if targ == 'buffs' then return end
    if not timers[targ] then timers[targ] = {} end
    local current_time = os.time()
    local temp_timer_list = {}
    for song_name,expires in pairs(timers[targ]) do
        if expires.ts < current_time then
            temp_timer_list[song_name] = true
        end
    end
    for song_name in pairs(temp_timer_list) do
        timers[targ][song_name] = nil
    end
end

function song_timers.delete(song,targ)
	if timers[targ] and timers[targ][song] then
		timers[targ][song] = nil
	end
end

function song_timers.create(song,targ,dur,current_time,buffs)
    timers[targ][song] = {ts=current_time+dur,nt=buffs.troubadour,sv=buffs['soul voice']}
	if not settings.aoe.party then
		if timers['AoE'] and timers['AoE'][song] then
			timers['AoE'][song] = {ts=current_time+dur,nt=buffs.troubadour,sv=buffs['soul voice']}
		end
	end
    if timers['AoE'] and timers['AoE'][song] and targ ~= 'AoE' or not settings.timers then return end
end

function song_timers.adjust(spell_name,targ,buffs)
    local current_time = os.time()
    local dur = song_timers.duration(spell_name,buffs)
    song_timers.update(targ)
    if timers[targ][spell_name] then
        if timers[targ][spell_name].ts < (current_time + dur) then
            song_timers.create(spell_name,targ,dur,current_time,buffs)
        end
    elseif table.length(timers[targ]) < get.maxsongs(targ,buffs) and not check_dummy(targ) then
        song_timers.create(spell_name,targ,dur,current_time,buffs)
    else
        local rep,repsong
        for song_name,expires in pairs(timers[targ]) do
            if not rep or rep > expires.ts then
                rep = expires.ts
                repsong = song_name
            end
        end
        if repsong then
            song_timers.delete(repsong,targ)
            song_timers.create(spell_name,targ,dur,current_time,buffs)
			if not settings.aoe.party then
				song_timers.delete(repsong,'AoE')
				song_timers.create(spell_name,'AoE',dur,current_time,buffs)
			end
        end
	end
end

function check_dummy(targ)
	local count = false
	for k,v in pairs (timers[targ]) do
		if setting.dummy[k] then
			return true
		end
	end
	return false
end

function song_timers.reset(bool)
    if bool then return end
    timers = {AoE={}}
    casting = false
end

return song_timers
