import 'dart:convert';
import 'dart:developer';

import 'package:bloc_volunteer_service/model/celebration/celebrationDetailModel.dart';
import 'package:bloc_volunteer_service/model/celebration/celebrationSliderModel.dart';
import 'package:bloc_volunteer_service/model/profile/profileModel.dart';
import 'package:bloc_volunteer_service/model/serviceInformation/serviceInformationModel.dart';
import 'package:bloc_volunteer_service/model/service_response.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _url = 'https://volunteer.cyberfort.co.in/api';
  final box = GetStorage();

  gatData(api) async {
    String token = await box.read('Token');

    if (token != '') {
      token = 'Bearer ${token}';
    }

    var _fullUrl = _url + api;
    return await http.get(
      Uri.parse(_fullUrl),
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },
    );
  }

//
  postData(data, api, isEncode) async {
    String token = await box.read('Token');
    String cType = isEncode
        ? 'application/json; charset=UTF-8'
        : 'application/x-www-form-urlencoded; charset=UTF-8';
    var _fullUrl = _url + api;
    return await http.post(
      Uri.parse(_fullUrl),
      body: data,
      headers: {
        'Content-Type': cType,
        "Cache-Control": "no-cache",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
  }

  Future<ProfileModel> getProfile() async {
    int user_id = await box.read('user_id');
    var profileModel;
    try {
      var response = await gatData('/getProfileData/$user_id');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        profileModel = ProfileModel.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
      return profileModel;
    }
    return profileModel;
  }

  Future<bool> uploadProfileImage(imagePath) async {
    var dio = Dio();
    final box = GetStorage();
    String token = await box.read('Token');
    int user_id = await box.read('user_id');

    FormData formData = FormData.fromMap({
      "id": user_id,
      "image": imagePath,
    });
    var response = await dio.post(
      '$_url/update-profile-image',
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
      ),
    );
    print(response.data['status']);
    // var data = jsonDecode(response.data);
    if (response.statusCode == 200 && response.data['status'] == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(name, phone, dob) async {
    int user_id = await box.read('user_id');
    var data = {
      'name': name,
      'phone': phone,
      'dob': dob.toString(),
      'id': user_id.toString()
    };

    var response = await postData(data, '/update-profile-basic', false);
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body['status'] == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<Object> changePassword(old_password, new_password) async {
    int user_id = await box.read('user_id');
    var data = {
      'old_password': old_password,
      'new_password': new_password,
      'id': user_id.toString()
    };

    var response = await postData(data, '/changePassword', false);
    // inspect(response);
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body['status'] == 1) {
      return 'Success';
    } else {
      return body['message'];
    }
  }

  Future<CelebrationSliderModel> getCelebrationList() async {
    int user_id = await box.read('user_id');
    var celebrationSliderModel;
    try {
      var response = await gatData('/getCelebrationList');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        celebrationSliderModel = CelebrationSliderModel.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
      return celebrationSliderModel;
    }
    return celebrationSliderModel;
  }

  Future<CelebrationDetailModel> getCelebrationDetails(
      service_id, user_id) async {
    var data = {
      'service_id': service_id.toString(),
      'user_id': user_id.toString(),
    };
    var celebrationDetailModel;
    try {
      var response = await postData(data, '/getCelebrationInfo', false);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        celebrationDetailModel = CelebrationDetailModel.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
      return celebrationDetailModel;
    }
    return celebrationDetailModel;
  }

//by anandhu

  Future<Object> getRequestToVolunteer(id) async {
    // var profileModel;
    String status;
    try {
      var response = await gatData('/isServiceVolunteer/$id');
      inspect(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        status = response.body;
        var jsonMap = json.decode(jsonString);

        return status;
      }
    } catch (e) {
      print(e);
      return true;
    }
    return false;
  }

  Future<bool> joinService(id) async {
    var data = {
      'service_id': id.toString(),
    };

    var response = await postData(data, '/join-service', false);
    var body = json.decode(response.body);
    print("response");
    print(response);

    if (response.statusCode == 200 && body['status'] == 1) {
      return true;
    } else {
      return false;
    }
  }
//end

//add service task
  Future<bool> addServiceTask(data) async {
    bool res = false;
    try {
      var response = await postData(jsonEncode(data), '/service/addTask', true);

      var body = json.decode(response.body);
      if (response.statusCode == 200 && body['status'] == 1) {
        res = true;
      } else {
        res = false;
      }
    } catch (e) {
      print(e);
    }
    return res;
  }
}
