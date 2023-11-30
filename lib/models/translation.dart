class Translation {
  final int id;
  final int poseId;
  final String text;

  Translation({required this.id, required this.poseId, required this.text});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      poseId: json['poseId'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'poseId': poseId,
      'text': text,
    };
  }
}