class GetStudioImageModel {
  Data? data;

  GetStudioImageModel({this.data});

  GetStudioImageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<StudioImages>? studioImages;

  Data({this.studioImages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['studio_images'] != null) {
      studioImages = <StudioImages>[];
      json['studio_images'].forEach((v) {
        studioImages!.add(new StudioImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studioImages != null) {
      data['studio_images'] =
          this.studioImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudioImages {
  int? id;
  String? url;

  StudioImages({this.id, this.url});

  StudioImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
