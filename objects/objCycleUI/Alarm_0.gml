/// @description 쿨감 수치 수정
// You can write your code in this editor





for (var i=0; i<SkillNum; i++) {
	if (isSkillCoolReduce[i]) {
		for (var j=0; j<array_length(SkillPos[i]); j++) {
			SkillDuration[i][j] = objSpecUI.SkillCoolFinal[i]
		}
	}
}

SkillDelay[8] = 30000 + objSpecUI.ServerLag * 1000
SkillDelay[9] = 60000 + objSpecUI.ServerLag * 1000
SkillDelay[10] = 45000 + objSpecUI.ServerLag * 1000

SkillDelay[11] = 10000 * (1 + objSpecUI.SpecBuffDuration / 100) + objSpecUI.ServerLag * 1000 // 소울 컨트랙트

SkillDelay[12] = 30000 + objSpecUI.ServerLag * 1000
for (var j=0; j<array_length(SkillPos[12]); j++) {
	SkillDuration[12][j] = 90000 +  + objSpecUI.ServerLag * 1000
}

SCoreTime = [2, 10, 10]
SkillDelay[13] = SCoreTime[objSpecUI.SCoreNum] * 1000 + objSpecUI.ServerLag * 1000

SeedTime1 = [9, 11, 13, 15]
SeedTime2 = [12, 18, 24, 30]

SkillDelay[14] = 10000 + objSpecUI.ServerLag * 1000
SkillDelay[15] = 20000 + objSpecUI.ServerLag * 1000
SkillDelay[16] = SeedTime1[objSpecUI.SeedRestraint - 1] * 1000
SkillDelay[17] = SeedTime1[objSpecUI.SeedWeapon - 1] * 1000 + objSpecUI.ServerLag * 1000
SkillDelay[18] = SeedTime2[objSpecUI.SeedRisk - 1] * 1000 + objSpecUI.ServerLag * 1000

SkillAttack[5] = 40 + objSpecUI.CoreSkill[10]