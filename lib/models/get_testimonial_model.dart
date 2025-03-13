class GetTestimonialModel {
  List<Data>? data;

  GetTestimonialModel({this.data});

  GetTestimonialModel.fromJson(Map<String, dynamic> json) {
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
  String? clientName;
  String? clientDesignation;
  String? feedback;

  Data({this.id, this.clientName, this.clientDesignation, this.feedback});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientName = json['client_name'];
    clientDesignation = json['client_designation'];
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_name'] = this.clientName;
    data['client_designation'] = this.clientDesignation;
    data['feedback'] = this.feedback;
    return data;
  }
}
