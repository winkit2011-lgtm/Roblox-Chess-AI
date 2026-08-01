-- ChessGUI.lua
-- Roblox Chess AI Interface

local ChessGUI = {}

local ChessController = require(script.Parent.ChessController)


ChessGUI.AILevel = 5
ChessGUI.WaitTime = 3


function ChessGUI.Create()

	print("Chess GUI Loaded")


	-- 自动下棋按钮

	local AutoPlayButton = {
		Text = "开启自动下棋"
	}



	function AutoPlayButton.Click()

		if ChessController.Enabled then

			ChessController.Stop()

			print("自动下棋关闭")

		else

			ChessController.Start()

			print("自动下棋开启")

		end

	end



	-- AI等级滑条

	local LevelSlider = {}


	function LevelSlider.Set(value)

		ChessGUI.AILevel =
			math.clamp(value,1,8)


		ChessController.SetLevel(
			ChessGUI.AILevel
		)


		print(
			"AI等级:",
			ChessGUI.AILevel
		)

	end



	-- 等待时间滑条

	local WaitSlider = {}



	function WaitSlider.Set(value)

		ChessGUI.WaitTime =
			math.clamp(value,0,10)


		ChessController.SetWaitTime(
			ChessGUI.WaitTime
		)


		print(
			"等待时间:",
			ChessGUI.WaitTime,
			"秒"
		)

	end



	return {

		Button = AutoPlayButton,

		Level = LevelSlider,

		Wait = WaitSlider

	}

end



return ChessGUI
