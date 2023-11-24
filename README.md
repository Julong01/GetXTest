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

api => retrofit, dio, json_serializer