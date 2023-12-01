23.11.21)
- apikey .env에 추가
- open api 통신 test
- home_screen 공지사항 controller, view, repository  테스트 스크린 o
---
23.11.22)
- splash_screen
  - 진입시 캐릭터명 입력란 추가
  - 캐릭터 요약 정보 가져온 후 arguments로 넘겨주기
- home_screen
  - 공지사항 테이블 크기 조정
  - 진행중인 이벤트 carousel slider 추가
  - 캐릭터 요약 정보 표현 profile_box 추가
---
23.11.23)
- dio client custom
  - token Interceptor 로 headers에 token 상시 주입.
  - network error시 예외처리
- splash_screen
  - 캐릭터가 없을시 예외처리 dialog 구현.
- home_screen
  - 공지사항, 이벤트 배너 위치 조정.
  - profile_box 수정
---
23.11.24)
- splash_screen
  - Hive에 최근 사용된 닉네임 저장
- home_screen
  - 캐릭터 그룹, 마켓, 나가기 버튼 추가
  - 나가기시 초기 화면으로
---
23.11.27)
- info_screen
  - 계정 내 캐릭터 정보 출력
  - 각 계정별 디테일 페이지 구현 예정
- home_screen
  - 계정 내 캐릭터 리스트 api 추가
  - profile_box 상태 값 저장
- common
  - custom_appbar 추가
- src/constants
  - 캐릭터 이미지가 null일 경우 대체 이미지 url 반환 함수 구현
---
23.11.29)
- integration
  - auction_screen
    - floating button 추가
    - auction option data fetch
    - category dropdown test
  - integration_screen
    - tab bar view 추가
---
23.11.30)
- integration
  - auction_screen
    - basic option box 추가
    - custom dropdown 구현
    - 아이템 등급, 품질 별 색깔 구현
    - 특정 옵션중 드롭다운 및 스킬옵션 박스 비활성화
---
23.12.01)
- integration
  - auction_screen
    - lv validator 추가
    - 스킬 상세 옵션박스 구현
---