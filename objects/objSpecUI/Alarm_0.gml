/// @description 쿨감 수치 수정
// You can write your code in this editor

for (var i=2; i<=18; i++) {
	if (i == 9 or i == 12 or i == 13 or i == 14 or i == 15) {
		SkillCoolFinal[i] = SkillCoolBase[i]
	}
	else {
		SkillCoolFinal[i] = cooltime_final(SkillCoolBase[i], UnionMercedes, SpecCoolReduce)
	}
}
objCycleUI.alarm[0] = 1