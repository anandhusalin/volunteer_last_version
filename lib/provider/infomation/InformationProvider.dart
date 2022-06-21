import 'dart:convert';
import 'dart:developer';

import 'package:bloc_volunteer_service/model/serviceInformation/serviceInformationModel.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class InformationProvider with ChangeNotifier {
  final box = GetStorage();
  ServiceInformationModel? _serviceInfoList;
  ServiceInformationModel? get infoList => _serviceInfoList;

  int loadRound = 1;

  bool _loading = false;
  bool _isAssignL = false;
  bool get loading => _loading;
  bool get assignLoad => _isAssignL;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setAssignLoad(bool value) {
    _isAssignL = value;
    notifyListeners();
  }

  Future<ServiceInformationModel?> getInfo(serviceId) async {
    if (loadRound == 1) setLoading(true);
    var response =
        await ApiService().gatData('/getServiceInformation/$serviceId');
    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      _serviceInfoList = ServiceInformationModel.fromJson(jsonMap);
      setLoading(false);
    }
    loadRound++;
    return _serviceInfoList;
  }

  Future<bool> assignTaskUser(task_id) async {
    int user_id = await box.read('user_id');
    var data = {
      'assignee_id': user_id.toString(),
      'task_id': task_id.toString(),
      'comments': 'Task assigned'
    };
    setAssignLoad(true);
    var response =
        await ApiService().postData(data, '/assign-user-task', false);
    var body = json.decode(response.body);

    if (response.statusCode == 200 && body['status'] == 1) {
      setAssignLoad(false);
      return true;
    } else {
      setAssignLoad(false);
      return false;
    }
  }

  //remove
  Future<bool> removeTaskUser(task_id) async {
    setAssignLoad(true);
    var response = await ApiService().gatData('/exit-user-task/$task_id');
    var body = json.decode(response.body);

    if (response.statusCode == 200 && body['status'] == 1) {
      setAssignLoad(false);
      return true;
    } else {
      setAssignLoad(false);
      return false;
    }
  }
}
