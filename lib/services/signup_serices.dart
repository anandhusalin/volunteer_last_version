import 'dart:convert';
import 'package:bloc_volunteer_service/model/sign_up_model.dart';
import 'package:bloc_volunteer_service/model/signup_response.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  Future<SignupResponse> signup(SignupRequest signupModel) async {
    final response = await http.post(
      Uri.parse('https://volunteer.cyberfort.co.in/api/register'),
      body: jsonEncode(
        signupModel.toJson(),
      ),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
    );
    var data = jsonDecode(response.body);
    print(response.body);

    if (response.statusCode == 200 && data['status'] == null) {
      return SignupResponse.fromJson(data);
    }

    else {
      return SignupResponse.fromJson(
          {'data': null, 'message': data['message'], 'status': 'status'});
    }
  }
}
