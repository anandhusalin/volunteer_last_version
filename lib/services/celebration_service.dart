// import 'dart:convert';

// import 'package:bloc_volunteer_service/model/celebration_model.dart';
// import 'package:http/http.dart' as http;

// class CelebrationService {
//   List celebration = [];
//   Future<CelebrationModel> getDataCelebration() async {
//     var response = await http.get(
//         Uri.parse('https://volunteer.cyberfort.co.in/api/getCelebrationList'));
//     Map<String, dynamic> map = json.decode(response.body);

//     print("/////////////celebration/////////");

//     print(response.body);

//     print(map);
//     var cele = map['data'];
//     print(cele);
//     print(cele[0]);
//     celebration = cele[0].map((entry) => (entry[''])).toList();

//     print(celebration);

//     var data = jsonDecode(response.body);
//     return CelebrationModel.fromJson(data);
//   }
// }
