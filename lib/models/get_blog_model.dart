
class GetBlogModel {
  List<Data>? data;

  GetBlogModel({this.data});

  GetBlogModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  String? heroImage;
  List<VerticleImage>? verticleImage;
  List<HorizontalImage>? horizontalImage;

  Data(
      {this.id,
        this.title,
        this.content,
        this.heroImage,
        this.verticleImage,
        this.horizontalImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    heroImage = json['hero_image'];
    if (json['verticle_image'] != null) {
      verticleImage = <VerticleImage>[];
      json['verticle_image'].forEach((v) {
        verticleImage!.add(VerticleImage.fromJson(v));
      });
    }
    if (json['horizontal_image'] != null) {
      horizontalImage = <HorizontalImage>[];
      json['horizontal_image'].forEach((v) {
        horizontalImage!.add(HorizontalImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['hero_image'] = this.heroImage;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}class HorizontalImage {
  String? url;

  HorizontalImage({this.url});

  HorizontalImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
