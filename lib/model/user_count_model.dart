class User_count_model {
  String? _userName;
  int? _count;

  User_count_model({String? userName, int? count}) {
    if (userName != null) {
      this._userName = userName;
    }
    if (count != null) {
      this._count = count;
    }
  }

  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  int? get count => _count;
  set count(int? count) => _count = count;

  User_count_model.fromJson(Map<String, dynamic> json) {
    _userName = json['user_name'];
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this._userName;
    data['count'] = this._count;
    return data;
  }
}
