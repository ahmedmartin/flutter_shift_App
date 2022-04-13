class Department_model {
  int? _depId;
  String? _depName;
  int? _mangerId;

  Department_model({int? depId, String? depName, int? mangerId}) {
    if (depId != null) {
      this._depId = depId;
    }
    if (depName != null) {
      this._depName = depName;
    }
    if (mangerId != null) {
      this._mangerId = mangerId;
    }
  }

  int? get depId => _depId;
  set depId(int? depId) => _depId = depId;
  String? get depName => _depName;
  set depName(String? depName) => _depName = depName;
  int? get mangerId => _mangerId;
  set mangerId(int? mangerId) => _mangerId = mangerId;

  Department_model.fromJson(Map<String, dynamic> json) {
    _depId = json['depId'];
    _depName = json['depName'];
    _mangerId = json['mangerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depId'] = this._depId;
    data['depName'] = this._depName;
    data['mangerId'] = this._mangerId;
    return data;
  }
}
