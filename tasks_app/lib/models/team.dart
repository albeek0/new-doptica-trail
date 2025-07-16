class Team {
  final String id;
  final String name;
  final int memberCount;

  Team({required this.id, required this.name, required this.memberCount});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      memberCount: json['memberCount'],
    );
  }
}
