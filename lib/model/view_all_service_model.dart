// class ViewAllModel {
// 	int? status;
// 	int? code;
// 	String? message;
// 	List<List>? data;
// 	Misc? misc;

// 	ViewAllModel({this.status, this.code, this.message, this.data, this.misc});

// 	ViewAllModel.fromJson(Map<String, dynamic> json) {
// 		status = json['status'];
// 		code = json['code'];
// 		message = json['message'];
// 		if (json['data'] != null) {
// 			data = <List>[];
// 			json['data'].forEach((v) { data!.add(new List.fromJson(v)); });
// 		}
// 		misc = json['misc'] != null ? new Misc.fromJson(json['misc']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['status'] = this.status;
// 		data['code'] = this.code;
// 		data['message'] = this.message;
// 		if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
// 		if (this.misc != null) {
//       data['misc'] = this.misc!.toJson();
//     }
// 		return data;
// 	}
// }

// class Data {


// 	Data({

//   });

// 	Data.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

// class Misc {
// 	String? imagePlaceholder;

// 	Misc({this.imagePlaceholder});

// 	Misc.fromJson(Map<String, dynamic> json) {
// 		imagePlaceholder = json['image_placeholder'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['image_placeholder'] = this.imagePlaceholder;
// 		return data;
// 	}
// }
