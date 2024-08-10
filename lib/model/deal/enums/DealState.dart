enum DealState {
  NONE("없음"),
  BEFORE_DEPOSIT("입금 전"), // 1
  REQUEST_DEPOSIT("입금 신청"), // 2
  COMPLETE_DEPOSIT("입금 완료"), // 3
  CANCEL_DEPOSIT("입금 취소"),
  REQUEST_COMPLETE_DEAL("거래 완료 신청"), // 4
  COMPLETE_DEAL("거래 완료"), //5
  CANCEL_DEAL("거래 취소");

  final String description;

  const DealState(this.description);
}
