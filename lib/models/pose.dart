class Pose {
  final int id;
  final String name;
  final List<double> keypoints;

  Pose({required this.id, required this.name, required this.keypoints});

  factory Pose.fromJson(Map<String, dynamic> json) {
    return Pose(
      id: json['id'],
      name: json['name'],
      keypoints: List<double>.from(json['keypoints'].map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'keypoints': keypoints,
    };
  }
}