import 'package:get/get.dart';
import 'package:shop_app/models/User.dart';

class UserController extends GetxController {
  Rxn<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}