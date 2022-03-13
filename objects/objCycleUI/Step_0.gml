/// @description Insert description here
// You can write your code in this editor

if (objSpecUI.UIShow) {
	if (mouse_wheel_down()) {
		TimeScale = min(TimeScale + 10, 480)
		TimePos = median(0, TimePos, 480 - TimeScale)
	}
	if (mouse_wheel_up()) {
		TimeScale = max(20, TimeScale - 10)
	}
}
if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + 2.5 * TimePos, y0 + 36 + 36, x0 + 300 + 2.5 * (TimePos + TimeScale), y0 + 36 + 36 + 16)) {
		TimeBarMoving = 1
		
		MouseOffsetx = mouse_x - (x0 + 300 + 2.5 * TimePos)
		MouseOffsety = mouse_y
	}
}
if (mouse_check_button(mb_left)) {
	if (TimeBarMoving) {
		TimePos = median(0, (mouse_x - MouseOffsetx - 300 - x0) / 2.5, 480 - TimeScale)
	}
}

if (mouse_check_button_released(mb_left)) {
	TimeBarMoving = 0
	SkillPosMoving = 0
	SkillDurationMoving = 0
}
if (keyboard_check_pressed(vk_f5)) {
	alarm[9] = 1
}

TimePos = round(TimePos)