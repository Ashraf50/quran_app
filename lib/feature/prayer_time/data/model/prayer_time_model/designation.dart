class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  @override
  String toString() {
    return 'Designation(abbreviated: $abbreviated, expanded: $expanded)';
  }

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json['abbreviated'] as String?,
        expanded: json['expanded'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'abbreviated': abbreviated,
        'expanded': expanded,
      };
}
