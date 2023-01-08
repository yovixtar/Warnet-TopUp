class ServersModel {
  int? id;
  String? name;

  ServersModel({
    this.id,
    this.name,
  });

  ServersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
