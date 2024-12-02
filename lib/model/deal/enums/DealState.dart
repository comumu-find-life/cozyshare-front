enum DealState {
  NONE("없음"),
  REQUEST_DEAL("Request Deal"), // 1
  ACCEPT_DEAL("Accept Deal"), // 2
  CANCEL_BEFORE_DEAL("Deposit Completed"), // 3
  CANCEL_DURING_DEAL("Request for Transaction Completion"), // 5
  COMPLETE_DEAL("Transaction Completed");


  final String description;

  const DealState(this.description);

  bool isInProgressState() {
    return this == DealState.REQUEST_DEAL ||
        this == DealState.ACCEPT_DEAL;
  }

  bool isDoneState() {
    return this == DealState.COMPLETE_DEAL;
  }

  bool isCancel() {
    return this == DealState.CANCEL_BEFORE_DEAL || this == DealState.CANCEL_DURING_DEAL;
  }

  int getStep() {
    switch (this) {
    //입금 전
      case DealState.REQUEST_DEAL:
        return 1;
    // 입금 신청
      case DealState.ACCEPT_DEAL:
        return 2;
    // 입금 완료
      case DealState.CANCEL_BEFORE_DEAL:
        return 3;
    //거래 완료 신청
      case DealState.CANCEL_DURING_DEAL:
        return 4;
    // 입금 완료
      default:
        return 5;
    }
  }



}

