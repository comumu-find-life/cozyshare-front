enum DealState {
  NONE,
  // 입금 전
  BEFORE_DEPOSIT,
  // 입금 신청
  DURING_DEPOSIT,
  //입금 완료
  DONE_DEPOSIT,
  //입금 취소
  FAIL_DEPOSIT,
  //거래 완료
  FINISH,
  //거래 취소
  CANCEL,
}