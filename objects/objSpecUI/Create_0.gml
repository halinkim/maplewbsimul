/// @description Insert description here
// You can write your code in this editor
UIShow = 0
x0 = 32
y0 = 0
yset = 840
DealDraw = 0

SpecPureDex = 3717
SpecFixDex = 13620
SpecPureStr = 2389
SpecFixStr = 480
SpecLv = 256
SpecPerDex = 501
SpecPerStr = 177
SpecAtt = 2603
SpecPerAtt = 93
SpecDamage = 101
SpecBossDamage = 392
SpecArmorIgnore = 93.27
SpecFinalDamage = 48.5
SpecCriDamage = 92
SpecCriExp = 100
SpecBuffDuration = 38
SpecProDamage = 0
SpecCoolReduce = 0
SpecInsight = 100
SpecAbilityMultiple = 0
SpecMonsterLifeMultiple = 0
SpecMonsterLifeAtt = 0
SpecWeaponAtt = 725


CoreSkill[0] = 60 //천노
CoreSkill[1] = 60 //트라이플링 윔
CoreSkill[2] = 60 //스톰 브링어
CoreSkill[3] = 30 //하울링 게일 
CoreSkill[4] = 30 //볼텍스 스피어 
CoreSkill[5] = 25 //스파이더 인 미러 
CoreSkill[6] = 0 //크레스트 오브 더 솔라 
CoreSkill[7] = 20 //초월자 시그너스의 축복 
CoreSkill[8] = 30 //크리티컬 리인포스 
CoreSkill[9] = 30 //가이디드 애로우 
CoreSkill[10] = 30 //시그너스 팔랑크스 
CoreSkill[11] = 30 //아이들 윔 
CoreSkill[12] = 30 //윈드 월 

SeedRestraint = 3
SeedWeapon = 4
SeedRisk = 4
//SeedCriHM = 0
//SeedCriD = 0
//SeedSum = 0

SCoreName = ["일격필살 I", "보스 슬레이어 II", "치명적인 일격 I"]
SCoreNum = 0

ServerLag = 0

DurationBuff[0] = 0 //에메랄드 플라워
DurationBuff[1] = 0 //핀포인트 피어스 
DurationBuff[2] = 1 //가이디드 애로우 
DurationBuff[3] = 1 //트라이플링 윔 
DurationBuff[4] = 1 //스톰 브링어 
DurationBuff[5] = 1 //쓸만한 컴뱃 오더스 
DurationBuff[6] = 1 //시그너스 나이츠 
DurationBuff[7] = 1 //쓸만한 어드밴스드 블레스

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

Link[0] = 0 // 모법 
Link[1] = 0 // 모도
Link[2] = 0 // 카데나
Link[3] = 0 // 아크
Link[4] = 0 // 카인


UnionWildHunter = 4
UnionMercedes = 5

HyperSkill[0] = 1 //윔 리인포스 
HyperSkill[1] = 1 //윔 인핸스
HyperSkill[2] = 1 //윔 더블 찬스 
HyperSkill[3] = 1 //천노 리인포스 
HyperSkill[4] = 0 //천노 이그노어 가드 
HyperSkill[5] = 1 //천노 보스 킬러

BossLv = 230
BossKind = 1 // 일반 필드, 아케인포스, 어센틱 포스 
BossForce = 360
MyForce = 1350
BossHalf = 1
BossArmor = 300


CalculDexOn = 44926
CalculDexoff = 43760
CalculFixDex = 13620
CalculLv = 256

CalculAttDexOn = 44926
CalculAttStrOn = 6912
CalculFinalAtt = 40185624
CalculDmg = 101
CalculPerAtt = 93

PreSTR = 6954
PostSTR = 7034
FixedSTR = 480


SkillCoolBase[2] = 30
SkillCoolBase[3] = 10
SkillCoolBase[4] = 90
SkillCoolBase[5] = 30
SkillCoolBase[6] = 250
SkillCoolBase[7] = 250
SkillCoolBase[8] = 120
SkillCoolBase[9] = 120 // 글로리
SkillCoolBase[10] = 240
SkillCoolBase[11] = 90 // Soul Contract
SkillCoolBase[12] = 90 // 파괴의 얄다바오트
SkillCoolBase[13] = 30 // 특수 코어
SkillCoolBase[14] = 20 // 모도 링크
SkillCoolBase[15] = 40 // 카인 링크
SkillCoolBase[16] = 180
SkillCoolBase[17] = 180
SkillCoolBase[18] = 180

for (var i=2; i<=18; i++) {
	if (i == 9 or i == 12 or i == 13 or i == 14 or i == 15) {
		SkillCoolFinal[i] = SkillCoolBase[i]
	}
	else {
		SkillCoolFinal[i] = cooltime_final(SkillCoolBase[i], UnionMercedes, SpecCoolReduce)
	}
}




