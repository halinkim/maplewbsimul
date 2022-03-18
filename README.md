# 메이플스토리 윈드브레이커 시뮬레이터 사용법

## 전체적인 동작 구조

- 이 프로그램은 크게 다음과 같은 두 가지 페이지로 구성되어 있습니다. 페이지간 이동은 좌측에 있는 `총 딜량` 검은색 박스를 클릭하여 이루어집니다.
    - 첫 번째 페이지 : 캐릭터의 스펙과 보스 정보 등을 입력합니다.
    - 두 번째 페이지 : 최대 480초까지의 딜 타임라인을 입력합니다.
- 먼저 첫 번째 페이지를 채운 뒤에, 두 번째 페이지에서 상황에 맞는 딜 타임라인을 입력하고, 키보드의 `F5` 버튼을 누르면 좌측에 있는 `총 딜량` 에서 해당 딜 타임라인에 따라 딜을 넣었을 때, **실제로 들어가는 딜**을 출력하게 됩니다.
- 아래에서 각 페이지에 대한 상세한 설명을 참고해주세요.
- 키보드의 `F1` 버튼을 눌러 도움말을 키고 끌 수 있습니다.
![image](https://user-images.githubusercontent.com/89760255/159033187-e77f1bc6-a860-4edc-9210-03f9f14b6f17.png)
![image](https://user-images.githubusercontent.com/89760255/159033235-2a76ea2e-d809-4453-9a69-26311267cb47.png)

## 첫 번째 페이지, 스펙 정보 입력

- 첫 번째 페이지에서는 다음과 같은 하위 카테고리를 확인하실 수 있습니다.

### 기본 스펙

- 기본적인 스펙을 입력하는 부분입니다.
- 입력을 시작하기 전에 다음과 같은 과정을 따라주시길 바랍니다.
    - 재접속을 합니다. 남아있는 버프와 **무기의 소울 게이지**를 빠르게 초기화하기 위함입니다.
    - `쓸만한 컴뱃 오더스`, `쓸만한 어드밴스드 블레스` 스킬은 사용하지 않아야 합니다. 펫 버프에서 빼두시는 것을 추천드립니다.
    - 1차 스킬의 `엘리멘트 : 스톰` 을 사용해야 합니다.
    - 4차 스킬의 `시그너스 나이츠`와 `샤프 아이즈`를 사용해야 합니다.
    - 가이디드 애로우, 스톰 브링어, 트라이플링 윔 등은 스탯 자체에 영향을 미치지 않기 때문에 사용 유무에 상관이 없습니다.
![image](https://user-images.githubusercontent.com/89760255/159033332-7ec1823a-9614-440d-a860-606fdcdeb224.png)

- 다음과 같은 스펙은 쉽게 입력하실 수 있을 것입니다.
    - 레벨
    - 무기 공격력 : 무기의 **총 공격력**을 입력해야 합니다. 아래 사진의 경우 725를 입력해야 합니다.
    
    ![image](https://user-images.githubusercontent.com/89760255/159033406-40a01e30-12c1-441b-ae7c-ae34795f076e.png)
    
    - 공격력% : **무기, 보조 무기, 엠블렘**에 있는 공격력%를 모두 더하여 입력해야 합니다.
    - 데미지 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다.
    - 보스데미지 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다.
    - 방어력 무시 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다.
    - 크리데미지 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다.
    - 크리티컬 확률 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다. __100%를 넘는 경우 그 수치를 그대로__ 입력합니다.
    - 버프지속시간 : 스탯창 - 자세히보기를 눌러 **상세스탯**에서 확인하실 수 있습니다.
    - 상추뎀 : 어빌리티에서 확인하실 수 있습니다.
    - 쿨감 : 장비 - 모자의 잠재능력에서 확인하실 수 있습니다. 초 단위로 입력합니다.
    - 통찰력 : 성향에서 확인하실 수 있습니다. 0부터 100까지의 레벨을 입력합니다.
    - 어빌리티 다수기 : 어빌리티에서 확인하실 수 있습니다.
    - 몬라 이퀄 루미 : 몬스터라이프에서 쁘띠 루미너스(이퀄리브리엄)이 적용중이라면 체크합니다.
- 다음은 조금 찾아보셔야 합니다.
    - **고정 DEX** : 아케인심볼, 어센틱 심볼, 어빌리티, 하이퍼스탯, 유니온 공격대원 효과에서 얻는 고정 DEX를 모두 더하여 입력해야 합니다.
    - **고정 STR** : 어빌리티, 하이퍼스탯, 유니온 공격대원 효과에서 얻는 고정 STR를 모두 더하여 입력해야 합니다.
- 다음은 별도의 계산기를 통해 입력해야 합니다. 물론 직접 각 장비, 스킬 등의 수치를 찾아 더하여 구할 수도 있겠지만, 이는 굉장히 힘들고 과정에서 실수할 가능성이 높습니다.
    - **순수 DEX, DEX%** : 우측 하단의 순수 DEX 계산기를 통해 구합니다.
        - 레벨, 메용을 사용했을 때 DEX, 메용을 사용하지 않았을 때  DEX, 그리고 앞에서 구한 고정 DEX를 입력하면 순수 DEX, DEX%의 값을 구할 수 있습니다.
        - 이후 나오는 공격력 계산기, 순수 STR 계산기는 모두 별도로 작동합니다. 따라서 레벨, 메용 후 DEX 등을 각각 따로 입력해주어야 합니다.
    - **순수 STR, STR%** : 우측 하단의 순수 STR 계산기를 통해 구합니다.
        - 도핑 전 STR는 현재의 STR를 그대로 입력하면 됩니다.
        - 도핑 후 STR는 (향상된) 10단계 힘의 물약을 먹은 이후의 STR를 입력하면 됩니다.
        - 고정 STR는 앞서 구한 고정 STR의 값을 입력하면 됩니다.
        - STR 계산은 변화 수치가 작아 정확한 값을 측정하기 힘듭니다. 이외의 방법으로 STR%를 먼저 직접 구하는 방법이 있습니다. 이는 장비에서의 올스탯%, STR%를 모두 더하고, 제논 링크 스킬인 하이브리드 로직의 올스탯% 수치를 더해 구할 수 있으므로 그렇게 어렵지는 않습니다.
        - STR는 부스탯으로 수 % 정도의 오차는 결과적으로 크게 중요하지 않습니다. 게다가 만약 힘의 물약 도핑을 하지 않을 예정이라면, 그냥 순수 STR에 현재 STR를 적고, 나머지 고정 STR, STR%를 0으로 입력해도 됩니다.
    - **공격력** : 우측 중단의 공격력 계산기를 통해 구합니다.
        - 모두 앞서 구한 값을 입력하면 됩니다.
        - 만약 앞서 힘의 물약을 먹은 상태라면 해제해주어야 합니다.
- 여기까지 따라오신 여러분 수고 많으셨습니다. 이후의 과정은 큰 어려움이 없을 것입니다.

### 코어 강화

- 해당 스킬의 코어 강화 레벨을 입력합니다.

### 하이퍼 스킬

- 해당 스킬의 사용 여부를 입력합니다.

### 시드링

- 해당 시드링의 레벨을 입력합니다.
- 사용하지 않을 예정이라면 이후 딜 타임라인에서 사용하지 않으면 되니, 레벨은 아무 레벨이나 입력해도 됩니다.

### 특수 코어

- 일격필살1, 보스 슬레이어2, 치명적인 일격1 중 사용할 특수 코어를 선택합니다.
- 아쉽게도 둘 이상의 코어를 동시에 사용할 수는 없습니다.

### 서버렉

- 서버렉으로 인해 추가되는 지속 시간을 최대 3초까지 선택합니다.
- 이로인해 일부 버프들의 지속 시간이 길어집니다.
- 리레링 등의 일부 스킬은 서버렉의 영향을 받지 않습니다.

### 지속 버프

- 사용할 버프를 선택합니다.
- 에메랄드 플라워와 핀포인트 피어스는 모두 상시 적용이 가능하므로 여기서 사용하게끔 하였습니다.

### 유니온

- 와일드헌터와 메르세데스의 유니온 등급을 선택합니다.

### 도핑

- 사용할 도핑을 선택합니다.
- 모두 해제하기, 모두 적용하기를 이용하면 더 쉽게 선택 가능할 것입니다.
- 소울웨폰 공격력, 길드 스킬의 경우 **마우스 왼쪽, 오른쪽 버튼**을 모두 사용하여 보다 쉽게 조절할 수 있습니다.

### 링크 스킬

- 링크 스킬의 레벨을 입력합니다.

### 공격력 계산기

### 순수 STR 계산기

### 보스 정보

- 보스의 레벨, 보스와 자신의 포스, 속성 반감 여부, 방어율을 입력합니다.

### 최종 스펙

- 여기를 통해 기본 스펙을 잘 입력했는지 확인합니다.
- 지속 버프의 쓸컴뱃, 쓸어블, 도핑 등에 따라 값이 갱신되니 잘 확인해주세요.
- 실제와 조금의 오차가 있을 수 있으나 아무리 커도 0.1% 이내의 오차를 가질 것입니다.

### 순수 DEX 계산기

- 여기까지 모두 입력을 완료하셨으면 왼쪽 하단의 총 딜량 검은색 박스를 클릭하여 두 번째 페이지로 넘어갈 수 있습니다.

## 두 번째 페이지, 딜 타임라인 입력

- 사실 이 부분은 직접 이것저것 눌러보시는 것이 좋습니다.

### 타임라인바

- 먼저 상단의 타임라인을 확인하실 수 있습니다.
    ![image](https://user-images.githubusercontent.com/89760255/159033470-84cc5879-bfb3-4272-8d35-ee9f5d0e95f3.png)

- 위의 숫자는 초 단위로 현재 표시하고 있는 영역을 나타냅니다.
- 최소 20초, 최대 480초까지 나타낼 수 있습니다.
- `마우스 휠 버튼`을 이용해 표시할 영역을 확대, 축소할 수 있습니다.
- 진한 회색 바를 드래그하여 표시할 영역을 이동할 수 있습니다.
- 이 부분은 직접 사용해보시면 어렵지 않게 익히실 수 있을 것입니다.

### 스킬별 타임라인

- 왼쪽에서는 각 스킬들의 이름을 확인하실 수 있습니다.
- 직접 공격을 하는 스킬 이름 왼쪽에는 %가 붙어 총 딜량 중 해당 스킬의 비중을 나타냅니다. (F5를 눌러야 반영이 됩니다.)
- 분홍색 `+ 버튼`을 눌러 스킬을 추가할 수 있습니다.
- 각각의 타임라인은 마우스 드래그를 통해 이동하거나 범위를 변경할 수 있습니다.
- 범위 변경은 천공의 노래, 스킬 제한의 경우에 대해 가능하며, 타임라인의 끝 부분에 마우스를 위치시켜 드래그하면 됩니다.
- 각 타임라인에 마우스를 올리면 보조선이 나타나 다른 스킬, 시간과 쉽게 맞출 수 있습니다.
- 드래그하여 이동하는 경우 시간 간격은 **0.1초 단위**이며, 키보드의 `G` 키를 누르면 **1초 단위로 이동할 수 있습니다.**

- **천공의 노래**
    - 속사기형 스킬로 쿨타임이 없습니다.
    - 분홍색 바가 공격중임을 나타냅니다.
- **하울링 게일**
    - 스택형 스킬입니다. 추가할 때 1 게일인지, 2 게일인지 입력해야 합니다.
    - 더 진한 색이 2 게일을 나타냅니다.
    - 스택에 따른 사용 가능 시간 범위의 제약이 있습니다.
    - 66타를 타격하도록 되어 있습니다. 따라서 실전에서는 이보다 덜한 딜이 나올 수 있습니다.
- 볼텍스 스피어, 아이들 윔, 윈드 월, 스핑크스 팔랑크스, 스파이더 인 미러
    - 쿨타임이 있는 액티브형 스킬입니다.
- 크레스트 오브 더 솔라
    - 제작자가 아직 256레벨인 관계로 구현하지 못했습니다. 위의 스킬들은 직접 충분한 실험을 통해 최대한 실제와 같이 작동하도록 하였습니다.
- 가이디드
    - 첫 번째 페이지의 지속 버프에서 키거나 끌 수 있습니다.
    - 아래의 스킬 제한이 있는 곳에서 항상 일정한 타수로 공격합니다.
- 윔, 스톰
    - 첫 번째 페이지의 지속 버프에서 키거나 끌 수 있습니다.
    - 윔, 스톰을 발생시키는 공격을 할 시 자동으로 반영됩니다.
- 기타 버프들
- **스킬 제한**
    - 스킬 제한이 있는 시간에서만 공격이 들어갑니다.
    - 예를 들어 스킬 제한을 0~40초로 해두면 40초 이후의 공격은 반영되지 않습니다.

- 이제 키보드의 F5 버튼을 눌러보세요. 총 딜량을 확인하실 수 있을 것입니다.

## 실제 예시

- 사실 이 프로그램은 제작자의 하드 루시드 3페 격파를 위해 만들어졌습니다. (프로그램에 기본적으로 입력되어 있는 수치는 제작자의 스펙과 같습니다.)
- 위의 사용법대로 첫 번째 페이지를 입력하면 다음과 같습니다.
    ![image](https://user-images.githubusercontent.com/89760255/159033529-be67e33f-b00f-48cf-bd8f-44232200930b.png)

- 두 번째 페이지에서 40초 딜량을 입력해봅시다.
- 실제와 조금의 차이가 있겠지만, 대충 다음과 같이 딜을 넣을 수 있을 것입니다.
    - 실제로는 스킬 사용에 딜레이가 있으므로 각 스킬의 시작 위치를 약 1초정도 차이나게 세밀한 조정이 필요합니다. 물론 대충 어느정도 맞추어 놓고 계산한 딜량보다 실전에서 덜 넣는다고 생각해도 됩니다.
- `F5` 버튼을 누르면 다음과 같이 총 딜량과 각 스킬의 딜 비중이 출력됩니다.
    - 게일, 윔이 가장 많고 천노, 볼텍스, 스톰, 아이들, 윈드 월 등이 뒤를 따르는 모습을 볼 수 있습니다. 물론 실제 루시드에선 게일의 비중이 좀 더 작아질 것입니다.
- 해당 타임라인대로 딜을 넣었을 때 약 12조 800억이 계산되며, 컷에 상당히 빡빡한 것을 알 수 있습니다.

![image](https://user-images.githubusercontent.com/89760255/159033559-373a39a9-f958-43aa-96ed-4d1cf6f01c32.png)

- 만약 4렙 웨폰퍼프링 대신 4렙 리스크테이커링을 쓰는 것을 어떨까요? 생각보다 큰 차이는 나지 않습니다.

![image](https://user-images.githubusercontent.com/89760255/159033630-2bb2cdb4-56b0-4361-acc5-69bbc7b7b66e.png)

- 윈브는 치격이 좋다고 하니 치격을 써봅시다. 12.08조 → 12.79조로 상당히 많이 증가했습니다.

![image](https://user-images.githubusercontent.com/89760255/159033690-86d595aa-6d2c-419c-b466-f3c137ed4ab5.png)

- 그건 그렇고, 만약 여기서 해방을 한다면 어떻게 될까요? 이정도면 전보다 굉장히 널널할 것 같지 않나요?

![image](https://user-images.githubusercontent.com/89760255/159033748-a77bd60a-2d5d-4578-874c-5daddde3ce26.png)

- 근데 4렙 웨폰퍼프링말고 조금 거금 들여서 4렙 리레링을 사면 어떨까요? 12.79조 → 13.29조로 꽤 딜량이 상승했습니다.

![image](https://user-images.githubusercontent.com/89760255/159033775-89aa9dc6-6291-41c5-a041-7960676baa71.png)

- 당장 사용법을 쓰느라 타임라인을 대충 구성하였지만, 좀 더 실제와 같은 딜량을 계산하고 싶다면 각 스킬들의 시작 위치에 대해 세밀한 조정이 필요할 것입니다.

### 향후 업데이트 방향

- [ ]  저장 기능 추가
- [ ]  스킬 딜레이 적극 고려한 타임라인 수정
- [ ]  `크레스트 오브 더 솔라` 스킬 추가
- [ ]  하울링 게일 등의 타수 수정 기능
