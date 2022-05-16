class users_model {
  int? _mangerId;
  String? _userName;
  String? _email;
  int? _deptId;
  String? _telephone;
  String? _entryTelephone;
  String? _employeeNumber;
  int? _userId;
  int? _roleId;

  users_model(
      {int? mangerId,
        String? userName,
        String? email,
        int? deptId,
        String? telephone,
        String? entryTelephone,
        String? employeeNumber,
        int? userId,
        int? roleId}) {
    if (mangerId != null) {
      this._mangerId = mangerId;
    }
    if (userName != null) {
      this._userName = userName;
    }
    if (email != null) {
      this._email = email;
    }
    if (deptId != null) {
      this._deptId = deptId;
    }
    if (telephone != null) {
      this._telephone = telephone;
    }
    if (entryTelephone != null) {
      this._entryTelephone = entryTelephone;
    }
    if (employeeNumber != null) {
      this._employeeNumber = employeeNumber;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (roleId != null) {
      this._roleId = roleId;
    }
  }

  int? get mangerId => _mangerId;
  set mangerId(int? mangerId) => _mangerId = mangerId;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  String? get email => _email;
  set email(String? email) => _email = email;
  int? get deptId => _deptId;
  set deptId(int? deptId) => _deptId = deptId;
  String? get telephone => _telephone;
  set telephone(String? telephone) => _telephone = telephone;
  String? get entryTelephone => _entryTelephone;
  set entryTelephone(String? entryTelephone) =>
      _entryTelephone = entryTelephone;
  String? get employeeNumber => _employeeNumber;
  set employeeNumber(String? employeeNumber) =>
      _employeeNumber = employeeNumber;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get roleId => _roleId;
  set roleId(int? roleId) => _roleId = roleId;

  users_model.fromJson(Map<String, dynamic> json) {
    _mangerId = json['MangerId'];
    _userName = json['UserName'];
    _email = json['Email'];
    _deptId = json['DeptId'];
    _telephone = json['Telephone'];
    _entryTelephone = json['EntryTelephone'];
    _employeeNumber = json['EmployeeNumber'];
    _userId = json['UserId'];
    _roleId = json['RoleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MangerId'] = this._mangerId;
    data['UserName'] = this._userName;
    data['Email'] = this._email;
    data['DeptId'] = this._deptId;
    data['Telephone'] = this._telephone;
    data['EntryTelephone'] = this._entryTelephone;
    data['EmployeeNumber'] = this._employeeNumber;
    data['UserId'] = this._userId;
    data['RoleId'] = this._roleId;
    return data;
  }
}
