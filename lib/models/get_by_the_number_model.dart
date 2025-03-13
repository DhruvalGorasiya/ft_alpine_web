class GetByTheNumberModel {
  List<Data>? data;

  GetByTheNumberModel({this.data});

  GetByTheNumberModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? completeProjectArea;
  String? experience;
  String? ongoingProjectArea;

  Data(
      {this.id,
        this.completeProjectArea,
        this.experience,
        this.ongoingProjectArea});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    completeProjectArea = json['complete_project_area'];
    experience = json['experience'];
    ongoingProjectArea = json['ongoing_project_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['complete_project_area'] = this.completeProjectArea;
    data['experience'] = this.experience;
    data['ongoing_project_area'] = this.ongoingProjectArea;
    return data;
  }
}
