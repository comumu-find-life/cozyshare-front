
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String ROOT_URL = dotenv.get("ROOT_API_URL");

  static String GOOGLE_AUTH_LOGIN  = "$ROOT_URL/google";
  static String APPLE_AUTH_LOGIN  = "$ROOT_URL/apple";
  /**
   * 회원가입 관련 API URLS
   */
  static String SEND_EMAIL_URL = "$ROOT_URL/users/verification/email/send/";
  static String CEHCK_EMAIL_CODE_URL = "$ROOT_URL/users/verification/email/confirm/";
  static String CHECK_DUPLICATE_EMAIL_URL = "$ROOT_URL/users/verification/email/";
  /**
   * 사용자 관련 API URLS
   */
  static String USER_SIGN_UP_URL = "$ROOT_URL/users/sign-up";
  static String USER_SIGN_UP_GOOGLE_URL = "$ROOT_URL/users/sign-up/google";
  static String USER_LOGIN_URL = "$ROOT_URL/users/login";
  static String USER_ID_FIND_URL = "$ROOT_URL/users/me/userId";
  static String USER_PROFILE_URL = "$ROOT_URL/users/profile";
  static String USER_ACCOUNT_URL = "$ROOT_URL/users/{userId}/account";

  static String APPLY_WITH_DRAW_URL = "$ROOT_URL/points/apply/with-draw?price=";
  static String CHARGE_POINT_BY_PAYPAL = "$ROOT_URL/points/paypal/payment-success";

  static String USER_ACCOUNT_VALIDATE_URL = "$ROOT_URL/users/{userId}/account/exist";
  static String USER_PROFILE_EDIT_URL = "$ROOT_URL/users";
  static String USER_PROFILE_IMAGE_EDIT_URL = "$ROOT_URL/users/{userId}/image";

  /**
   * 집 게시글 관련 API URLS
   */
  static String ROOM_SAVE_URL = "$ROOT_URL/homes";
  static String ROOM_IMAGE_ADD_URL = "$ROOT_URL/homes/{homeId}/image";
  static String ROOM_IMAGE_DELETE_URL = "$ROOT_URL/homes/{homeId}/image";
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
  static String DEAL_READ = "$ROOT_URL/deals/read";

  static String DEAL_PROVIDER_READ_BY_ID = "$ROOT_URL/read/getter/";
  static String DEAL_GETTER_READ_BY_ID = "$ROOT_URL/read/getter/";

  static String DEAL_REQUEST_DEPOSIT_URL = "$ROOT_URL/deals/accept/";
  static String DEALS_CANCEL_BEFORE_URL = "$ROOT_URL/deals/{dealId}/cancel/before";
  static String DEALS_CANCEL_AFTER_URL = "$ROOT_URL/deals/{dealId}/cancel/after";
  static String DEAL_COMPLETE_URL = "$ROOT_URL/deals/{dealId}/complete";
  static String DEAL_CANCLE_URL = "$ROOT_URL/deals/cancel/";

  /**
   * 채팅 관련 API URLS
   */
  static String DM_SEND_FIRST_URL = "http://localhost:8082/v1/api/direct-messages";
  static String DM_HISTORY_URL = "http://localhost:8082/v1/api/direct-messages/history";
  static String DM_FIND_ALL_ROOMS = "http://localhost:8082/v1/api/users/{userId}/direct-message-rooms";


}