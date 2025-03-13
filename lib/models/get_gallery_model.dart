class GetGalleryModel {
  List<Data>? data;

  GetGalleryModel({this.data});

  GetGalleryModel.fromJson(Map<String, dynamic> json) {
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
  String? category;
  List<VerticleImage>? verticleImage;
  List<HorizontalImage>? horizontalImage;

  Data({this.id, this.category, this.verticleImage, this.horizontalImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    if (json['verticle_image'] != null) {
      verticleImage = <VerticleImage>[];
      json['verticle_image'].forEach((v) {
        verticleImage!.add(new VerticleImage.fromJson(v));
      });
    }
    if (json['horizontal_image'] != null) {
      horizontalImage = <HorizontalImage>[];
      json['horizontal_image'].forEach((v) {
        horizontalImage!.add(new HorizontalImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    if (this.verticleImage != null) {
      data['verticle_image'] =
          this.verticleImage!.map((v) => v.toJson()).toList();
    }
    if (this.horizontalImage != null) {
      data['horizontal_image'] =
          this.horizontalImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VerticleImage {
  int? id;
  String? url;

  VerticleImage({this.id, this.url});

  VerticleImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}class HorizontalImage {
  int? id;
  String? url;

  HorizontalImage({this.id, this.url});

  HorizontalImage.fromJson(Map<String, dynamic> json) {
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
