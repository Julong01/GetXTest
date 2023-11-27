String pathToClass(String className) {
  String baseUrl =
      "https://cdn-lostark.game.onstove.com/2018/obt/assets/images/pc/information/class/";
  switch (className) {
    case "버서커":
      baseUrl += "img_detail_berserker_s.png";
      break;
    case "디스트로이어":
      baseUrl += "img_detail_destroyer_s.png";
      break;
    case "워로드":
      baseUrl += "img_detail_warload_s.png";
      break;
    case "홀리나이트":
      baseUrl += "img_detail_holyknight_s.png";
      break;
    case "슬레이어":
      baseUrl += "img_detail_slayer_s.png";
      break;
    case "아르카나":
      baseUrl += "img_detail_arcana_s.png";
      break;
    case "서머너":
      baseUrl += "img_detail_summoner_s.png";
      break;
    case "바드":
      baseUrl += "img_detail_bard_s.png";
      break;
    case "소서리스":
      baseUrl += "img_detail_sorceress_s.png";
      break;
    case "배틀마스터":
      baseUrl += "img_detail_battlemaster_s.png";
      break;
    case "인파이터":
      baseUrl += "img_detail_infighter_s.png";
      break;
    case "기공사":
      baseUrl += "img_detail_soulmaster_s.png";
      break;
    case "창술사":
      baseUrl += "img_detail_lancemaster_s.png";
      break;
    case "스트라이커":
      baseUrl += "img_detail_striker_s.png";
      break;
    case "블레이드":
      baseUrl += "img_detail_blade_s.png";
      break;
    case "데모닉":
      baseUrl += "img_detail_demonic_s.png";
      break;
    case "리퍼":
      baseUrl += "img_detail_reaper_s.png";
      break;
    case "소울이터":
      baseUrl += "img_detail_souleater_s.png";
      break;
    case "호크아이":
      baseUrl += "img_detail_hawkeye_s.png";
      break;
    case "데빌헌터":
      baseUrl += "img_detail_devilhunter_s.png";
      break;
    case "블래스터":
      baseUrl += "img_detail_blaster_s.png";
      break;
    case "스카우터":
      baseUrl += "img_detail_scouter_s.png";
      break;
    case "건슬링어":
      baseUrl += "img_detail_gunslinger_s.png";
      break;
    case "도화가":
      baseUrl += "img_detail_artist_s.png";
      break;
    case "기상술사":
      baseUrl += "img_detail_aeromancer_s.png";
      break;
  }
  return baseUrl;
}
