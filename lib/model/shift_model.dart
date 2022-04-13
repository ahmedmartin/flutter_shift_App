class Shift_model {
  int? _shiftId;
  String? _date;
  int? _userId;
  String? _userName;
  int? _adminId;
  String? _adminName;
  String? _shiftName;
  String? _depName;

  Shift_model(
      {int? shiftId,
        String? date,
        int? userId,
        String? userName,
        int? adminId,
        String? adminName,
        String? shiftName,
        String? depName}) {
    if (shiftId != null) {
      this._shiftId = shiftId;
    }
    if (date != null) {
      this._date = date;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (userName != null) {
      this._userName = userName;
    }
    if (adminId != null) {
      this._adminId = adminId;
    }
    if (adminName != null) {
      this._adminName = adminName;
    }
    if (shiftName != null) {
      this._shiftName = shiftName;
    }
    if (depName != null) {
      this._depName = depName;
    }
  }

  int? get shiftId => _shiftId;
  set shiftId(int? shiftId) => _shiftId = shiftId;
  String? get date => _date;
  set date(String? date) => _date = date;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  int? get adminId => _adminId;
  set adminId(int? adminId) => _adminId = adminId;
  String? get adminName => _adminName;
  set adminName(String? adminName) => _adminName = adminName;
  String? get shiftName => _shiftName;
  set shiftName(String? shiftName) => _shiftName = shiftName;
  String? get depName => _depName;
  set depName(String? depName) => _depName = depName;

  Shift_model.fromJson(Map<String, dynamic> json) {
    _shiftId = json['shiftId'];
    _date = json['date'];
    _userId = json['userId'];
    _userName = json['userName'];
    _adminId = json['adminId'];
    _adminName = json['adminName'];
    _shiftName = json['shiftName'];
    _depName = json['depName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shiftId'] = this._shiftId;
    data['date'] = this._date;
    data['userId'] = this._userId;
    data['userName'] = this._userName;
    data['adminId'] = this._adminId;
    data['adminName'] = this._adminName;
    data['shiftName'] = this._shiftName;
    data['depName'] = this._depName;
    return data;
  }
}
