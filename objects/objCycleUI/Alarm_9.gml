/// @description 데미지 계산 
// You can write your code in this editor


Lv = objSpecUI.SpecLv

// 무기 상수
WeaponConst = 1.3

// 숙련도
SkilledConst = (1 + 0.85 + 0.01 * objSpecUI.DurationBuff[5]) / 2

// 속성 내성
ResetConst = 1 - 0.5 * objSpecUI.BossHalf * (1 - floor(objSpecUI.SpecInsight / 10) * 0.005)

// 최종뎀
FinalDmg = (100 + objSpecUI.SpecFinalDamage + 1.1 * objSpecUI.DurationBuff[5]) / 100

// 레벨뻥
LvRate = Lv - objSpecUI.BossLv
LvConst = 1
if (LvRate >= 5) {
	LvConst = 1.2
}
else if (LvRate >= 0) {
	LvConst = 1.1 + 0.02 * LvRate
}
else if (LvRate == -1) {
	LvConst = 105.84
}
else if (LvRate == -2) {
	LvConst = 100.7
}
else if (LvRate == -3) {
	LvConst = 96.72
}
else if (LvRate == -4) {
	LvConst = 91.8
}
else if (LvRate >= -40) {
	LvConst = ceil(2.5 * (40 + LvRate))
}
else {
	LvConst = 0
}

// 포스
ForceConst = 1
switch (objSpecUI.BossKind) {
	case 0:
		ForceConst = 1
	break;
	case 1:
		ForceRate = objSpecUI.MyForce / objSpecUI.BossForce
		if (ForceRate >= 1.5) {
			ForceConst = 1.5
		}
		else if (ForceRate >= 1.3) {
			ForceConst = 1.3
		}
		else if (ForceRate >= 1.1) {
			ForceConst = 1.1
		}
		else if (ForceRate >= 1.0) {
			ForceConst = 1.0
		}
		else if (ForceRate >= 0.7) {
			ForceConst = 0.8
		}
		else if (ForceRate >= 0.5) {
			ForceConst = 0.7
		}
		else if (ForceRate >= 0.3) {
			ForceConst = 0.6
		}
		else if (ForceRate >= 0.1) {
			ForceConst = 0.3
		}
		else {
			ForceConst = 0.1
		}
	break;
	case 2:
		ForceRate = objSpecUI.MyForce - objSpecUI.BossForce
		if (ForceRate >= 50) {
			ForceConst = 1.25
		}
		else if (ForceRate >= 40) {
			ForceConst = 1.2
		}
		else if (ForceRate >= 30) {
			ForceConst = 1.15
		}
		else if (ForceRate >= 20) {
			ForceConst = 1.1
		}
		else if (ForceRate >= 10) {
			ForceConst = 1.05
		}
		else if (ForceRate >= 0) {
			ForceConst = 1.0
		}
		else if (ForceRate >= -10) {
			ForceConst = 0.9
		}
		else if (ForceRate >= -20) {
			ForceConst = 0.8
		}
		else if (ForceRate >= -30) {
			ForceConst = 0.7
		}
		else if (ForceRate >= -40) {
			ForceConst = 0.6
		}
		else if (ForceRate >= -50) {
			ForceConst = 0.5
		}
		else if (ForceRate >= -60) {
			ForceConst = 0.4
		}
		else if (ForceRate >= -70) {
			ForceConst = 0.3
		}
		else if (ForceRate >= -80) {
			ForceConst = 0.2
		}
		else if (ForceRate >= -90) {
			ForceConst = 0.1
		}
		else {
			ForceConst = 0.05
		}
	break;
}

// 스탯
StatsBase = 5 * objSpecUI.SpecLv + 18
StatsDexAdd = objSpecUI.SpecPureDex
StatsDexPer = objSpecUI.SpecPerDex
StatsDexFix = objSpecUI.SpecFixDex

StatsStrAdd = objSpecUI.SpecPureStr
StatsStrPer = objSpecUI.SpecPerStr
StatsStrFix = objSpecUI.SpecFixStr

StatsCygnus = (100 + objSpecUI.DurationBuff[6] * 15 + objSpecUI.DurationBuff[5]) / 100


StatsDexDope = objSpecUI.Dope[0] * 30
StatsStrDope = objSpecUI.Dope[1] * 30


// 공격력
AttBase = objSpecUI.SpecAtt
AttNonPer = objSpecUI.SpecMonsterLifeAtt * floor(Lv / 20)
AttDope = objSpecUI.DurationBuff[5] * 2 + 20 * objSpecUI.DurationBuff[7] + 30 * (objSpecUI.Dope[2] + objSpecUI.Dope[3] + objSpecUI.Dope[4] + objSpecUI.Dope[5] + objSpecUI.Dope[8] + objSpecUI.Dope[10]) + objSpecUI.Dope[6] * 15 + objSpecUI.Dope[7] + objSpecUI.Dope[19] * 50

// 공격력%
PerAttBase = objSpecUI.SpecPerAtt
PerAttDope = 20 + objSpecUI.DurationBuff[5] + objSpecUI.Dope[13] * 4

// 데미지
DmgBase = objSpecUI.SpecDamage
DmgBoss = objSpecUI.SpecBossDamage
DmgDope = objSpecUI.DurationBuff[5] + objSpecUI.SpecProDamage + objSpecUI.DurationBuff[1] * 15 + objSpecUI.Dope[9] * 10 + objSpecUI.Dope[11] * 20 + (objSpecUI.Dope[16] + objSpecUI.Dope[17]) * 2 + 3 * (floor((objSpecUI.Link[0] - 1) / 2) + 1) + objSpecUI.Link[2] * 3 + objSpecUI.Link[3] * 11 + objSpecUI.UnionWildHunter * 4 / 5
if (Lv > objSpecUI.BossLv) {
	DmgDope += objSpecUI.Link[2] * 3
}


// 크리티컬
CriExp = objSpecUI.SpecCriExp + objSpecUI.DurationBuff[5]
CriDmg = objSpecUI.SpecCriDamage + objSpecUI.DurationBuff[5]
CriDmgDope = objSpecUI.Dope[15] * 2 + objSpecUI.Dope[14] * 5

// 방무
AIgnoreBase = objSpecUI.SpecArmorIgnore
AIgnoreDope = (100 - 10 * objSpecUI.DurationBuff[0]) / 100 * (100 - 15 * objSpecUI.DurationBuff[1]) / 100 * (100 - 20 * objSpecUI.Dope[12]) / 100 * (100 - 2 * objSpecUI.Dope[18]) / 100 * (100 - (floor((objSpecUI.Link[0] - 1) / 2) + 1)) / 100 * (100 - (floor((objSpecUI.Link[0] - 1) / 2) + 1)) / 100 * (100 - (floor((objSpecUI.Link[0] - 1) / 2) + 1)) / 100
AIgnoreBoss = objSpecUI.BossArmor


//UnitDeal = WeaponConst * SkilledConst * ResetConst * FinalDmg * LvConst * ForceConst * (floor( floor(StatsBase * StatsCygnus + StatsDexAdd + StatsDexDope) * (100 + StatsDexPer) / 100 + StatsDexFix) * 4 + floor( (StatsStrAdd + StatsStrDope) * (100 + StatsStrPer) / 100 + StatsStrFix)) / 100 * floor( (AttBase + AttDope) * (100 + PerAttBase + PerAttDope) / 100 + AttNonPer) * (100 + DmgBase + DmgBoss + DmgDope) / 100 * (100 + min(100, CriExp) / 100 * (35 + CriDmg + CriDmgDope)) / 100 * max(0, (100 - AIgnoreBoss * ((100 - AIgnoreBase) / 100 *  AIgnoreDope))) / 100


Consts = WeaponConst * SkilledConst * ResetConst * FinalDmg * LvConst * ForceConst
StatsDexs = StatsBase * StatsCygnus + StatsDexAdd + StatsDexDope
StatsStrs = (StatsStrAdd + StatsStrDope) * (100 + StatsStrPer) / 100 + StatsStrFix
Atts = AttBase + AttDope
PerAtts = PerAttBase + PerAttDope
Dmgs = DmgBase + DmgBoss + DmgDope
CriDmgs = CriDmg + CriDmgDope
AIgnores = (100 - AIgnoreBase) / 100 * AIgnoreDope

//UnitDeal = Consts * (floor( floor(StatsDexs) * (100 + StatsDexPer) / 100 + StatsDexFix) * 4 + floor(StatsStrs)) / 100 * floor(Atts * (100 + PerAtts) / 100 + AttNonPer) * (100 + Dmgs) / 100 * (100 + min(100, CriExp) / 100 * (35 + CriDmgs)) / 100 * max(0, (100 - AIgnoreBoss * AIgnores)) / 100

function NewDeal(AddDex, AddDmg, AddPerAtt, AddCriExp, AddCriDmg, AddAIgnore, AddFDmg) {
	return min(150000000000, Consts * (floor( floor(StatsDexs + AddDex) * (100 + StatsDexPer) / 100 + StatsDexFix) * 4 + floor(StatsStrs)) / 100 * floor(Atts * (100 + PerAtts + AddPerAtt) / 100 + AttNonPer) * (100 + Dmgs + AddDmg) / 100 * (100 + min(100, CriExp + AddCriExp) / 100 * (35 + CriDmgs + AddCriDmg)) / 100 * max(0, (100 - AIgnoreBoss * AIgnores * AddAIgnore)) / 100 * AddFDmg)
}

TotalDeal = 0
SkillDeal[8] = 0 // 가이디드 
SkillDeal[9] = 0 // 윔 
SkillDeal[10] = 0 // 스톰

// 천공의 노래
SkillDeal[0] = 0
i = 0
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
baseDmg = 345 + 3 * objSpecUI.DurationBuff[5]
baseDmg *= (100 + objSpecUI.CoreSkill[0] * 2) / 100

if (objSpecUI.CoreSkill[0] >= 20) {
	// 최대 공격 가능 대상 + 1
	AttObject += 1
}
if (objSpecUI.CoreSkill[0] >= 40) {
	// 방무 +20%
	dAddAIgnore *= (100 - 20) / 100
}
dAddDmg += power(1.2, AttObject - 1)
// 하이퍼 스킬 
dAddDmg += 20 * objSpecUI.HyperSkill[3] + 30 * objSpecUI.HyperSkill[5]
dAddAIgnore *= (100 - 20 * objSpecUI.HyperSkill[4]) / 100

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDuration[i][k];
	var interval = 120
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[0] += NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		// 윔 
		if (objSpecUI.DurationBuff[3]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
			ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
			idAddDmg += 20 * objSpecUI.HyperSkill[0]
			//show_debug_message("윔 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[1] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[1] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		// 스톰 브링어 
		if (objSpecUI.DurationBuff[4]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = 0.3 * 500
			ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
			//idAddDmg += 20 * objSpecUI.CoreSkill[0]
			//show_debug_message("스톰 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[2] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[2] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		
	}
}


// 하울링 게일
SkillDeal[1] = 0
i = 1
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1


for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDuration[i][k];
	if (SkillKind[i][k] == 1) {
		baseDmg = 325 + 13 * objSpecUI.CoreSkill[3]
		show_debug_message(string(baseDmg))
	}
	else {
		baseDmg = 785 + 31 * objSpecUI.CoreSkill[3]
		show_debug_message(string(baseDmg))
	}
	var interval = 150
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += 3 * NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		// 윔 
		if (objSpecUI.DurationBuff[3]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
			ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
			idAddDmg += 20 * objSpecUI.HyperSkill[0]
			//show_debug_message("윔 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[1] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[1] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		// 스톰 브링어 
		if (objSpecUI.DurationBuff[4]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = 0.3 * 500
			ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
			//idAddDmg += 20 * objSpecUI.CoreSkill[0]
			//show_debug_message("스톰 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[2] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[2] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		
	}
}



// 볼텍스 스피어 
SkillDeal[2] = 0
i = 2
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
baseDmg = 400 + 16 * objSpecUI.CoreSkill[4]

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDelay[i] * SkillAttack[i] / 1000;
	
	var interval = SkillDelay[i]
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += 6 * NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		// 윔 
		if (objSpecUI.DurationBuff[3]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
			ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
			idAddDmg += 20 * objSpecUI.HyperSkill[0]
			//show_debug_message("윔 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[1] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[1] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		// 스톰 브링어 
		if (objSpecUI.DurationBuff[4]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = 0.3 * 500
			ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
			//idAddDmg += 20 * objSpecUI.CoreSkill[0]
			//show_debug_message("스톰 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[2] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[2] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		
	}
}



// 아이들 윔
i = 3
SkillDeal[i] = 0
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
baseDmg = 550 + 22 * objSpecUI.CoreSkill[11]

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDelay[i] * SkillAttack[i] / 1000;
	
	var interval = SkillDelay[i]
	IdleFDmg = 1
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += 3 * NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * IdleFDmg * baseDmg / 100)
		IdleFDmg *= 0.85
		
		//// 윔 
		//if (objSpecUI.DurationBuff[3]) {
		//	idAddDex = 0
		//	idAddDmg = 0
		//	idAddPerAtt = 0
		//	idAddCriExp = 0
		//	idAddCriDmg = 0
		//	idAddAIgnore = 1
		//	idAddFDmg = 1
		//	//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
		//	ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
		//	ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
		//	idAddDmg += 20 * objSpecUI.HyperSkill[0]
		//	//show_debug_message("윔 : " + string(ibaseDmg))
		//	if (objSpecUI.CoreSkill[1] >= 20) {
		//		idAddCriExp += 5
		//	}
		//	if (objSpecUI.CoreSkill[1] >= 40) {
		//		idAddAIgnore *= (100 - 20) / 100
		//	}
		//	if (isCriRein) {
		//		idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
		//	}
		//	SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		//}
		//// 스톰 브링어 
		//if (objSpecUI.DurationBuff[4]) {
		//	idAddDex = 0
		//	idAddDmg = 0
		//	idAddPerAtt = 0
		//	idAddCriExp = 0
		//	idAddCriDmg = 0
		//	idAddAIgnore = 1
		//	idAddFDmg = 1
		//	//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
		//	ibaseDmg = 0.3 * 500
		//	ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
		//	//idAddDmg += 20 * objSpecUI.CoreSkill[0]
		//	//show_debug_message("스톰 : " + string(ibaseDmg))
		//	if (objSpecUI.CoreSkill[2] >= 20) {
		//		idAddCriExp += 5
		//	}
		//	if (objSpecUI.CoreSkill[2] >= 40) {
		//		idAddAIgnore *= (100 - 20) / 100
		//	}
		//	if (isCriRein) {
		//		idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
		//	}
		//	SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		//}
		
	}
}




// 윈드 윌
i = 4
SkillDeal[i] = 0
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
baseDmg = (550 + 22 * objSpecUI.CoreSkill[12]) * 0.5

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDelay[i] * SkillAttack[i] / 1000;
	
	var interval = SkillDelay[i]
	
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += 15 * NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		
		//// 윔 
		//if (objSpecUI.DurationBuff[3]) {
		//	idAddDex = 0
		//	idAddDmg = 0
		//	idAddPerAtt = 0
		//	idAddCriExp = 0
		//	idAddCriDmg = 0
		//	idAddAIgnore = 1
		//	idAddFDmg = 1
		//	//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
		//	ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
		//	ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
		//	idAddDmg += 20 * objSpecUI.HyperSkill[0]
		//	//show_debug_message("윔 : " + string(ibaseDmg))
		//	if (objSpecUI.CoreSkill[1] >= 20) {
		//		idAddCriExp += 5
		//	}
		//	if (objSpecUI.CoreSkill[1] >= 40) {
		//		idAddAIgnore *= (100 - 20) / 100
		//	}
		//	if (isCriRein) {
		//		idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
		//	}
		//	SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		//}
		//// 스톰 브링어 
		//if (objSpecUI.DurationBuff[4]) {
		//	idAddDex = 0
		//	idAddDmg = 0
		//	idAddPerAtt = 0
		//	idAddCriExp = 0
		//	idAddCriDmg = 0
		//	idAddAIgnore = 1
		//	idAddFDmg = 1
		//	//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
		//	ibaseDmg = 0.3 * 500
		//	ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
		//	//idAddDmg += 20 * objSpecUI.CoreSkill[0]
		//	//show_debug_message("스톰 : " + string(ibaseDmg))
		//	if (objSpecUI.CoreSkill[2] >= 20) {
		//		idAddCriExp += 5
		//	}
		//	if (objSpecUI.CoreSkill[2] >= 40) {
		//		idAddAIgnore *= (100 - 20) / 100
		//	}
		//	if (isCriRein) {
		//		idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
		//	}
		//	SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		//}
		
	}
}


// 스핑크스 팔랑크스
i = 5
SkillDeal[i] = 0
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
baseDmg = 450 + 18 * objSpecUI.CoreSkill[10]

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDelay[i] * SkillAttack[i] / 1000;
	
	var interval = SkillDelay[i]
	
	for (var t=0; t * interval < kST * 1000;t++) {
		search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		
		// 윔 
		if (objSpecUI.DurationBuff[3]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
			ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
			idAddDmg += 20 * objSpecUI.HyperSkill[0]
			//show_debug_message("윔 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[1] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[1] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		// 스톰 브링어 
		if (objSpecUI.DurationBuff[4]) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = 0.3 * 500
			ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
			//idAddDmg += 20 * objSpecUI.CoreSkill[0]
			//show_debug_message("스톰 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[2] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[2] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		
	}
}



// 스인미
i = 6
SkillDeal[i] = 0
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
baseDmg = 175 + 7 * objSpecUI.CoreSkill[5]
//baseDmg2 = 450 + 18 * objSpecUI.CoreSkill[5]

for (var k=0; k<j; k++) {
	var kSP = SkillPos[i][k];
	var kST = SkillDelay[i] * SkillAttack[i] / 1000;
	
	var interval = SkillDelay[i]
	
	for (var t=0; t <= 30;t++) {
		//search = kSP + t * interval / 1000
		iAddDex = 0
		iAddDmg = 0
		iAddPerAtt = 0
		iAddCriExp = 0
		iAddCriDmg = 0
		iAddAIgnore = 1
		iAddFDmg = 1
		
		if (t == 0) {
			baseDmg = 450 + 18 * objSpecUI.CoreSkill[5]
			SIMtime = 15
			search = kSP
		}
		else {
			baseDmg = 175 + 7 * objSpecUI.CoreSkill[5]
			SIMtime = 8
			search = kSP + floor((t - 1) / 5) * 9 + 2 + ((t - 1) % 5) * 0.75
		}
		
		// 글로리 오브 가디언즈 
		for (var s=0; s<array_length(SkillPos[9]); s++) {
			if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
				iAddDmg += 10
				break;
			}
		}
		// 초시축 
		for (var s=0; s<array_length(SkillPos[10]); s++) {
			if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
				iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
				break;
			}
		}
		// 엔버 링크 
		for (var s=0; s<array_length(SkillPos[11]); s++) {
			if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
				iAddDmg += 45
				break;
			}
		}
		// 파괴 버프
		iSkillInd = 12
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddFDmg *= 1.15
				break;
			}
		}
		// 특수 코어 
		iSkillInd = 13
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SCoreNum == 0) {
					iAddDmg += 100
				}
				else if (objSpecUI.SCoreNum == 1) {
					iAddDmg += 50
				}
				else {
					iAddCriExp += 100
				}
				break;
			}
		}
		// 모도 
		iSkillInd = 14
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDmg += 3 * objSpecUI.Link[1]
				break;
			}
		}
		// 카인
		iSkillInd = 15
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.Link[4]) {
					iAddDmg += 1 + 8 * objSpecUI.Link[4]
				}
				break;
			}
		}
		// 리레
		iSkillInd = 16
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddPerAtt += 25 * objSpecUI.SeedRestraint
				break;
			}
		}
		// 웨펖 
		iSkillInd = 17
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
				break;
			}
		}
		// 리테 
		iSkillInd = 18
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
				if (objSpecUI.SeedRisk) {
					iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
					break;
				}
			}
		}
		// 스킬 범위 제한 
		iSkillInd = 19
		iiAddFDmg = 0
		for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
			if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
				iiAddFDmg = 1
				break;
			}
		}
		iAddFDmg *= iiAddFDmg

		
		// 크리티컬 리인포스, 제일 나중에 계산 
		isCriRein = 0
		for (var s=0; s<array_length(SkillPos[8]); s++) {
			if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
				iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
				isCriRein = 1
				//show_message("CriReinForce")
				break;
			}
		}
		
		
		SkillDeal[i] += SIMtime * NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		
		// 윔 
		if (objSpecUI.DurationBuff[3] and t == 0) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = ((290 + 3 * objSpecUI.DurationBuff[5]) * 0.8 + (390 + 3 * objSpecUI.DurationBuff[5]) * 0.2) * (0.5 + 0.1 * objSpecUI.HyperSkill[1]) * (1 + objSpecUI.HyperSkill[2]) // 윔 기댓값
			ibaseDmg *= (100 + objSpecUI.CoreSkill[1] * 2) / 100 // 코강 
			idAddDmg += 20 * objSpecUI.HyperSkill[0]
			//show_debug_message("윔 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[1] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[1] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[9] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		// 스톰 브링어 
		if (objSpecUI.DurationBuff[4] and t == 0) {
			idAddDex = 0
			idAddDmg = 0
			idAddPerAtt = 0
			idAddCriExp = 0
			idAddCriDmg = 0
			idAddAIgnore = 1
			idAddFDmg = 1
			//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
			ibaseDmg = 0.3 * 500
			ibaseDmg *= (100 + objSpecUI.CoreSkill[2] * 2) / 100 // 코강 
			//idAddDmg += 20 * objSpecUI.CoreSkill[0]
			//show_debug_message("스톰 : " + string(ibaseDmg))
			if (objSpecUI.CoreSkill[2] >= 20) {
				idAddCriExp += 5
			}
			if (objSpecUI.CoreSkill[2] >= 40) {
				idAddAIgnore *= (100 - 20) / 100
			}
			if (isCriRein) {
				idAddCriDmg += idAddCriExp * (20 + objSpecUI.CoreSkill[8]) / 100
			}
			SkillDeal[10] += NewDeal(idAddDex + iAddDex, idAddDmg + iAddDmg, idAddPerAtt + iAddPerAtt, idAddCriExp + iAddCriExp, idAddCriDmg + iAddCriDmg, idAddAIgnore * iAddAIgnore, idAddFDmg * iAddFDmg * ibaseDmg / 100)
		}
		
	}
}



// 가이디드 애로우
SkillDeal[8] = 0
i = 19
var j = array_length(SkillPos[i]);

dAddDex = 0
dAddDmg = 0
dAddPerAtt = 0
dAddCriExp = 0
dAddCriDmg = 0
dAddAIgnore = 1
dAddFDmg = 1
//AttObject = 4 + objSpecUI.SpecMonsterLifeMultiple + objSpecUI.SpecAbilityMultiple
baseDmg = 400 + 16 * objSpecUI.CoreSkill[9]

if (objSpecUI.DurationBuff[2]) {
	for (var k=0; k<j; k++) {
		var kSP = SkillPos[i][k];
		var kST = SkillDuration[i][k];
		if (objSpecUI.DurationBuff[2] == 2) {
			var interval = 330;
		}
		else {
			var interval = 600;
		}
	
		for (var t=0; t * interval < kST * 1000;t++) {
			search = kSP + t * interval / 1000
			iAddDex = 0
			iAddDmg = 0
			iAddPerAtt = 0
			iAddCriExp = 0
			iAddCriDmg = 0
			iAddAIgnore = 1
			iAddFDmg = 1
		
			// 글로리 오브 가디언즈 
			for (var s=0; s<array_length(SkillPos[9]); s++) {
				if (SkillPos[9][s] <= search and search <= SkillPos[9][s] + SkillDelay[9] / 1000) {
					iAddDmg += 10
					break;
				}
			}
			// 초시축 
			for (var s=0; s<array_length(SkillPos[10]); s++) {
				if (SkillPos[10][s] <= search and search <= SkillPos[10][s] + SkillDelay[10] / 1000) {
					iAddDmg += objSpecUI.CoreSkill[7] + floor((search - SkillPos[10][s]) / 4) * floor(6 + objSpecUI.CoreSkill[7] / 15)
					break;
				}
			}
			// 엔버 링크 
			for (var s=0; s<array_length(SkillPos[11]); s++) {
				if (SkillPos[11][s] <= search and search <= SkillPos[11][s] + SkillDelay[11] / 1000) {
					iAddDmg += 45
					break;
				}
			}
			// 파괴 버프
			iSkillInd = 12
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					iAddFDmg *= 1.15
					break;
				}
			}
			// 특수 코어 
			iSkillInd = 13
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					if (objSpecUI.SCoreNum == 0) {
						iAddDmg += 100
					}
					else if (objSpecUI.SCoreNum == 1) {
						iAddDmg += 50
					}
					else {
						iAddCriExp += 100
					}
					break;
				}
			}
			// 모도 
			iSkillInd = 14
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					iAddDmg += 3 * objSpecUI.Link[1]
					break;
				}
			}
			// 카인
			iSkillInd = 15
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					if (objSpecUI.Link[4]) {
						iAddDmg += 1 + 8 * objSpecUI.Link[4]
					}
					break;
				}
			}
			// 리레
			iSkillInd = 16
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					iAddPerAtt += 25 * objSpecUI.SeedRestraint
					break;
				}
			}
			// 웨펖 
			iSkillInd = 17
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					iAddDex += objSpecUI.SpecWeaponAtt * objSpecUI.SeedWeapon
					break;
				}
			}
			// 리테 
			iSkillInd = 18
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDelay[iSkillInd] / 1000) {
					if (objSpecUI.SeedRisk) {
						iAddPerAtt += 10 + 10 * objSpecUI.SeedRisk
						break;
					}
				}
			}
			// 스킬 범위 제한 
			iSkillInd = 19
			iiAddFDmg = 0
			for (var s=0; s<array_length(SkillPos[iSkillInd]); s++) {
				if (SkillPos[iSkillInd][s] <= search and search <= SkillPos[iSkillInd][s] + SkillDuration[iSkillInd][s]) {
					iiAddFDmg = 1
					break;
				}
			}
			iAddFDmg *= iiAddFDmg

		
			// 크리티컬 리인포스, 제일 나중에 계산 
			isCriRein = 0
			for (var s=0; s<array_length(SkillPos[8]); s++) {
				if (SkillPos[8][s] <= search and search <= SkillPos[8][s] + SkillDelay[8] / 1000) {
					iAddCriDmg += (CriExp + dAddCriExp + iAddCriExp) * (20 + objSpecUI.CoreSkill[8]) / 100
					isCriRein = 1
					//show_message("CriReinForce")
					break;
				}
			}
		
		
			SkillDeal[8] += NewDeal(dAddDex + iAddDex, dAddDmg + iAddDmg, dAddPerAtt + iAddPerAtt, dAddCriExp + iAddCriExp, dAddCriDmg + iAddCriDmg, dAddAIgnore * iAddAIgnore, dAddFDmg * iAddFDmg * baseDmg / 100)
		
		}
	}
}



TotalDeal = SkillDeal[0] + SkillDeal[1] + SkillDeal[2] + SkillDeal[3] + SkillDeal[4] + SkillDeal[5] + SkillDeal[6] + SkillDeal[8] + SkillDeal[9] + SkillDeal[10]

objSpecUI.DealDraw = TotalDeal
if (TotalDeal == 0) {
	SkillDealDraw[0] = 0
	SkillDealDraw[1] = 0
	SkillDealDraw[2] = 0
	SkillDealDraw[3] = 0
	SkillDealDraw[4] = 0
	SkillDealDraw[5] = 0
	SkillDealDraw[6] = 0
	SkillDealDraw[7] = 0
	SkillDealDraw[8] = 0
	SkillDealDraw[9] = 0
	SkillDealDraw[10] = 0
}
else {
	SkillDealDraw[0] = SkillDeal[0] / TotalDeal * 100
	SkillDealDraw[1] = SkillDeal[1] / TotalDeal * 100
	SkillDealDraw[2] = SkillDeal[2] / TotalDeal * 100
	SkillDealDraw[3] = SkillDeal[3] / TotalDeal * 100
	SkillDealDraw[4] = SkillDeal[4] / TotalDeal * 100
	SkillDealDraw[5] = SkillDeal[5] / TotalDeal * 100
	SkillDealDraw[6] = SkillDeal[6] / TotalDeal * 100
	SkillDealDraw[7] = 0
	SkillDealDraw[8] = SkillDeal[8] / TotalDeal * 100
	SkillDealDraw[9] = SkillDeal[9] / TotalDeal * 100
	SkillDealDraw[10] = SkillDeal[10] / TotalDeal * 100
}

