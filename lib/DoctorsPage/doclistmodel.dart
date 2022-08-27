class Doclist {
  Doclist({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final List<Data> data;

  Doclist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.about,
    required this.name,
    required this.password,
    required this.email,
    required this.role,
    required this.phone,
    required this.img,
    required this.attribute,
    required this.requests,
    required this.patients,
  });
  late final String about;
  late final String name;
  late final String password;
  late final String email;
  late final String role;
  late final String phone;
  late final String img;
  late final List<String> attribute;
  late final List<String> requests;
  late final List<String> patients;

  Data.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    img = json['img'];
    attribute = List.castFrom<dynamic, String>(json['attribute']);
    requests = List.castFrom<dynamic, String>(json['requests']);
    patients = List.castFrom<dynamic, String>(json['patients']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['about'] = about;
    _data['name'] = name;
    _data['password'] = password;
    _data['email'] = email;
    _data['role'] = role;
    _data['phone'] = phone;
    _data['img'] = img;
    _data['attribute'] = attribute;
    _data['requests'] = requests;
    _data['patients'] = patients;
    return _data;
  }
}
