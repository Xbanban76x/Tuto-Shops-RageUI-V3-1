

local MainMenu = RageUI.CreateMenu("Title", "SUBTITLE");

function RageUI.PoolMenus:Example()
	MainMenu:IsVisible(function(RageUI)

		for k, v in pairs(Shops.Boisson) do
			RageUI:AddButton(v.Label, nil, { RightLabel = "~g~"..v.Price.."$" }, function(onSelected)
				if (onSelected) then
					TriggerServerEvent('buyItem', v.Label, v.Value, v.Price)
				end
			end)
		end

		RageUI:AddSeparator("Différence entre nourriture et boisson")

		for k, v in pairs(Shops.Nourriture) do
			RageUI:AddButton(v.Label, nil, { RightLabel = "~g~"..v.Price.."$" }, function(onSelected)
			if (onSelected) then
				TriggerServerEvent('buyItem', v.Label, v.Value, v.Price)
			end
		end)
	end
	
	end, function()
	end)
end


Citizen.CreateThread(function()
	while true do
		local interval = 1
		for k, v in pairs(Shops.Pos) do
			local playerPos = GetEntityCoords(PlayerPedId())
			local distance = #(playerPos - v)
			if distance <= 9 then
				interval = 0
				DrawMarker(22, v.x, v.y, v.z + 0.98, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 0, 0, 0, 150, 55555, false, true, 2, false, false, false, false)
				if distance <= 2 then
					Visual.Subtitle("Appuyez sur ~b~[E] pour accéder au magasin", 1)
					if IsControlJustPressed(0, 51) then
						RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
					end
				end
			end
		end
		Wait(interval)
    end
end)

-- Keys.Register("E", "E", "Test", function()
-- 	RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
-- end)
