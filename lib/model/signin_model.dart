class Signin_model {
  String? _userName;
  String? _email;
  int? _deptId;
  String? _telephone;
  String? _entryTelephone;
  String? _employeeNumber;
  int? _userId;
  String? _role;
  String? _department;
  String? _token;

  Signin_model(
      {String? userName,
        String? email,
        int? deptId,
        String? telephone,
        String? entryTelephone,
        String? employeeNumber,
        int? userId,
        String? role,
        String? department,
        String? token}) {
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
    if (role != null) {
      this._role = role;
    }
    if (department != null) {
      this._department = department;
    }
    if (token != null) {
      this._token = token;
    }
  }

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
  String? get role => _role;
  set role(String? role) => _role = role;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get token => _token;
  set token(String? token) => _token = token;

  Signin_model.fromJson(Map<String, dynamic> json) {
    _userName = json['UserName'];
    _email = json['Email'];
    _deptId = json['DeptId'];
    _telephone = json['Telephone'];
    _entryTelephone = json['EntryTelephone'];
    _employeeNumber = json['EmployeeNumber'];
    _userId = json['UserId'];
    _role = json['Role'];
    _department = json['Department'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this._userName;
    data['Email'] = this._email;
    data['DeptId'] = this._deptId;
    data['Telephone'] = this._telephone;
    data['EntryTelephone'] = this._entryTelephone;
    data['EmployeeNumber'] = this._employeeNumber;
    data['UserId'] = this._userId;
    data['Role'] = this._role;
    data['Department'] = this._department;
    data['token'] = this._token;
    return data;
  }
}
