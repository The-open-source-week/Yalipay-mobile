import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalipay/src/models/account_model.dart';
import 'package:yalipay/src/models/token_model.dart';

class YPStorage {
  static Future<bool> clear() async {
    var _pref = await SharedPreferences.getInstance();
    var result = await _pref.clear();

    return result;
  }

  static Future<TokenModel> getToken() async {
    var _pref = await SharedPreferences.getInstance();

    var result = TokenModel(token: _pref.getString('token'));

    return result;
  }

  static Future<bool> storeToken(TokenModel tokenModel) async {
    var _pref = await SharedPreferences.getInstance();
    var result = await _pref.setString('token', tokenModel.token!);

    return result;
  }

  static Future<void> storeUserData(AccountModel accountModel) async {
    var _pref = await SharedPreferences.getInstance();
    var result = _pref
      ..setString('username', accountModel.username!)
      ..setString('phoneNumber', accountModel.phoneNumber!)
      ..setInt('code', accountModel.code!)
      ..setInt('accountnumber', accountModel.accountNumber!)
      ..setString('email', accountModel.email!)
      ..setString('id', accountModel.id!);

    print(result);
  }

  static Future<AccountModel> getUserData() async {
    var _pref = await SharedPreferences.getInstance();

    var result = AccountModel(
      id: _pref.getString('id'),
      username: _pref.getString('username'),
      phoneNumber: _pref.getString('phoneNumber'),
      code: _pref.getInt('code'),
      accountNumber: _pref.getInt('accountnumber'),
      email: _pref.getString('email'),
    );

    return result != null ? result : AccountModel(id: "0");
  }
}
