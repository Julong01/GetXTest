23.11.21)
- apikey .env에 추가
- open api 통신 test
- home_screen 공지사항 controller, view, repository  테스트 스크린 o

23.11.22)
- splash_screen
  - 진입시 캐릭터명 입력란 추가
  - 캐릭터 요약 정보 가져온 후 arguments로 넘겨주기
- home_screen
  - 공지사항 테이블 크기 조정
  - 진행중인 이벤트 carousel slider 추가
  - 캐릭터 요약 정보 표현 profile_box 추가

23.11.23)
- dio client custom
  - token Interceptor 로 headers에 token 상시 주입.
  - network error시 예외처리
- splash_screen
  - 캐릭터가 없을시 예외처리 dialog 구현.
- home_screen
  - 공지사항, 이벤트 배너 위치 조정.
  - profile_box 수정

23.11.24)
- splash_screen
  - Hive에 최근 사용된 닉네임 저장
- home_screen
  - 캐릭터 그룹, 마켓, 나가기 버튼 추가
  - 나가기시 초기 화면으로