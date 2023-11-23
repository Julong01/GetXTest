# lostarkautionviewer

getx test App

## Getting Started
repo : velog.io/@broccolism/GetX-Pattern-을-적용한-플러터-폴더-구조
lib
  - binding     각 스크린별 필요한 의존성 주입
  - controller  상태관리
  - data
    - model       데이터 타입 정의
    - provider    서버 api, 로컬 DB api 등 호출
    - repository  응답으로 받은 데이터 가공
   - src         상수값 정의
  - util        편의성 함수 정의
  - view        화면에 보이는 UI 모음
    - common        공통 컴포넌트 위젯 모음
    - screen_folder 각 기능별 스크린, 스크린에 사용될 위젯
    - home_screen   main screen
    - widgets.dart  공용 위젯 깔끔하게 import 하기위한 파일
    - screens.dart  다른 파일에서 깔끔하게 import 하기위한 파일. repository, binding, controller, model에서도 하나씩 구현
  - main.dart
  - router.dart 각 스크린별 라우팅 정의
  - test_screen.dart 새 컴포넌트 새발 시 테스트 스크린

서버 -> view 데이터 흐름
  provider -> repository -> controller -> view

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

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
