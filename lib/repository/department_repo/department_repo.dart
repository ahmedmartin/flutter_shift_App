



import 'package:shieft/model/department_model.dart';

abstract class Department_repo {

  Future<List<Department_model>> get_departments();

}