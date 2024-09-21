enum DealState {
  NONE("없음"),
  BEFORE_DEPOSIT("Before Deposit"), // 1
  REQUEST_DEPOSIT("Deposit Request"), // 2
  COMPLETE_DEPOSIT("Deposit Completed"), // 3
  CANCEL_DEPOSIT("Deposit Cancellation"), // 4
  REQUEST_COMPLETE_DEAL("Request for Transaction Completion"), // 5
  COMPLETE_DEAL("Transaction Completed"), // 6
  CANCEL_DEAL("Transaction Cancelled"); // 7

  final String description;

  const DealState(this.description);

  bool isInProgressState() {
    return this == DealState.BEFORE_DEPOSIT ||
        this == DealState.REQUEST_DEPOSIT ||
        this == DealState.COMPLETE_DEPOSIT ||
        this == DealState.REQUEST_COMPLETE_DEAL;
  }



}

