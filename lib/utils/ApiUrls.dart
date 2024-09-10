
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");


  /**
   * 사용자 관련 API URLS
   */
  static String USER_SIGN_UP_URL = "$ROOT_URL/users/sign-up";
  static String USER_LOGIN_URL = "$ROOT_URL/users/login";
  static String USER_ID_FIND_URL = "$ROOT_URL/users/me/userId";
  static String USER_PROFILE_URL = "$ROOT_URL/users/profile";

  /**
   * 집 게시글 관련 API URLS
   */
  static String ROOM_SAVE_URL = "$ROOT_URL/homes";
  static String ROOM_STATE_CHANGE_URL = "$ROOT_URL/homes/";
  static String ROOMS_ALL_URL = "$ROOT_URL/homes/overview";
  static String ROOM_BY_ID_URL = "$ROOT_URL/homes/";
  static String ROOM_ADDRESS_VALIDATE_URL = "$ROOT_URL/homes/address/validate";
  static String ROOM_FAVORITE_URL = "$ROOT_URL/homes/favorite";
  static String ROOM_MY_URL = "$ROOT_URL/homes/users/";

  /**
   * 안전거래 관련 API URLS
   */
  static String DEAL_START_URL = "$ROOT_URL/deals";
  static String DEAL_MY_READ_URL = "$ROOT_URL/deals/users/";
  static String DEAL_PROVIDER_READ = "$ROOT_URL/deals/read/provider";
  static String DEAL_GETTER_READ = "$ROOT_URL/deals/read/getter";
  static String DEAL_REQUEST_DEPOSIT_URL = "$ROOT_URL/deals/request/deposit/";
  static String DEAL_REQUEST_FINISH_URL = "$ROOT_URL/deals/request/done/";
  static String DEAL_CANCLE_URL = "$ROOT_URL/deals/cancel/";

  /**
   * 채팅 관련 API URLS
   *
   */
  static String DM_INIT_SEND_URL = "$ROOT_URL/dm";
  static String DM_HISTORY = "http://10.0.2.2:8082/api/dm/history";
  static String DM_ROOMS = "$ROOT_URL/dm/dm-rooms/users/";

}