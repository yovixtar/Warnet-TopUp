class NominalModel {
  int? id;
  String? name;
  int? game_id;
  int? price;

  NominalModel({
    this.id,
    this.name,
    this.game_id,
    this.price,
  });

  NominalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    game_id = json['game_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'game_id': game_id,
      'price': price,
    };
  }
}
