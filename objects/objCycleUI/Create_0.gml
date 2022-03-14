/// @description Insert description here
// You can write your code in this editor
x0 = 92
y0 = 900

TimePos = 0
TimeScale = 480

MousePressed = 0
MouseOffsetx = 0
MouseOffsety = 0

TimeBarMoving = 0



SkillName = ["천공의 노래", "하울링 게일", "볼텍스 스피어", "아이들 윔", "윈드 월", "스핑크스 팔랑크스", "스파이더 인 미러",
			 "크레스트 오브 더 솔라", "크리티컬 리인포스", "글로리 오브 가디언즈", "초월자 시그너스의 축복", "소울 컨트랙트",
			 "파괴의 얄다바오트", "일격필살 I", "모험가 도적 링크", "카인 링크", "리스트레인트링", "웨폰퍼프링", "리스크테이커링", "스킬 제한"]
isSkillCoolReduce = [0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0]


SkillPos[0] = []
SkillDuration[0] = []

SkillPos[1] = []
SkillDuration[1] = []
SkillKind[1] = []

SkillPos[2] = []
SkillDuration[2] = []
SkillDelay[2] = 180
SkillAttack[2] = 20

SkillPos[3] = []
SkillDuration[3] = []
SkillDelay[3] = 100
SkillAttack[3] = 10

SkillPos[4] = []
SkillDuration[4] = []
SkillDelay[4] = 2000
SkillAttack[4] = 24

SkillPos[5] = []
SkillDuration[5] = []
SkillDelay[5] = 240
SkillAttack[5] = 70

SkillPos[6] = []
SkillDuration[6] = []
SkillDelay[6] = 50000
SkillAttack[6] = 1

SkillPos[7] = []
SkillDuration[7] = []
SkillDelay[7] = 51000
SkillAttack[7] = 1

SkillPos[8] = []
SkillDuration[8] = []
SkillDelay[8] = 30000
SkillAttack[8] = 1

SkillPos[9] = []
SkillDuration[9] = []
SkillDelay[9] = 60000
SkillAttack[9] = 1

SkillPos[10] = []
SkillDuration[10] = []
SkillDelay[10] = 45000
SkillAttack[10] = 1

SkillPos[11] = []
SkillDuration[11] = []
SkillDelay[11] = 10000 // Buff +
SkillAttack[11] = 1

SkillPos[12] = []
SkillDuration[12] = []
SkillDelay[12] = 30000
SkillAttack[12] = 1

// V Matrix
SkillPos[13] = []
SkillDuration[13] = []
SkillDelay[13] = 2000
SkillAttack[13] = 1

SkillPos[14] = []
SkillDuration[14] = []
SkillDelay[14] = 10000
SkillAttack[14] = 1

SkillPos[15] = []
SkillDuration[15] = []
SkillDelay[15] = 20000
SkillAttack[15] = 1

SkillPos[16] = []
SkillDuration[16] = []
SkillDelay[16] = 10000
SkillAttack[16] = 1

SkillPos[17] = []
SkillDuration[17] = []
SkillDelay[17] = 10000
SkillAttack[17] = 1

SkillPos[18] = []
SkillDuration[18] = []
SkillDelay[18] = 10000
SkillAttack[18] = 1


SkillPos[19] = [0]
SkillDuration[19] = [12]

SkillPosMoving = 0
SkillPosMovingI = 0
SkillPosMovingJ = 0
SkillDurationMoving = 0
SkillDurationMovingI = 0
SkillDurationMovingJ = 0

array_push(SkillPos[0], 0)
array_push(SkillDuration[0], 12)



SkillNum = array_length(SkillName)

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

alarm[0] = 1
alarm[1] = 1