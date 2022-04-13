class Shift_type_model {
  int? _shiftTypeId;
  String? _shiftName;

  Shift_type_model({int? shiftTypeId, String? shiftName}) {
    if (shiftTypeId != null) {
      this._shiftTypeId = shiftTypeId;
    }
    if (shiftName != null) {
      this._shiftName = shiftName;
    }
  }

  int? get shiftTypeId => _shiftTypeId;
  set shiftTypeId(int? shiftTypeId) => _shiftTypeId = shiftTypeId;
  String? get shiftName => _shiftName;
  set shiftName(String? shiftName) => _shiftName = shiftName;

  Shift_type_model.fromJson(Map<String, dynamic> json) {
    _shiftTypeId = json['shiftTypeId'];
    _shiftName = json['shiftName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shiftTypeId'] = this._shiftTypeId;
    data['shiftName'] = this._shiftName;
    return data;
  }
}
