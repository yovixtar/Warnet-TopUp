class ServersModel {
  int? id;
  String? name;
  int? game_id;

  ServersModel({
    this.id,
    this.name,
    this.game_id,
  });

  ServersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    game_id = json['game_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'game_id': game_id,
    };
  }
}
