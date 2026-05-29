# Minecraft-TPA-Datapack

[Minecraft Website](https://www.minecraft.net/) [License](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/edit/main/LICENSE)

선택적 의존성: [Carpet mod](https://modrinth.com/mod/carpet), [Bookshelf Datapack](https://github.com/mcbookshelf/bookshelf)

[English(United States)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README.md) · [简体中文(中国大陆)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhcn.md) · [正體中文(臺灣)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_zhtw.md) · [日本語(日本)](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/README_jp.md) · [More Languages](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/blob/main/languages.md)

TPA 데이터팩은 Minecraft용 데이터팩으로, OP 권한이 없는 플레이어도 서로 쉽게 텔레포트할 수 있도록 해 주며, Back, Home, Warp, 다국어 지원 등 다양한 추가 기능을 제공합니다.

더 많은 정보 확인이나 의견 제안을 위해 저희 소셜 미디어를 팔로우하거나 참여해 주세요!

[Discord](https://discord.gg/QgkpxsFahw) · [YouTube](https://www.youtube.com/channel/UCMOgi9XLPgVjLJRV6-YqQmg) · [Bilibili](https://www.bilibili.com/space/433412367) · [Bilibili](https://space.bilibili.com/433412367) · QQ 그룹:814709389

## 장점

- 모든 옵션은 `/function tpa:options` 명령어를 통해 편집할 수 있습니다. 잘못된 기본 설정으로 인한 불편을 걱정할 필요가 없습니다.

- 설치 방식이 매우 간단합니다: 데이터팩 방식. 데이터팩은 Minecraft에 가장 쉽게 설치할 수 있는 콘텐츠 유형으로, 별도의 확장 모드나 로더가 필요하지 않습니다.

- 다른 데이터팩/모드/플러그인/리소스팩과의 호환성을 적극적으로 보장합니다. 따라서 TPA 데이터팩이 원인이 아닐 가능성이 있는 오류라도, 전체 상황과 재현 방법을 알려주시면 함께 확인하겠습니다.

- 두 가지 버전을 제공합니다: **완전판(Extra)** 버전과 **경량판(Light)** 버전. 완전판은 저희가 개발한 모든 기능을 포함하며, 경량판은 기본 기능만 포함하여 다양한 요구를 충족합니다.

## 작동 원리

Minecraft 1.13 이후부터 바닐라 인터페이스를 통해 작동합니다.

## 다운로드 버전 선택 방법

아래 표를 참고하여 사용 중인 Minecraft 버전에 맞는 데이터팩 파일 접미사를 확인하세요: **Minecraft 버전과 데이터팩 파일명 접미사 대응표**

게임 버전 | 완전판 | 경량판

| 遊戲版本 | 完整版 | 輕量版 |
| :-- | --: | --: |
| 1.13 - 1.14.4 | +mc1.13 | light+mc1.13 |
| 1.15 - 1.20.1 | +mc1.15 | light+mc1.13 |
| 1.20.2 - 1.20.6 | +mc1.20.2 | light+mc1.13 |
| 1.21 - 1.21.4 | +mc1.20.2 | light+mc1.21 |
| 1.21.5 - | +mc1.20.2 | light+mc1.21.5 |

경량판 최신 버전: v2.0.6 완전판 최신 버전: v2.0.6

1. 현재 게임 버전을 확인합니다.

2. 완전판과 경량판 중 사용할 버전을 결정합니다. 차이점은 다음과 같습니다:

   - 경량판: 기본 기능(텔레포트 및 메뉴)만 포함  
   - 완전판: Back, Home, Warp, 다국어 지원 등 모든 기능 포함 (향후 추가 예정)

3. *Releases* 페이지에서 다운로드합니다.

예시: Minecraft 1.20.1 버전을 사용하며 완전판을 원할 경우, `TPA_datapack-v2.0.6+mc1.15.zip` 파일을 선택합니다.

## 설치 방법

기본적으로 다른 데이터팩과 설치 방식이 동일합니다. 이미 알고 계신 경우 이 단락을 건너뛰어도 됩니다.

### 클라우드 서버에서

1. 호스팅 서버 콘솔을 엽니다.  
2. *File Manager* 버튼을 찾습니다.  
3. 이후 과정은 로컬 서버 설치와 동일합니다.

### 로컬 서버에서

1. 서버 JAR 파일이 있는 폴더를 찾습니다.  
2. `world` 폴더가 있다면 `./world/datapacks/` 경로를 엽니다.  
3. 없거나 4단계 후 적용되지 않으면 `server.properties -> level-name`을 확인합니다.  
4. 데이터팩 파일을 `datapacks` 폴더에 넣습니다.  
5. 서버 접속 후 `/reload`, `/datapack list`로 인식 여부를 확인합니다.

### 싱글플레이 세계에서

1. 세계에서 나옵니다.  
2. 세계 선택 화면에서 대상 세계를 선택합니다.  
3. 좌측 하단의 `편집` 버튼을 클릭합니다.  
4. `세계 폴더 열기`를 클릭합니다.  
5. 회색 제목을 기억합니다.  
6. 메인 메뉴 → `옵션 → 리소스팩 → 폴더 열기`  
7. 상위 폴더 `.minecraft` → `saves` → 해당 세계 → `datapacks`  
8. 데이터팩 파일을 넣습니다.  
9. `/datapack list`로 확인합니다.

### 새 세계 생성 시

1. `More → Data Packs → Open Pack Folder`  
2. 데이터팩 파일을 넣습니다.  
3. 세계를 생성합니다.  
4. `/datapack list`로 확인합니다.

## 사용 방법

자세한 사용법은 Wiki를 참고하세요: [wiki](https://github.com/Xiao-tu233/Minecraft-TPA-Datapack/wiki)

## 마무리

TPA 데이터팩을 사용해 주셔서 감사합니다!  
최신 버전: 완전판 v2.0.6, 경량판 v2.0.6  
마지막 수정일: 2026년 1월 16일  
번역: ChatGPT · Requested by Xiao_tu233