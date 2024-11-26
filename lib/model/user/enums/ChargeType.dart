
enum ChargeType {
  WITHDRAW("Withdrawal completed."),
  DEPOSIT("Deposit completed"),
  APPLY_WITHDRAW("Withdrawal request"),
  APPLY_DEPOSIT("Deposit request");

  final String command;

  const ChargeType(this.command);

  // Getter for the command field
  String get getCommand => command;
}