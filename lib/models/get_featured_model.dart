class GetFeaturedModel {
  List<Data>? data;

  GetFeaturedModel({this.data});

  GetFeaturedModel.fromJson(Map<String, dynamic> json) {
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
  String? thumbnailDescription;
  String? featuredImaged;

  Data({this.id, this.thumbnailDescription, this.featuredImaged});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailDescription = json['thumbnail_description'];
    featuredImaged = json['featured_imaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thumbnail_description'] = this.thumbnailDescription;
    data['featured_imaged'] = this.featuredImaged;
    return data;
  }
}
