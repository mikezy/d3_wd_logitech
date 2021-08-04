----never_love最新更新：招狗前延迟0.4秒，招狗后延迟0.55秒
--脚本按键设置：
----鼠标左键->收割
----鼠标右键->噬魂
----1键->弹幕
----2键->灵行
----3键->招狗
----4键->爆狗

function OnEvent(event, arg, family)
	--if (event == "G_PRESSED" and arg == 4) then --4为罗技键盘G4键
	if (event == "MOUSE_BUTTON_RELEASED" and arg == 3) then --3为罗技鼠标中键
		--如果CapsLock键未按下，则按下并释放CapsLock键
		if not (IsKeyLockOn("capslock")) then
			PressAndReleaseKey("capslock")
			Sleep(10)
		end

		WitchDoctor_Macro_FullyAuto() --巫医脚本循环，物理2秒后开宏
	end
end
--操作流程
--爆3狗：按下4，休息200，按下4，休息200，按下4，休息500
--招狗：按下3，休息200
--连炸混蛋：按下1，休息100，循环8次
--结束宏
function WitchDoctor_Macro_FullyAuto()
	Times_Key_3 = 0
	Times_Button_RightMouse = 0

	--如果CapsLock键已按下则启动循环，否则退出循环
	while (IsKeyLockOn("capslock")) do
		Times_Key_3 = Times_Key_3 + 1
		Times_Button_RightMouse = Times_Button_RightMouse + 1

		PressAndReleaseKey("4") --按下4，爆3狗

		if (Times_Button_RightMouse == 9) then --每9秒按下右键
			Sleep(400) --0.4秒
			PressAndReleaseMouseButton(3)
			Times_Button_RightMouse = 0
			Sleep(550) --0.55秒
		elseif (Times_Key_3 == 17) then --每17秒按下3
			Sleep(500)
			PressAndReleaseKey("3")
			Sleep(500)
		else
			Sleep(500)
			PressKey("rshift")
			PressAndReleaseMouseButton(1) --按下强制站立+左键
			if(Times_Button_RightMouse == 8) then
				Sleep(550)
			else
				Sleep(500)
			end
			ReleaseKey("rshift")
		end

		if (Times_Key_3 == 18) then
			Times_Key_3 = 0
		end
	end
end
