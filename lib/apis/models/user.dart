class User {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;
  bool? active;

  User({this.createdAt, this.name, this.avatar, this.id, this.active});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['id'] = id;
    data['active'] = active;
    return data;
  }
}
