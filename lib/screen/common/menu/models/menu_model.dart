class MenuModel {
  String accountNumber;
  double amount;
  String type;

  MenuModel({
    required this.accountNumber,
    required this.amount,
    required this.type,
  });
  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      accountNumber: json['accountNumber'],
      amount: json['amount'],
      type: json['type'],
    );
  }

// To Json
  Map<String, dynamic> toJson() => {
        'accountNumber': accountNumber,
        'amount': amount,
        'type': type,
      };
}
