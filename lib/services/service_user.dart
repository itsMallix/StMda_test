import 'dart:convert';
import 'package:suitmedia_test/models/model_user.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  static const String baeUrl = 'https://reqres.in/api';
  static Future<List<UserModel>> fetchUsers({int page = 1}) async {
    try {
      final responseData =
          await http.get(Uri.parse('$baeUrl/users?page=$page'));
      final bodyData = responseData.body;
      final resultData = jsonDecode(bodyData);
      List<UserModel> users = List<UserModel>.from(
        resultData['data'].map(
          (user) => UserModel.fromJson(user),
        ),
      );
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
