
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");


  /**
   * 사용자 관련 API URLS
   */
  static String USER_LOGIN_URL = "$ROOT_URL/users/login";
  static String USER_ID_FIND_URL = "$ROOT_URL/users/me/userId";
  static String USER_PROFILE_URL = "$ROOT_URL/users/profile";

  /**
   * 집 게시글 관련 API URLS
   */
  static String ROOMS_ALL_URL = "$ROOT_URL/homes/overview";
  static String ROOM_BY_ID_URL = "$ROOT_URL/homes/";

  /**
   * 안전거래 관련 API URLS
   */
  static String DEAL_START_URL = "$ROOT_URL/deals";
  static String DEAL_READ = "$ROOT_URL/deals/read";
  static String DEAL_REQUEST_DEPOSIT_URL = "$ROOT_URL/deals/request/deposit/";
  static String DEAL_REQUEST_FINISH_URL = "$ROOT_URL/deals/done/";
  static String DEAL_CANCLE_URL = "$ROOT_URL/deals/cancel/";

  /**
   * 채팅 관련 API URLS
   *
   */
  static String DM_INIT_SEND_URL = "$ROOT_URL/dm";
  static String DM_HOMES_URL = "$ROOT_URL/homes/dm";
  static String DM_HISTORY = "http://10.0.2.2:8082/api/dm/history";
  static String DM_ROOMS = "$ROOT_URL/dm/dm-rooms";

}