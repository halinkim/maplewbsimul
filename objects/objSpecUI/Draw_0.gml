/// @description Insert description here
// You can write your code in this editor

c_gray1 = make_color_rgb(230, 230, 230)
c_gray2 = make_color_rgb(204, 204, 204)
c_gray3 = make_color_rgb(150, 150, 150)
c_gray0 = make_color_rgb(51, 51, 51)
c_pink0 = make_color_rgb(242, 182, 182)
c_pink1 = make_color_rgb(242, 145, 145)
c_green0 = make_color_rgb(182, 242, 182)
c_back = make_color_rgb(242, 242, 230)
UseLabel = ["미사용", "사용"]
ExistLabel = ["없음", "있음"]

draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)

draw_text(x0 + 40, y0 + 32, "기본 스펙")
draw_text(x0 + 300, y0 + 32, "코어 강화")
draw_text(x0 + 560, y0 + 32, "시드링")
draw_text(x0 + 820, y0 + 32, "도핑")
draw_text(x0 + 1080, y0 + 32, "링크 스킬")
draw_text(x0 + 1340, y0 + 32, "보스 정보")


draw_line_width(x0 + 40, y0 + 32 + 16, x0 + 40 + 220, y0 + 32 + 16, 3)
draw_set_font(fnt12)
i = 0;
function BaseSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 40, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 40 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 40, y0 + 48 + 31 * (i + 1), x0 + 40 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 40
function EditValue(ques, def, left, right, variable) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = get_integer(ques, def);
		if (left <= getInt and getInt <= right) {
			variable_instance_set(objSpecUI, variable, getInt)
			
			if (variable == "SpecCoolReduce") {
				alarm[0] = 1
			}
		}
	}
}

function EditValueOnOff(variable, left, choicenum) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = variable_instance_get(objSpecUI, variable) + 1;
		if (getInt >= left + choicenum) {
			getInt -= choicenum
		}
		variable_instance_set(objSpecUI, variable, getInt)
		
		if (variable == "UnionMercedes") {
			alarm[0] = 1
		}
		else if (variable == "SCoreNum") {
			SCoreCool = [30, 120, 60]
			
			SkillCoolBase[13] = SCoreCool[SCoreNum]
			
			alarm[0] = 1
			objCycleUI.alarm[1] = 1
		}
		else if (variable == "SeedRestraint" or variable == "SeedWeapon" or variable == "SeedRisk") {
			objCycleUI.alarm[0] = 1
		}
		else if (variable == "ServerLag") {
			objCycleUI.alarm[0] = 1
		}
	}
}
function EditValueCore(ques, def, left, right, index) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = get_integer(ques, def);
		if (left <= getInt and getInt <= right) {
			array_set(CoreSkill, index, getInt)
			objCycleUI.alarm[0] = 1
		}
	}
}
function EditValueBuff(index, left, choicenum) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = DurationBuff[index] + 1;
		if (getInt >= left + choicenum) {
			getInt -= choicenum
		}
		array_set(DurationBuff, index, getInt)
	}
}
function EditValueDope(index, left, choicenum) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = Dope[index] + 1;
		if (getInt >= left + choicenum) {
			getInt -= choicenum
		}
		array_set(Dope, index, getInt)
	}
}
function EditValueLink(index, left, choicenum) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = Link[index] + 1;
		if (getInt >= left + choicenum) {
			getInt -= choicenum
		}
		array_set(Link, index, getInt)
	}
}
function EditValueHyper(index, left, choicenum) {
	if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		var getInt = HyperSkill[index] + 1;
		if (getInt >= left + choicenum) {
			getInt -= choicenum
		}
		array_set(HyperSkill, index, getInt)
	}
}

if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 40, y0 + 48 + 31 * i, x0 + 40 + 220, y0 + 48 + 31 * (i + 1))) {
	var getInt = get_integer("레벨을 입력해주세요.", 250);
	if (200 <= getInt and getInt <= 300) {
		SpecLv = getInt
	}
}
BaseSpec("레벨", SpecLv)
if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 40, y0 + 48 + 31 * i, x0 + 40 + 220, y0 + 48 + 31 * (i + 1))) {
	var getInt = get_integer("순수 DEX를 입력해주세요.", 1000);
	if (0 <= getInt and getInt <= 99999) {
		SpecPureDex = getInt
	}
}
BaseSpec("순수 DEX", SpecPureDex)

EditValue("고정 DEX를 입력해주세요.", 13200, 0, 99999, "SpecFixDex")
BaseSpec("고정 DEX", SpecFixDex)

EditValue("순수 STR를 입력해주세요.", 400, 0, 99999, "SpecPureStr")
BaseSpec("순수 STR", SpecPureStr)

EditValue("고정 STR를 입력해주세요.", 400, 0, 99999, "SpecFixStr")
BaseSpec("고정 STR", SpecFixStr)

EditValue("DEX%를 입력해주세요.", 500, 0, 9999, "SpecPerDex")
BaseSpec("DEX%", SpecPerDex)

EditValue("STR%를 입력해주세요.", 100, 0, 9999, "SpecPerStr")
BaseSpec("STR%", SpecPerStr)

EditValue("공격력을 입력해주세요.", 3000, 0, 99999, "SpecAtt")
BaseSpec("공격력", SpecAtt)

EditValue("무기 공격력을 입력해주세요.", 725, 0, 9999, "SpecWeaponAtt")
BaseSpec("무기 공격력", SpecWeaponAtt)

EditValue("공격력%를 입력해주세요. (스킬 제외)", 100, 0, 999, "SpecPerAtt")
BaseSpec("공격력%", SpecPerAtt)

EditValue("데미지를 입력해주세요.", 90, 0, 999, "SpecDamage")
BaseSpec("데미지", SpecDamage)

EditValue("보스데미지를 입력해주세요.", 400, 0, 999, "SpecBossDamage")
BaseSpec("보스데미지", SpecBossDamage)

EditValue("방어력무시값을 입력해주세요.", 95, 0, 109, "SpecArmorIgnore")
BaseSpec("방어력무시", SpecArmorIgnore)

//EditValue("최종데미지를 입력해주세요.", 48.5, 0, 9999, "SpecFinalDamage")
BaseSpec("최종데미지", SpecFinalDamage)

EditValue("크리데미지를 입력해주세요.", 90, 0, 999, "SpecCriDamage")
BaseSpec("크리데미지", SpecCriDamage)

EditValue("크리티컬확률을 입력해주세요.", 100, 0, 999, "SpecCriExp")
BaseSpec("크리티컬확률", SpecCriExp)

EditValue("버프지속시간을 입력해주세요. (%)", 20, 0, 999, "SpecBuffDuration")
BaseSpec("버프지속시간", SpecBuffDuration)

EditValue("어빌리티 상추뎀을 입력해주세요.", 8, 0, 99, "SpecProDamage")
BaseSpec("상추뎀", SpecProDamage)

EditValue("모자 쿨감값을 입력해주세요. (초)", 3, 0, 9, "SpecCoolReduce")
BaseSpec("쿨감", SpecCoolReduce)

EditValue("성향 통찰력 레벨을 입력해주세요.", 100, 0, 100, "SpecInsight")
BaseSpec("통찰력", SpecInsight)

EditValueOnOff("SpecAbilityMultiple", 0, 2)
BaseSpec("어빌리티 다수기", ExistLabel[SpecAbilityMultiple])

EditValueOnOff("SpecMonsterLifeMultiple", 0, 2)
BaseSpec("몬라 다수기", ExistLabel[SpecMonsterLifeMultiple])

EditValueOnOff("SpecMonsterLifeAtt", 0, 2)
BaseSpec("몬라 이퀄 루미", ExistLabel[SpecMonsterLifeAtt])




draw_line_width(x0 + 300, y0 + 32 + 16, x0 + 300 + 220, y0 + 32 + 16, 3)
i = 0;
function CoreSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 300, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 300 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 300, y0 + 48 + 31 * (i + 1), x0 + 300 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 300
EditValueCore("천공의 노래 코어 강화 레벨을 입력해주세요.", 60, 0, 60, 0)
CoreSpec("천공의 노래", CoreSkill[0])

EditValueCore("트라이플링 윔 코어 강화 레벨을 입력해주세요.", 60, 0, 60, 1)
CoreSpec("트라이플링 윔", CoreSkill[1])

EditValueCore("스톰 브링어 코어 강화 레벨을 입력해주세요.", 60, 0, 60, 2)
CoreSpec("스톰 브링어", CoreSkill[2])

EditValueCore("하울링 게일 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 3)
CoreSpec("하울링 게일", CoreSkill[3])

EditValueCore("볼텍스 스피어 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 4)
CoreSpec("볼텍스 스피어", CoreSkill[4])

EditValueCore("아이들 윔 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 11)
CoreSpec("아이들 윔", CoreSkill[11])

EditValueCore("윈드 월 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 12)
CoreSpec("윈드 월", CoreSkill[12])

EditValueCore("스파이더 인 미러 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 5)
CoreSpec("스파이더 인 미러", CoreSkill[5])

EditValueCore("크레스트 오브 더 솔라 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 6)
CoreSpec("크레스트 오브 더 솔라", CoreSkill[6])

EditValueCore("초월자 시그너스의 축복 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 7)
CoreSpec("초월자 시그너스의 축복", CoreSkill[7])

EditValueCore("크리티컬 리인포스 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 8)
CoreSpec("크리티컬 리인포스", CoreSkill[8])

EditValueCore("가이디드 애로우 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 9)
CoreSpec("가이디드 애로우", CoreSkill[9])

EditValueCore("시그너스 팔랑크스 코어 강화 레벨을 입력해주세요.", 30, 0, 30, 10)
CoreSpec("시그너스 팔랑크스", CoreSkill[10])



draw_line_width(x0 + 560, y0 + 32 + 16, x0 + 560 + 220, y0 + 32 + 16, 3)
i = 0;
function SeedSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 560, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 560 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 560

EditValueOnOff("SeedRestraint", 1, 4)
SeedSpec("리스트레인트", SeedRestraint)

EditValueOnOff("SeedWeapon", 1, 4)
SeedSpec("웨폰퍼프", SeedWeapon)

EditValueOnOff("SeedRisk", 1, 4)
SeedSpec("리스크테이커", SeedRisk)


i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 560, y0 + 48 + 31 * i + 15, "특수 코어")
draw_set_font(fnt12)
draw_line_width(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function SCoreSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 560, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 560 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValueOnOff("SCoreNum", 0, 3)
SCoreSpec(SCoreName[SCoreNum],"")


i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 560, y0 + 48 + 31 * i + 15, "서버렉")
draw_set_font(fnt12)
draw_line_width(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function ServerSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 560, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 560 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValueOnOff("ServerLag", 0, 4)
ServerSpec("서버렉", ServerLag)


i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 560, y0 + 48 + 31 * i + 15, "지속 버프")
draw_set_font(fnt12)
draw_line_width(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function BuffSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 560, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 560 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 560, y0 + 48 + 31 * (i + 1), x0 + 560 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValueBuff(0, 0, 2)
BuffSpec("에메랄드 플라워", UseLabel[DurationBuff[0]])

EditValueBuff(1, 0, 2)
BuffSpec("핀포인트 피어스", UseLabel[DurationBuff[1]])

EditValueBuff(2, 0, 3)
GuidedLabel = ["미사용", "사용, 중소형", "사용, 대형"]
BuffSpec("가이디드 애로우", GuidedLabel[DurationBuff[2]])

EditValueBuff(3, 0, 2)
BuffSpec("트라이플링 윔", UseLabel[DurationBuff[3]])

EditValueBuff(4, 0, 2)
BuffSpec("스톰 브링어", UseLabel[DurationBuff[4]])

EditValueBuff(5, 0, 2)
BuffSpec("쓸컴뱃", UseLabel[DurationBuff[5]])

EditValueBuff(6, 0, 2)
BuffSpec("시그너스 나이츠", UseLabel[DurationBuff[6]])

EditValueBuff(7, 0, 2)
BuffSpec("쓸어블", UseLabel[DurationBuff[7]])



draw_line_width(x0 + 820, y0 + 32 + 16, x0 + 820 + 220, y0 + 32 + 16, 3)
i = 0;
function DopeSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 820, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 820 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 820, y0 + 48 + 31 * (i + 1), x0 + 820 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 820
EditValueDope(0, 0, 2)
DopeSpec("10단계 민첩", UseLabel[Dope[0]])

EditValueDope(1, 0, 2)
DopeSpec("10단계 힘 ", UseLabel[Dope[1]])

EditValueDope(2, 0, 2)
DopeSpec("익스 레드", UseLabel[Dope[2]])

EditValueDope(3, 0, 2)
DopeSpec("유니온의 힘", UseLabel[Dope[3]])

EditValueDope(4, 0, 2)
DopeSpec("길축", UseLabel[Dope[4]])

EditValueDope(5, 0, 2)
DopeSpec("우뿌", UseLabel[Dope[5]])

EditValueDope(6, 0, 2)
DopeSpec("붕뿌", UseLabel[Dope[6]])

EditValueDope(7, 0, 21)
DopeSpec("소울웨폰 공격력", Dope[7])

EditValueDope(8, 0, 2)
DopeSpec("전영비", UseLabel[Dope[8]])

EditValueDope(9, 0, 2)
DopeSpec("고대비", UseLabel[Dope[9]])

EditValueDope(10, 0, 2)
DopeSpec("MVP 슈퍼파워", UseLabel[Dope[10]])

EditValueDope(11, 0, 2)
DopeSpec("고보킬/반빨별", UseLabel[Dope[11]])

EditValueDope(12, 0, 2)
DopeSpec("고관비/반파별", UseLabel[Dope[12]])

EditValueDope(13, 0, 2)
DopeSpec("영메", UseLabel[Dope[13]])

EditValueDope(14, 0, 2)
DopeSpec("명장 크뎀", UseLabel[Dope[14]])

EditValueDope(15, 0, 16)
DopeSpec("길드스킬 크뎀", Dope[15])

EditValueDope(16, 0, 16)
DopeSpec("길드스킬 보뎀", Dope[16])

EditValueDope(17, 0, 16)
DopeSpec("길드스킬 데미지", Dope[17])

EditValueDope(18, 0, 16)
DopeSpec("길드스킬 방무", Dope[18])

EditValueDope(19, 0, 2)
DopeSpec("275 의자 버프", UseLabel[Dope[19]])


draw_line_width(x0 + 1080, y0 + 32 + 16, x0 + 1080 + 220, y0 + 32 + 16, 3)
i = 0;
function LinkSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 1080, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 1080 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 1080, y0 + 48 + 31 * (i + 1), x0 + 1080 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 1080

EditValueLink(0, 0, 7)
LinkSpec("모험가 법사", Link[0])

EditValueLink(1, 0, 7)
LinkSpec("모험가 도적", Link[1])

EditValueLink(2, 0, 3)
LinkSpec("카데나", Link[2])

EditValueLink(3, 0, 3)
LinkSpec("아크", Link[3])

EditValueLink(4, 0, 3)
LinkSpec("카인", Link[4])


i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 1080, y0 + 48 + 31 * i + 15, "유니온")
draw_set_font(fnt12)
draw_line_width(x0 + 1080, y0 + 48 + 31 * (i + 1), x0 + 1080 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function UnionSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 1080, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 1080 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 1080, y0 + 48 + 31 * (i + 1), x0 + 1080 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

UnionLabel = ["없음", "B", "A", "S", "SS", "SSS"]
EditValueOnOff("UnionWildHunter", 0, 6)
UnionSpec("와일드헌터", UnionLabel[UnionWildHunter])

EditValueOnOff("UnionMercedes", 1, 6)
UnionSpec("메르세데스", UnionLabel[UnionMercedes - 1])


i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 1080, y0 + 48 + 31 * i + 15, "하이퍼 스킬")
draw_set_font(fnt12)
draw_line_width(x0 + 1080, y0 + 48 + 31 * (i + 1), x0 + 1080 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function HyperSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 1080, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 1080 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 1080, y0 + 48 + 31 * (i + 1), x0 + 1080 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValueHyper(0, 0, 2)
HyperSpec("윔 리인포스", HyperSkill[0])

EditValueHyper(1, 0, 2)
HyperSpec("윔 인핸스", HyperSkill[1])

EditValueHyper(2, 0, 2)
HyperSpec("윔 더블 찬스", HyperSkill[2])

EditValueHyper(3, 0, 2)
HyperSpec("천노 리인포스", HyperSkill[3])

EditValueHyper(4, 0, 2)
HyperSpec("천노 이그노어 가드", HyperSkill[4])

EditValueHyper(5, 0, 2)
HyperSpec("천노 보스 킬러", HyperSkill[5])



draw_line_width(x0 + 1340, y0 + 32 + 16, x0 + 1340 + 220, y0 + 32 + 16, 3)
i = 0;
function BossSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 1340, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 1340 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 1340, y0 + 48 + 31 * (i + 1), x0 + 1340 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}
ClickXpos = 1340

EditValue("보스 레벨을 입력해주세요.", 250, 0, 300, "BossLv")
BossSpec("보스 레벨", BossLv)

ForceLabel = ["일반 필드", "아케인포스", "어센틱포스"]
EditValueOnOff("BossKind", 0, 3)
BossSpec(ForceLabel[BossKind], "")

EditValue("보스 포스를 입력해주세요.", 360, 0, 1320, "BossForce")
BossSpec("보스 포스", BossForce)

EditValue("캐릭터 포스를 입력해주세요.", 1320, 0, 1600, "MyForce")
BossSpec("내 포스", MyForce)

EditValueOnOff("BossHalf", 0, 2)
BossSpec("속성 반감", ExistLabel[BossHalf])

EditValue("보스 방어율을 입력해주세요.", 300, 0, 500, "BossArmor")
BossSpec("보스 방어율", BossArmor)


draw_set_font(fnt12)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(x0 + 20, y0 + 820, "총 딜량")
draw_rectangle_wh(x0 + 20, y0 + 830, 320, 50, 0)
if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 20, y0 + 830, x0 + 20 + 320, y0 + 830 + 50)) {
	UIShow = 1 - UIShow
}
draw_set_color(c_back)
draw_set_font(fnt16)
draw_text(x0 + 20 + 16, y0 + 830 + 28, drawUnit(round(DealDraw)))