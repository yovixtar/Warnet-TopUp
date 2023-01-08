class NominalModel {
  int? id;
  int? amount;
  String? name;

  NominalModel({
    this.id,
    this.amount,
    this.name,
  });

  NominalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'name': name,
    };
  }
}
