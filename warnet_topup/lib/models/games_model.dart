import 'package:warnet_topup/models/categories_model.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/models/servers_model.dart';

class GamesModel {
  int? id;
  String? name;
  int? category_id;
  String? category_name;
  String? image;
  String? player_id;
  String? zone_id;
  String? servers;
  // List<NominalModel>? nominal;
  // List<ServersModel>? servers;

  GamesModel({
    this.id,
    this.name,
    this.category_id,
    this.category_name,
    this.image,
    this.player_id,
    this.zone_id,
    this.servers,
    // this.nominal,
    // this.servers,
  });

  GamesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category_id = json['category_id'];
    category_name = json['category_name'];
    image = json['image'];
    player_id = json['player_id'];
    zone_id = json['zone_id'];
    servers = json['servers'];
    // nominal = json['nominal']
    //     .map<NominalModel>((nominal) => NominalModel.fromJson(nominal))
    //     .toList();
    // servers =
    //     json['servers'].map<ServersModel>((server) => ServersModel.fromJson(server)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': category_id,
      'category_name': category_name,
      'image': image,
      'player_id': player_id,
      'zone_id': zone_id,
      'servers': servers,
      // 'nominal': nominal!.map((nominal) => nominal.toJson()).toList(),
      // 'servers': servers!.map((server) => server.toJson()).toList(),
    };
  }
}
