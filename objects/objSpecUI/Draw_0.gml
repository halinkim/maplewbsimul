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
	if (point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		if (mouse_check_button_pressed(mb_left)) {
			var getInt = Dope[index] + 1;
			if (getInt >= left + choicenum) {
				getInt -= choicenum
			}
			array_set(Dope, index, getInt)
		}
		else if (mouse_check_button_pressed(mb_right)) {
			var getInt = Dope[index] - 1;
			if (getInt < left) {
				getInt += choicenum
			}
			array_set(Dope, index, getInt)
		}
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

function PushTip(text) {
	if (point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
		array_push(objTooltip.TipText, text)
	}
}

if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 40, y0 + 48 + 31 * i, x0 + 40 + 220, y0 + 48 + 31 * (i + 1))) {
	var getInt = get_integer("레벨을 입력해주세요.", 250);
	if (200 <= getInt and getInt <= 300) {
		SpecLv = getInt
	}
}
PushTip("캐릭터의 레벨이다.")
BaseSpec("레벨", SpecLv)
if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + 40, y0 + 48 + 31 * i, x0 + 40 + 220, y0 + 48 + 31 * (i + 1))) {
	var getInt = get_integer("순수 DEX를 입력해주세요.", 1000);
	if (0 <= getInt and getInt <= 99999) {
		SpecPureDex = getInt
	}
}
PushTip("장비, 스킬 등으로 얻는 DEX이다. 우측의 순 DEX 계산기를 통해서 계산할 수 있다. 매 레벨업마다 획득하는 5만큼의 DEX는 포함되지 않는다.")
BaseSpec("순수 DEX", SpecPureDex)

PushTip("아케인 심볼, 어센틱 심볼, 어빌리티, 하이퍼 스탯, 유니온 공격대원 효과 등을 통해 얻는 DEX이다. DEX%의 영향을 받지 않는다.")
EditValue("고정 DEX를 입력해주세요.", 13200, 0, 99999, "SpecFixDex")
BaseSpec("고정 DEX", SpecFixDex)

PushTip("장비, 스킬 등을 통해 얻는 STR이다.")
EditValue("순수 STR를 입력해주세요.", 400, 0, 99999, "SpecPureStr")
BaseSpec("순수 STR", SpecPureStr)

PushTip("하이퍼 스탯, 어빌리티, 유니온 공격대원 효과 등을 통해 얻는 STR이다. 직접 찾아 입력해주어야 한다. 단, 10단계 힘의 물약 도핑을 하지 않을 경우 이 값을 스탯창에 표시되는 STR을 입력하고, STR%와 순수 STR는 0을 입력하여도 된다.")
EditValue("고정 STR를 입력해주세요.", 400, 0, 99999, "SpecFixStr")
BaseSpec("고정 STR", SpecFixStr)

PushTip("장비, 스킬 등으로 얻는 DEX%이다. 오른쪽의 순 DEX 계산기를 통해서 계산할 수 있다.")
EditValue("DEX%를 입력해주세요.", 500, 0, 9999, "SpecPerDex")
BaseSpec("DEX%", SpecPerDex)

PushTip("장비, 스킬 등으로 얻는 STR%이다.")
EditValue("STR%를 입력해주세요.", 100, 0, 9999, "SpecPerStr")
BaseSpec("STR%", SpecPerStr)

PushTip("장비, 스킬, 하이퍼 스탯, 유니온 공격대원 배치 등을 통해 얻는다. 우측의 공격력 계산기를 통해 구할 수 있다. 만약 몬스터 라이프에 쁘띠 루미너스(이퀄리브리엄)이 있다면 잠시 보관함에 넣어두고 계산한다. 리스트레인트링 또는 리스크테이커링은 공격력%가 오르기 때문이다.")
EditValue("공격력을 입력해주세요.", 3000, 0, 99999, "SpecAtt")
BaseSpec("공격력", SpecAtt)

PushTip("무기의 공격력이다. 추옵, 주문작, 스타포스로 상승한 총합 공격력이다. 웨폰퍼프링의 계산에 필요하다.")
EditValue("무기 공격력을 입력해주세요.", 725, 0, 9999, "SpecWeaponAtt")
BaseSpec("무기 공격력", SpecWeaponAtt)

PushTip("무기, 보조 무기, 엠블렘 등에서 얻는 공격력%이다. 0차 스킬 엘리멘탈 엑스퍼트, 영웅의 메아리와 4차 스킬 윈드 블레싱 등의 스킬로 인한 공격력%는 포함하지 않는다.")
EditValue("공격력%를 입력해주세요. (스킬 제외)", 100, 0, 999, "SpecPerAtt")
BaseSpec("공격력%", SpecPerAtt)

PushTip("무기, 보조 무기, 엠블렘, 스킬, 하이퍼 스탯 등을 통해 얻는 데미지%이다.")
EditValue("데미지를 입력해주세요.", 90, 0, 999, "SpecDamage")
BaseSpec("데미지", SpecDamage)

PushTip("무기, 보조 무기, 엠블렘, 스킬, 하이퍼 스탯, 유니온 공격대 등을 통해 얻는 보스 데미지%이다")
EditValue("보스데미지를 입력해주세요.", 400, 0, 999, "SpecBossDamage")
BaseSpec("보스데미지", SpecBossDamage)

PushTip("무기, 보조 무기, 엠블렘, 스킬, 하이퍼 스탯, 유니온 공격대 등을 통해 얻는 방어력 무시%이다")
EditValue("방어력무시값을 입력해주세요.", 95, 0, 109, "SpecArmorIgnore")
BaseSpec("방어력무시", SpecArmorIgnore)

//EditValue("최종데미지를 입력해주세요.", 48.5, 0, 9999, "SpecFinalDamage")
PushTip("스킬을 통해 얻는다. 컴뱃 오더스가 적용되지 않은 값이다. 수정할 수 없다.")
BaseSpec("최종데미지", SpecFinalDamage)

PushTip("장비, 스킬, 하이퍼 스탯, 유니온 공격대 등을 통해 얻는 크리 데미지%이다.")
EditValue("크리데미지를 입력해주세요.", 90, 0, 999, "SpecCriDamage")
BaseSpec("크리데미지", SpecCriDamage)

PushTip("장비, 스킬, 하이퍼 스탯, 유니온 공격대 등을 통해 얻는 크리티컬 확률%이다.")
EditValue("크리티컬확률을 입력해주세요.", 100, 0, 999, "SpecCriExp")
BaseSpec("크리티컬확률", SpecCriExp)

PushTip("어빌리티, 유니온 공격대 등을 통해 얻을 수 있다. 윈드브레이커의 경우 소울 컨트랙트(엔젤릭버스터 링크)의 가동 시간을 늘리는데 이용된다.")
EditValue("버프지속시간을 입력해주세요. (%)", 20, 0, 999, "SpecBuffDuration")
BaseSpec("버프지속시간", SpecBuffDuration)

PushTip("어빌리티에서 상태 이상에 걸린 대상 공격 시 데미지 증가 옵션을 얻을 수 있다.")
EditValue("어빌리티 상추뎀을 입력해주세요.", 8, 0, 99, "SpecProDamage")
BaseSpec("상추뎀", SpecProDamage)

PushTip("모자의 잠재능력으로 얻는 쿨타임 감소값이다. 이 값을 수정한다면 딜 사이클 타임라인이 바뀔 수 있으니 이 값을 먼저 입력하고 타임라인을 수정하는 것이 좋다.")
EditValue("모자 쿨감값을 입력해주세요. (초)", 3, 0, 9, "SpecCoolReduce")
BaseSpec("쿨감", SpecCoolReduce)

PushTip("성향 - 통찰력 레벨이다. 최대 5%의 속성내성무시 효과를 얻을 수 있다.")
EditValue("성향 통찰력 레벨을 입력해주세요.", 100, 0, 100, "SpecInsight")
BaseSpec("통찰력", SpecInsight)

PushTip("레전드리 어빌리티를 통해 얻는 다수 공격 스킬의 공격 대상 +1 이다. 천공의 노래 데미지 상승에 기여한다.")
EditValueOnOff("SpecAbilityMultiple", 0, 2)
BaseSpec("어빌리티 다수기", ExistLabel[SpecAbilityMultiple])

//EditValueOnOff("SpecMonsterLifeMultiple", 0, 2)
//BaseSpec("몬라 다수기", ExistLabel[SpecMonsterLifeMultiple])

PushTip("몬스터 라이프에서 쁘띠 루미너스(이퀄리브리엄)을 얻을 수 있다.")
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

PushTip("제작자가 아직 256레벨인 관계로 직접 실험하지 못해 구현하지 못하였습니다. 도움 주실 분 연락바랍니다. 카카오톡 오픈채팅 프로필 [스카니아/Pz파전/훰린]")
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



i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + ClickXpos, y0 + 48 + 31 * i + 15, "하이퍼 스킬")
draw_set_font(fnt12)
draw_line_width(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function HyperSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + ClickXpos, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + ClickXpos + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValueHyper(0, 0, 2)
PushTip("트라이플링 윔의 데미지 20% 증가")
HyperSpec("윔 리인포스", HyperSkill[0])

EditValueHyper(1, 0, 2)
PushTip("트라이플링 윔의 발생 확룰 10%p 증가")
HyperSpec("윔 인핸스", HyperSkill[1])

EditValueHyper(2, 0, 2)
PushTip("트라이플링 윔 정령 기운이 2배로 발생")
HyperSpec("윔 더블 찬스", HyperSkill[2])

EditValueHyper(3, 0, 2)
PushTip("천공의 노래 데미지 20% 증가")
HyperSpec("천노 리인포스", HyperSkill[3])

EditValueHyper(4, 0, 2)
PushTip("천공의 노래 방어율 무시 20% 증가")
HyperSpec("천노 이그노어 가드", HyperSkill[4])

EditValueHyper(5, 0, 2)
PushTip("천공의 노래 보스 공격 시 데미지 30% 증가")
HyperSpec("천노 보스 킬러", HyperSkill[5])




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
PushTip("일부 스킬은 서버렉의 영향을 받아 더 오래 지속된다.")
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
PushTip("대형, 중소형은 무릉도장 안개 숲 수련장의 보스 설정이다. 대형의 경우 분당 180타, 중소형의 경우 분당 100타로 설정되어 있다.")
BuffSpec("가이디드 애로우", GuidedLabel[DurationBuff[2]])

EditValueBuff(3, 0, 2)
BuffSpec("트라이플링 윔", UseLabel[DurationBuff[3]])

EditValueBuff(4, 0, 2)
BuffSpec("스톰 브링어", UseLabel[DurationBuff[4]])

EditValueBuff(5, 0, 2)
PushTip("쓸만한 컴뱃 오더스")
BuffSpec("쓸컴뱃", UseLabel[DurationBuff[5]])

EditValueBuff(6, 0, 2)
PushTip("=메이플 용사")
BuffSpec("시그너스 나이츠", UseLabel[DurationBuff[6]])

EditValueBuff(7, 0, 2)
PushTip("쓸만한 어드밴스드 블레스")
BuffSpec("쓸어블", UseLabel[DurationBuff[7]])







i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + ClickXpos, y0 + 48 + 31 * i + 15, "유니온")
draw_set_font(fnt12)
draw_line_width(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function UnionSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + ClickXpos, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + ClickXpos + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

UnionLabel = ["없음", "B", "A", "S", "SS", "SSS"]
EditValueOnOff("UnionWildHunter", 0, 6)
PushTip("공격시 20% 확률로 데미지 증가, [B : 60Lv, 4%, A : 100LV, 8%, S : 140LV, 12%, SS : 200LV, 16%, SSS : 250LV, 20%], 여기서는 기댓값으로 ÷5로 적용하였다.")
UnionSpec("와일드헌터", UnionLabel[UnionWildHunter])

PushTip("스킬 쿨타임 감소, [2%, 3%, 4%, 5%, 6%]")
EditValueOnOff("UnionMercedes", 1, 6)
UnionSpec("메르세데스", UnionLabel[UnionMercedes - 1])








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
PushTip("DEX가 30 증가한다.")
DopeSpec("10단계 민첩", UseLabel[Dope[0]])

EditValueDope(1, 0, 2)
PushTip("STR가 30 증가한다.")
DopeSpec("10단계 힘 ", UseLabel[Dope[1]])

EditValueDope(2, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("익스 레드", UseLabel[Dope[2]])

EditValueDope(3, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("유니온의 힘", UseLabel[Dope[3]])

EditValueDope(4, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("길축", UseLabel[Dope[4]])

EditValueDope(5, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("우뿌", UseLabel[Dope[5]])

EditValueDope(6, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("붕뿌", UseLabel[Dope[6]])

EditValueDope(7, 0, 21)
PushTip("공격력이 0~20 증가한다.")
DopeSpec("소울웨폰 공격력", Dope[7])

EditValueDope(8, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("전영비", UseLabel[Dope[8]])

EditValueDope(9, 0, 2)
PushTip("데미지가 10%p 증가한다.")
DopeSpec("고대비", UseLabel[Dope[9]])

EditValueDope(10, 0, 2)
PushTip("공격력이 30 증가한다.")
DopeSpec("MVP 슈퍼파워", UseLabel[Dope[10]])

EditValueDope(11, 0, 2)
PushTip("보스 데미지가 20%p 증가한다.")
DopeSpec("고보킬/반빨별", UseLabel[Dope[11]])

EditValueDope(12, 0, 2)
PushTip("방어율 무시가 20%p 증가한다.")
DopeSpec("고관비/반파별", UseLabel[Dope[12]])

EditValueDope(13, 0, 2)
PushTip("공격력%이 4%p 증가한다.")
DopeSpec("영메", UseLabel[Dope[13]])

EditValueDope(14, 0, 2)
PushTip("크리티컬 데미지가 5%p 증가한다.")
DopeSpec("명장 크뎀", UseLabel[Dope[14]])

EditValueDope(15, 0, 16)
PushTip("크리티컬 데미지가 0~30%p 증가한다.")
DopeSpec("길드스킬 크뎀", Dope[15])

EditValueDope(16, 0, 16)
PushTip("보스 데미지가 0~30%p 증가한다.")
DopeSpec("길드스킬 보뎀", Dope[16])

EditValueDope(17, 0, 16)
PushTip("데미지가 0~30%p 증가한다.")
DopeSpec("길드스킬 데미지", Dope[17])

EditValueDope(18, 0, 16)
PushTip("방어율 무시가 0~30%p 증가한다.")
DopeSpec("길드스킬 방무", Dope[18])

EditValueDope(19, 0, 2)
PushTip("공격력이 50 증가한다.")
DopeSpec("275 의자 버프", UseLabel[Dope[19]])


if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
	Dope[0] = 0 // 10단계 민첩
	Dope[1] = 0 // 10단계 힘 
	Dope[2] = 0 // 익스 레드 
	Dope[3] = 0 // 유니온의 힘 
	Dope[4] = 0 // 길축 
	Dope[5] = 0 // 우뿌 
	Dope[6] = 0 // 붕뿌 
	Dope[7] = 0 // 소울웨폰 공격력
	Dope[8] = 0 // 전영비 
	Dope[9] = 0 // 고대비
	Dope[10] = 0 // MVP 슈퍼파워 
	Dope[11] = 0 // 고보킬/반빨별
	Dope[12] = 0 // 고관비/반파별
	Dope[13] = 0 // 영메 
	Dope[14] = 0 // 명장 크뎀
	Dope[15] = 0 // 길드스킬 크뎀 
	Dope[16] = 0 // 길드스킬 보뎀 
	Dope[17] = 0 // 길드스킬 데미지
	Dope[18] = 0 // 길드스킬 방무
	Dope[19] = 0 // 275 의자 버프
}

DopeSpec("모두 해제하기", "")

if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x0 + ClickXpos, y0 + 48 + 31 * i, x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))) {
	Dope[0] = 1 // 10단계 민첩
	Dope[1] = 1 // 10단계 힘 
	Dope[2] = 1 // 익스 레드 
	Dope[3] = 1 // 유니온의 힘 
	Dope[4] = 1 // 길축 
	Dope[5] = 1 // 우뿌 
	Dope[6] = 1 // 붕뿌 
	Dope[7] = 20 // 소울웨폰 공격력
	Dope[8] = 1 // 전영비 
	Dope[9] = 1 // 고대비
	Dope[10] = 1 // MVP 슈퍼파워 
	Dope[11] = 1 // 고보킬/반빨별
	Dope[12] = 1 // 고관비/반파별
	Dope[13] = 1 // 영메 
	Dope[14] = 1 // 명장 크뎀
	Dope[15] = 15 // 길드스킬 크뎀 
	Dope[16] = 15 // 길드스킬 보뎀 
	Dope[17] = 15 // 길드스킬 데미지
	Dope[18] = 15 // 길드스킬 방무
	Dope[19] = 1 // 275 의자 버프
}
DopeSpec("모두 적용하기", "")


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
PushTip("중첩당 데미지, 방어율 무시가 각각 [1%p, 1%p, 2%p, 2%p, 3%p, 3%p] 증가한다. 최대 3중첩까지 적용된다.")
LinkSpec("모험가 법사", Link[0])

EditValueLink(1, 0, 7)
PushTip("10초 동안 데미지가 [3%p, 6%p, 9%p, 12%p, 15%p] 증가한다. 쿨타임 20초")
LinkSpec("모험가 도적", Link[1])

EditValueLink(2, 0, 3)
PushTip("자신보다 낮은 레벨의 몬스터 공격시 데미지 [3%p, 6%p]증가하고 상태이상 공격시 데미지가 [3%p, 6%p] 증가한다. 여기서는 상시 상태이상 공격으로 적용된다.")
LinkSpec("카데나", Link[2])

EditValueLink(3, 0, 3)
PushTip("발동 시 데미지 1%p 증가, 중첩당 데미지 [1%p, 2%p] 증가, 최대 5중첩")
LinkSpec("아크", Link[3])

EditValueLink(4, 0, 3)
PushTip("20초 동안 데미지가 [9%p, 17%p] 증가한다. 쿨타임 40초")
LinkSpec("카인", Link[4])



i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + ClickXpos, y0 + 48 + 31 * i + 15, "공격력 계산기")
draw_set_font(fnt12)
draw_line_width(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function CalculAtt(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + ClickXpos, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + ClickXpos + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))
	i++;
}



EditValue("메용 사용 후 DEX를 입력해주세요. (쓸컴뱃 X, 도핑 X)", 40000, 1, 99999, "CalculAttDexOn")
CalculAtt("메용 후 DEX", CalculAttDexOn)
EditValue("STR를 입력해주세요.", 7000, 1, 99999, "CalculAttStrOn")
CalculAtt("STR", CalculAttStrOn)
EditValue("뒷스공을 입력해주세요. (컴뱃X, 메용 사용)", 40000000, 1, 999999999, "CalculFinalAtt")
CalculAtt("스공", CalculFinalAtt)
EditValue("상세 스탯창의 데미지를 입력해주세요.", 90, 0, 999, "CalculDmg")
CalculAtt("데미지", CalculDmg)
EditValue("무보엠류 공격력% 합을 입력해주세요.", 90, 0, 999, "CalculPerAtt")
CalculAtt("공격력%", CalculPerAtt)

CalculFAtt = ceil(CalculFinalAtt / ((CalculAttDexOn * 4 + CalculAttStrOn) / 100 * 1.3 * (120 + CalculPerAtt) / 100 * (100 + CalculDmg) / 100 * (100 + 48.5) / 100))
PushTip("최종적으로 계산된 공격력이다. 계산된 값을 왼쪽 기본 스펙 카테고리의 공격력에 입력하자.")
CalculAtt("▶공격력", CalculFAtt)




/////// STR 계산기

i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + ClickXpos, y0 + 48 + 31 * i + 15, "순수 STR 계산기")
draw_set_font(fnt12)
draw_line_width(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function CalculStr(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + ClickXpos, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + ClickXpos + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))
	i++;
}



PushTip("(향상된) 10단계 힘의 물약 사용 전 STR. 시그너스 나이츠(메용)이나 쓸컴뱃 등은 써도 안 써도 상관없다.")
EditValue("도핑 전 STR을 입력해주세요.", 6954, 1, 99999, "PreSTR")
CalculStr("도핑 전 STR", PreSTR)

PushTip("(향상된) 10단계 힘의 물약 사용 후 STR. 향상된 물약과 그렇지 않은 물약의 차이는 지속 시간에 있기 때문에 10단계이기만 하면 된다.")
EditValue("도핑 후 STR을 입력해주세요.", 6954, 1, 99999, "PostSTR")
CalculStr("도핑 후 STR", PostSTR)

PushTip("고정 STR. 유니온 공격대원 효과(점령X, 유니온 UI 우측 하단에서 확인할 수 있다.), 어빌리티, 하이퍼 스탯에서의 값을 모두 합하여 계산한다.")
EditValue("고정 STR을 입력해주세요.", 480, 1, 99999, "FixedSTR")
CalculStr("고정 STR", FixedSTR)
DeltaSTR = PostSTR - PreSTR
EstPerSTR = round(DeltaSTR / 30 * 100) - 100

FEstSTR = "알 수 없음"
FEstPerSTR = "알 수 없음"
for (var j=0; j<=5; j++) {
	//var ReDope = floor(
	if (j == 0) {
		var EstSTR = ceil((PreSTR - FixedSTR) / (100 + EstPerSTR) * 100);
		var EstPreSTR = floor(EstSTR * (100 + EstPerSTR) / 100 + FixedSTR);
		var EstPostSTR = floor((EstSTR + 30) * (100 + EstPerSTR) / 100 + FixedSTR);
		//show_debug_message(string(EstSTR))
		//show_debug_message(string(EstPreSTR))
		//show_debug_message(string(EstPostSTR))
		if (EstPreSTR == PreSTR and EstPostSTR == PostSTR) {
			FEstSTR = EstSTR
			FEstPerSTR = EstPerSTR
			break;
		}
	}
	else {
		var iEstPerSTR = EstPerSTR + j;
		var EstSTR = ceil((PreSTR - FixedSTR) / (100 + iEstPerSTR) * 100);
		var EstPreSTR = floor(EstSTR * (100 + iEstPerSTR) / 100 + FixedSTR);
		var EstPostSTR = floor((EstSTR + 30) * (100 + iEstPerSTR) / 100 + FixedSTR);
		if (EstPreSTR == PreSTR and EstPostSTR == PostSTR) {
			FEstSTR = EstSTR
			FEstPerSTR = iEstPerSTR
			break;
		}
		
		var iEstPerSTR = EstPerSTR - j;
		var EstSTR = ceil((PreSTR - FixedSTR) / (100 + iEstPerSTR) * 100);
		var EstPreSTR = floor(EstSTR * (100 + iEstPerSTR) / 100 + FixedSTR);
		var EstPostSTR = floor((EstSTR + 30) * (100 + iEstPerSTR) / 100 + FixedSTR);
		if (EstPreSTR == PreSTR and EstPostSTR == PostSTR) {
			FEstSTR = EstSTR
			FEstPerSTR = iEstPerSTR
			break;
		}
		
	}
}



PushTip("정확히 계산하지는 못한다. 더 정확하게 구하는 방법은 장비창의 모든 올스탯%, STR%를 찾아 더한 후, 제논 링크 스킬인 하이브리드 로직의 올스탯% 수치를 더하여 STR%를 직접 구한 뒤, 현재 스탯창의 STR에 맞게 순수 STR을 조절해보는 방법이다. 물론 부스탯인 STR에 있어서 수%는 전체적인 결과에 큰 기여는 하지 않을 것이다.")

CalculStr("▶순수 STR", FEstSTR)

CalculStr("▶STR%", FEstPerSTR)

//EditValue("메용 사용 후 DEX를 입력해주세요. (쓸컴뱃 X, 도핑 X)", 40000, 1, 99999, "CalculAttDexOn")
//CalculAtt("메용 후 DEX", CalculAttDexOn)
//EditValue("STR를 입력해주세요.", 7000, 1, 99999, "CalculAttStrOn")
//CalculAtt("STR", CalculAttStrOn)
//EditValue("뒷스공을 입력해주세요. (컴뱃X, 메용 사용)", 40000000, 1, 999999999, "CalculFinalAtt")
//CalculAtt("스공", CalculFinalAtt)
//EditValue("상세 스탯창의 데미지를 입력해주세요.", 90, 0, 999, "CalculDmg")
//CalculAtt("데미지", CalculDmg)
//EditValue("무보엠류 공격력% 합을 입력해주세요.", 90, 0, 999, "CalculPerAtt")
//CalculAtt("공격력%", CalculPerAtt)

//CalculFAtt = ceil(CalculFinalAtt / ((CalculAttDexOn * 4 + CalculAttStrOn) / 100 * 1.3 * (120 + CalculPerAtt) / 100 * (100 + CalculDmg) / 100 * (100 + 48.5) / 100))
//PushTip("최종적으로 계산된 공격력이다. 계산된 값을 왼쪽 기본 스펙 카테고리의 공격력에 입력하자.")
//CalculAtt("공격력", CalculFAtt)






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

PushTip("보스의 레벨을 입력한다.")
EditValue("보스 레벨을 입력해주세요.", 250, 0, 300, "BossLv")
BossSpec("보스 레벨", BossLv)

ForceLabel = ["일반 필드", "아케인포스", "어센틱포스"]
EditValueOnOff("BossKind", 0, 3)
PushTip("일반 필드, 아케인포스 필드, 어센틱포스 필드인지 선택한다.")
BossSpec(ForceLabel[BossKind], "")

PushTip("아케인포스 필드 또는 어센티포스 필드인 경우 입력한 포스가 적용된다.")
EditValue("보스 포스를 입력해주세요.", 360, 0, 1320, "BossForce")
BossSpec("보스 포스", BossForce)

PushTip("위에서 아케인포스 또는 어센틱포스를 선택하였을 경우 캐릭터의 포스를 입력한다.")
EditValue("캐릭터 포스를 입력해주세요.", 1320, 0, 1600, "MyForce")
BossSpec("내 포스", MyForce)

EditValueOnOff("BossHalf", 0, 2)
PushTip("보스의 속성 반감 여부를 선택한다. 대부분의 주간 보스 이상은 모두 속성 반감을 가지고 있다.")
BossSpec("속성 반감", ExistLabel[BossHalf])

EditValue("보스 방어율을 입력해주세요.", 300, 0, 500, "BossArmor")
PushTip("보스의 방어율이다.")
BossSpec("보스 방어율", BossArmor)



i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + 1340, y0 + 48 + 31 * i + 15, "최종 스펙")
draw_set_font(fnt12)
draw_line_width(x0 + 1340, y0 + 48 + 31 * (i + 1), x0 + 1340 + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function FinalSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + 1340, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + 1340 + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + 1340, y0 + 48 + 31 * (i + 1), x0 + 1340 + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

DrawFDex = floor((floor( (5 * SpecLv + 18) * (115 + DurationBuff[5]) / 100 +  SpecPureDex + Dope[0] * 30) * (100 + SpecPerDex) / 100) + SpecFixDex)
DrawFStr = floor((floor( SpecPureStr + Dope[1] * 30) * (100 + SpecPerStr) / 100) + SpecFixStr)

DrawFAtt = SpecAtt + DurationBuff[7] * 20 + DurationBuff[5] * 2 + 30 * (Dope[2] + Dope[3] + Dope[4] + Dope[5] + Dope[6] + Dope[8] + Dope[10]) + Dope[7] + Dope[19] * 50
DrawFPerAtt = SpecPerAtt + DurationBuff[5] + 20 + Dope[13] * 4
DrawFNonPerAtt = SpecMonsterLifeAtt * floor(SpecLv / 20)

DrawFWeaponConst = 1.3
DrawFDmg = SpecDamage + Dope[9] * 10 + Dope[17] * 2
DrawFFDmg = SpecFinalDamage + 1.1 * DurationBuff[5]

DrawFStatAtt = floor((DrawFDex * 4 + DrawFStr) / 100 * (DrawFAtt * (100 + DrawFPerAtt) / 100 + DrawFNonPerAtt) * DrawFWeaponConst * (100 + DrawFDmg) / 100 * (100 + DrawFFDmg) / 100)


//EditValueOnOff("SCoreNum", 0, 3)
PushTip("스탯 공격력이다. 기본 스펙에 쓸컴뱃, 쓸어블, 시그너스 나이츠, 각종 도핑들이 적용된 값이다.")
FinalSpec("스공", string(drawUnit(DrawFStatAtt)))
FinalSpec("DEX", string(DrawFDex))
FinalSpec("STR", string(DrawFStr))
FinalSpec("공격력", string(DrawFAtt))
PushTip("기본 스펙의 공격력%에 스킬, 도핑 등이 적용된 값이다.")
FinalSpec("공격력%", string(DrawFPerAtt))
FinalSpec("데미지", string(DrawFDmg))
FinalSpec("최종데미지", string(DrawFFDmg))





i++;
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_gray0)
draw_set_font(fnt16)
draw_text(x0 + ClickXpos, y0 + 48 + 31 * i + 15, "순수 DEX 계산기")
draw_set_font(fnt12)
draw_line_width(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1), 3)
i++;
function CalculSpec(name, value) {
	draw_set_halign(fa_left)
	draw_text(x0 + ClickXpos, y0 + 48 + 16 + 31 * i, name)
	draw_set_halign(fa_right)
	draw_text(x0 + ClickXpos + 220, y0 + 48 + 16 + 31 * i, string(value))
	draw_line(x0 + ClickXpos, y0 + 48 + 31 * (i + 1), x0 + ClickXpos + 220, y0 + 48 + 31 * (i + 1))
	i++;
}

EditValue("캐릭터 레벨을 입력해주세요.", 275, 200, 300, "CalculDexOff")
CalculSpec("레벨", CalculLv)
EditValue("메용 사용 후 DEX를 입력해주세요. (컴뱃 오프, 노도핑)", 90, 1, 99999, "CalculDexOn")
CalculSpec("메용O DEX", CalculDexOn)
EditValue("메용 사용 해제 후 DEX를 입력해주세요.", 90, 1, 99999, "CalculDexoff")
CalculSpec("메용X DEX", CalculDexoff)
EditValue("고정 DEX를 입력해주세요. (심볼, 하이퍼, 어빌, 유니온 공격대원)", 13200, 0, 99999, "CalculFixDex")
CalculSpec("고정 DEX", CalculFixDex)

CalculPureDex = CalculDexoff - CalculFixDex
CalculLvAp = 5 * CalculLv + 18
CalculRealIncrease = CalculDexOn - CalculDexoff
CalculPureIncrease = floor(CalculLvAp * 0.15)

CalculPerDex = round((CalculRealIncrease / CalculPureIncrease - 1) * 100) / 100
//CalculRealPureDex = ceil(CalculPureDex / (1 + CalculPerDex))

PushTip("최종적으로 계산된 순수한 DEX이다. 왼쪽 기본 스펙 카테고리의 순수 DEX에 입력하자.")
CalculSpec("▶순수 DEX", ceil(CalculPureDex / (1 + CalculPerDex) - CalculLvAp) )
PushTip("최종적으로 계산된 DEX%이다. 왼쪽 기본 스펙 카테고리의 DEX%에 입력하자.")
CalculSpec("▶DEX%", CalculPerDex * 100)






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