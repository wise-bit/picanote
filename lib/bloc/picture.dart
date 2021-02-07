class Picture {
  String imageurl;
  String info;

  Picture({this.info, this.imageurl});

  factory Picture.fromJson(dynamic json) {
    return Picture(info: json['info'] ?? "", imageurl: json['imageurl']);
  }
}
