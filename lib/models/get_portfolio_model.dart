class GetPortfolioModel {
  List<Data>? data;

  GetPortfolioModel({this.data});

  GetPortfolioModel.fromJson(Map<String, dynamic> json) {
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
  String? projectName;
  String? location;
  String? area;
  String? url;
  List<VerticleImage>? verticleImage;
  List<HorizontalImage>? horizontalImage;

  Data(
      {this.id,
        this.category,
        this.projectName,
        this.location,
        this.area,
        this.url,
        this.verticleImage,
        this.horizontalImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    projectName = json['project_name'];
    location = json['location'];
    area = json['area'];
    url = json['url'];
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
    data['project_name'] = this.projectName;
    data['location'] = this.location;
    data['area'] = this.area;
    data['url'] = this.url;
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
  String? url;

  VerticleImage({this.url});

  VerticleImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
class HorizontalImage {
  String? url;

  HorizontalImage({this.url});

  HorizontalImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
