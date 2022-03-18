/// @description Insert description here
// You can write your code in this editor
c_gray1 = make_color_rgb(230, 230, 230)
c_gray2 = make_color_rgb(204, 204, 204)
c_gray3 = make_color_rgb(150, 150, 150)
c_gray0 = make_color_rgb(51, 51, 51)
c_pink0 = make_color_rgb(242, 182, 182)
c_pink1 = make_color_rgb(242, 145, 145)
c_green0 = make_color_rgb(182, 242, 182)


draw_set_color(c_gray1)
draw_rectangle(x0 + 300, y0 + 36, x0 + 300 + 1200, y0 + 36 + 36, 0)
draw_set_color(c_gray2)
draw_rectangle(x0 + 300, y0 + 36 + 36, x0 + 300 + 1200, y0 + 36 + 36 + 16, 0)
draw_set_color(c_gray3)
draw_rectangle(x0 + 300 + 2.5 * TimePos, y0 + 36 + 36, x0 + 300 + 2.5 * (TimePos + TimeScale), y0 + 36 + 36 + 16, 0)

draw_set_font(fnt12)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_color(c_gray0)

for (var i=0; i<=10; i++) {
	draw_text(x0 + 300 + i * 120, y0 + 32, string(TimePos + i * TimeScale / 10))
	draw_line_width(x0 + 300 + i * 120, y0 + 32, x0 + 300 + i * 120, y0 + 36 + 36, 3)
}

function PushTip2(text, ii) {
	if (point_in_rectangle(mouse_x, mouse_y, x0 + 32 + 64, y0 + 112 + 36 * ii, x0 + 300 - 36, y0 + 112 + 36 * ii + 32)) {
		array_push(objTooltip.TipText, text)
	}
}
PushTip2("2게일은 더 진한색으로 표시된다.", 1)
PushTip2("제작자가 아직 256레벨인 관계로 직접 실험하지 못해 구현하지 못하였습니다. 도움 주실 분 연락바랍니다. 카카오톡 오픈채팅 프로필 [스카니아/Pz파전/훰린]", 7)
PushTip2("이 범위 내에서의 공격만이 유효하게 적용된다. 예를 들어 루시드의 경우, 스킬 제한을 40초로 해두면 40초 이후의 공격은 계산되지 않는다.", 19)


for (var i=0; i<SkillNum; i++) {
	draw_set_color(c_gray0)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text(x0 + 32 + 64, y0 + 112 + 16 + 36 * i + 2, string(SkillName[i]))
	if (i <= 7) {
		draw_set_halign(fa_right)
		draw_text(x0 + 30 + 64, y0 + 112 + 16 + 36 * i + 2, string(SkillDealDraw[i]) + "%")
		draw_set_halign(fa_left)
	}
	if (i <= 2) {
		DuBuffName = ["가이디드", "윔", "스톰"]
		draw_text(x0 - 32, y0 + 112 + 16 + 36 * i + 2, string(DuBuffName[i]))
		draw_set_halign(fa_right)
		draw_text(x0 - 34, y0 + 112 + 16 + 36 * i + 2, string(SkillDealDraw[i + 8]) + "%")
		draw_set_halign(fa_left)
	}
	draw_set_color(c_gray1)
	draw_rectangle(x0 + 300, y0 + 112 + 36 * i, x0 + 300 + 1200, y0 + 112 + 36 * i + 32, 0)
	draw_set_color(c_pink0)
	draw_rectangle(x0 + 300 - 36, y0 + 112 + 36 * i, x0 + 300 - 4, y0 + 112 + 36 * i + 32, 0)
	draw_set_color(c_gray0)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(x0 + 300 - 36 + 16, y0 + 112 + 16 + 36 * i + 2, "+")
	
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 300 - 36, y0 + 112 + 36 * i, x0 + 300 - 4, y0 + 112 + 36 * i + 32)) {
		
		if (i == 0 or i == 19) {
			if (array_length(SkillPos[i]) == 0) {
				array_push(SkillPos[i], 0)
				array_push(SkillDuration[i], 10)
			}
			else {
				var LastIndex = array_length(SkillPos[i]) - 1;
				if (SkillPos[i][LastIndex] + SkillDuration[i][LastIndex] < 480 - 1) {
					array_push(SkillPos[i], SkillPos[i][LastIndex] + SkillDuration[i][LastIndex] + 1)
					array_push(SkillDuration[i], min(1, 480 - (SkillPos[i][LastIndex] + SkillDuration[i][LastIndex]) - 1))
				}
			}
		}
		else if (i == 1) {
			if (array_length(SkillPos[i]) == 0) {
				var getSkillKind = get_integer("1게일 or 2게일 (1 또는 2 입력)", 1);
				if (getSkillKind == 1) {
					array_push(SkillPos[i], 0)
					array_push(SkillDuration[i], 10)
					array_push(SkillKind[i], 1)
				}
				else if (getSkillKind == 2) {
					array_push(SkillPos[i], 0)
					array_push(SkillDuration[i], 10)
					array_push(SkillKind[i], 2)
				}
				
			}
			else {
				var getSkillKind = get_integer("1게일 or 2게일 (1 또는 2 입력)", 1);
				if (getSkillKind == 1 or getSkillKind == 2) {
					var LastIndex = array_length(SkillPos[i]) - 1;
					var k = LastIndex;
					var MinPos = 0;
					var MaxPos = 480 - 0.1;
					var Stack = 40;
					for (var l=0; l<k; l++) {
						if (l == 0) {
							Stack = min(40, Stack + SkillPos[i][l]) - SkillKind[i][l] * 20
						}
						else {
							Stack = min(40, Stack + SkillPos[i][l] - SkillPos[i][l - 1]) - SkillKind[i][l] * 20
						}
					}
					if (k > 0) {
						Stack = min(40, Stack + SkillPos[i][k] - SkillPos[i][k - 1]) - SkillKind[i][k] * 20
					}
					else {
						Stack = min(40, Stack + SkillPos[i][k]) - SkillKind[i][k] * 20
					}
					MinPos = SkillPos[i][k] + getSkillKind * 20 - Stack
					if (MinPos <= MaxPos) {
						array_push(SkillPos[i], max(MinPos, SkillPos[i][k] + 10))
						array_push(SkillDuration[i], 10)
						array_push(SkillKind[i], getSkillKind)
					}
				}
				
			}
		}
		else if (i == 2) {
			if (array_length(SkillPos[i]) == 0) {
				array_push(SkillPos[i], 0)
				array_push(SkillDuration[i], objSpecUI.SkillCoolFinal[i])
			}
			else {
				var LastIndex = array_length(SkillPos[i]) - 1;
				if (SkillPos[i][LastIndex] + SkillDuration[i][LastIndex] < 480) {
					array_push(SkillPos[i], SkillPos[i][LastIndex] + SkillDuration[i][LastIndex])
					array_push(SkillDuration[i], objSpecUI.SkillCoolFinal[i])
				}
			}
		}
		else if (i == 3 or i == 4 or i == 5 or i == 6 or i == 7 or i == 8 or i == 9 or i == 10 or i == 11 or i == 12 or i == 13 or i == 14 or i == 15 or i == 16 or i == 17 or i == 18) {
			if (array_length(SkillPos[i]) == 0) {
				array_push(SkillPos[i], 0)
				array_push(SkillDuration[i], objSpecUI.SkillCoolFinal[i])
			}
			else {
				var LastIndex = array_length(SkillPos[i]) - 1;
				if (SkillPos[i][LastIndex] + SkillDuration[i][LastIndex] < 480) {
					array_push(SkillPos[i], SkillPos[i][LastIndex] + SkillDuration[i][LastIndex])
					array_push(SkillDuration[i], objSpecUI.SkillCoolFinal[i])
				}
			}
		}
		
	}
	
	if (i == 0) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				draw_set_color(c_pink0)
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				var DurationMovingCheck = mouse_check_button(mb_left) and SkillDurationMoving and SkillDurationMovingI == i and SkillDurationMovingJ == k;
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or DurationMovingCheck or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
						if (abs(mouse_x - (x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)) <= 3 and SkillPosMoving == 0) {
							if (mouse_check_button_pressed(mb_left)) {
								SkillDurationMoving = 1
								SkillDurationMovingI = i
								SkillDurationMovingJ = k
								MouseOffsetx = mouse_x - (x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
							}
						}
					}
					if (SkillDurationMoving == 0 and mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						break;
					}
					
				}
				
				if (DurationMovingCheck) {
					var MaxDuration = 0.1;
					var MinDuration = 0.1;
					if (k < j - 1) {
						MaxDuration = SkillPos[i][k + 1] - SkillPos[i][k]
					}
					else {
						MaxDuration = 480 - SkillPos[i][k]
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillDuration[i][k] = median(MinDuration, round((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos - kSP ), MaxDuration)
					}
					else {
						SkillDuration[i][k] = median(MinDuration, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos - kSP )* 10) / 10, MaxDuration)
					}
					
					
				}
				else if (PosMovingCheck) {
					var MinPos = 0;
					var MaxPos = 0;
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillDuration[i][k - 1]
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - SkillDuration[i][k]
					}
					else {
						MaxPos = 480 - SkillDuration[i][k]
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
					
				}
					
					
			}
		}
	}
	else if (i == 1) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			var kSK = SkillKind[i][k];
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				if (kSK == 1) {
					draw_set_color(c_pink0)
				}
				else {
					draw_set_color(c_pink1)
				}
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						array_delete(SkillKind[i], k, 1)
						break;
					}
				}
					
				if (PosMovingCheck) {
					var MinPos = 0 - 10 + 0.1;
					var MaxPos = 480 - 0.1;
					var Stack = 40;
					for (var l=0; l<k; l++) {
						if (l == 0) {
							Stack = min(40, Stack + 0) - SkillKind[i][l] * 20
						}
						else {
							Stack = min(40, Stack + SkillPos[i][l] - SkillPos[i][l - 1]) - SkillKind[i][l] * 20
						}
					}
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillKind[i][k] * 20 - Stack
						Stack = min(40, Stack + SkillPos[i][k] - SkillPos[i][k - 1]) - SkillKind[i][k] * 20
					}
					else {
						Stack = min(40, Stack + SkillPos[i][k]) - SkillKind[i][k] * 20
					}
						
					Stack = 40
					for (var l=j-1; l>k; l--) {
						if (l == j-1) {
							Stack = SkillKind[i][l] * 20
						}
						else {
							Stack = median(40, Stack + SkillPos[i][l] - SkillPos[i][l + 1], 0) + SkillKind[i][l] * 20
							//Stack = min(40, Stack + SkillPos[i][l] - SkillPos[i][l + 1]) - SkillKind[i][l] * 20
						}
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - Stack + (2 - SkillKind[i][k]) * 20
					}
						
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
				}
			}
		}
	}
	else if (i == 2) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			var kST = SkillDelay[i] * SkillAttack[i] / 1000;
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				draw_set_color(c_gray2)
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				if (kSP + kST > TimePos) {
					draw_set_color(c_pink0)
					draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
					
				}
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
							
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kST <= TimePos + TimeScale and kSP + kST > TimePos) {
						array_push(objLineDraw.LineX, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale))
					}
					if (mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						break;
					}
				}

				if (PosMovingCheck) {
					var MinPos = -kST + 0.1;
					var MaxPos = 0;
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillDuration[i][k - 1]
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - SkillDuration[i][k]
					}
					else {
						MaxPos = 480 - 0.1
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
				}
					
					
			}
		}
	}
	else if (i == 3) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			var kST = SkillDelay[i] * SkillAttack[i] / 1000;
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				draw_set_color(c_gray2)
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				if (kSP + kST > TimePos) {
					draw_set_color(c_pink0)
					draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				}
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kST <= TimePos + TimeScale and kSP + kST > TimePos) {
						array_push(objLineDraw.LineX, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale))
					}
					if (mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						break;
					}
				}

				if (PosMovingCheck) {
					var MinPos = -kST + 0.1;
					var MaxPos = 0;
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillDuration[i][k - 1]
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - SkillDuration[i][k]
					}
					else {
						MaxPos = 480 - 0.1
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
				}
					
					
			}
		}
	}
	else if (i == 4 or i == 5 or i == 6 or i == 7 or i == 8 or i == 9 or i == 10 or i == 11 or i == 12 or i == 13 or i == 14 or i == 15 or i == 16 or i == 17 or i == 18) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			var kST = SkillDelay[i] * SkillAttack[i] / 1000;
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				draw_set_color(c_gray2)
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				if (kSP + kST > TimePos) {
					draw_set_color(c_pink0)
					draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				}
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
							
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kST <= TimePos + TimeScale and kSP + kST > TimePos) {
						array_push(objLineDraw.LineX, x0 + 300 + min(1200, (kSP + kST - TimePos) * 1200 / TimeScale))
					}
					if (mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						break;
					}
				}

				if (PosMovingCheck) {
					var MinPos = -kST + 0.1;
					var MaxPos = 0;
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillDuration[i][k - 1]
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - SkillDuration[i][k]
					}
					else {
						MaxPos = 480 - 0.1
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
				}
					
					
			}
		}
	}
	else if (i == 19) {
		var j = array_length(SkillPos[i]);
		for (var k=0; k<j; k++) {
			var kSP = SkillPos[i][k];
			var kSD = SkillDuration[i][k];
			if (kSP < TimePos + TimeScale and kSP + kSD > TimePos) {
				draw_set_color(c_pink0)
				draw_rectangle(x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32, 0)
				var DurationMovingCheck = mouse_check_button(mb_left) and SkillDurationMoving and SkillDurationMovingI == i and SkillDurationMovingJ == k;
				var PosMovingCheck = mouse_check_button(mb_left) and SkillPosMoving and SkillPosMovingI == i and SkillPosMovingJ == k;
				if (point_in_rectangle(mouse_x, mouse_y, x0 + 300 + max(0, (kSP - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i, x0 + 300 + min(1200, (kSP + kSD - TimePos) * 1200 / TimeScale), y0 + 112 + 36 * i + 32) or DurationMovingCheck or PosMovingCheck) {
					draw_set_color(c_green0)
					if (kSP >= TimePos) {
						draw_rectangle_wh(x0 + 300 + (kSP - TimePos) * 1200 / TimeScale , y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (kSP + kSD <= TimePos + TimeScale) {
						draw_rectangle_wh(x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale - 3, y0 + 112 + 36 * i, 3, 32, 0)
						array_push(objLineDraw.LineX, x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
						if (abs(mouse_x - (x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)) <= 3 and SkillPosMoving == 0) {
							if (mouse_check_button_pressed(mb_left)) {
								SkillDurationMoving = 1
								SkillDurationMovingI = i
								SkillDurationMovingJ = k
								MouseOffsetx = mouse_x - (x0 + 300 + (kSP + kSD - TimePos) * 1200 / TimeScale)
							}
						}
					}
					if (SkillDurationMoving == 0 and mouse_check_button_pressed(mb_left)) {
						SkillPosMoving = 1
						SkillPosMovingI = i
						SkillPosMovingJ = k
						MouseOffsetx = mouse_x - (x0 + 300 + (kSP - TimePos) * 1200 / TimeScale)
					}
					if (mouse_check_button_pressed(mb_right)) {
						array_delete(SkillPos[i], k, 1)
						array_delete(SkillDuration[i], k, 1)
						break;
					}
				}
				
				if (DurationMovingCheck) {
					var MaxDuration = 0.1;
					var MinDuration = 0.1;
					if (k < j - 1) {
						MaxDuration = SkillPos[i][k + 1] - SkillPos[i][k]
					}
					else {
						MaxDuration = 480 - SkillPos[i][k]
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillDuration[i][k] = median(MinDuration, round((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos - kSP ), MaxDuration)
					}
					else {
						SkillDuration[i][k] = median(MinDuration, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos - kSP )* 10) / 10, MaxDuration)
					}
				}
				else if (PosMovingCheck) {
					var MinPos = 0;
					var MaxPos = 0;
					if (k > 0) {
						MinPos = SkillPos[i][k - 1] + SkillDuration[i][k - 1]
					}
					if (k < j - 1) {
						MaxPos = SkillPos[i][k + 1] - SkillDuration[i][k]
					}
					else {
						MaxPos = 480 - SkillDuration[i][k]
					}
					if (keyboard_check(ord("g")) or keyboard_check(ord("G"))) {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos)), MaxPos)
					}
					else {
						SkillPos[i][k] = median(MinPos, round(((mouse_x - MouseOffsetx - 300 - x0) * TimeScale / 1200 + TimePos) * 10) / 10, MaxPos)
					}
				}
					
					
			}
		}
	}
		
			
	
}