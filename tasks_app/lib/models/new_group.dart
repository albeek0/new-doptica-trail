class Group {
  final String name;
  final String avatarUrl;

  Group({required this.name, required this.avatarUrl});

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatarUrl': avatarUrl,
      };

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      avatarUrl: json['avatarUrl'],
    );
  }
}
