class RadioModel {
  String? title;
  String? sizex;
  String? extensionType;
  String? url;

  RadioModel({this.title, this.sizex, this.extensionType, this.url});

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        title: json['title'] as String?,
        sizex: json['sizex'] as String?,
        extensionType: json['extension_type'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'sizex': sizex,
        'extension_type': extensionType,
        'url': url,
      };
}
