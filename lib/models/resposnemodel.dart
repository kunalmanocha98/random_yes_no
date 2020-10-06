class ResponseData {
  String answer;
  bool forced;
  String image;

  ResponseData({this.answer, this.forced, this.image});

  ResponseData.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    forced = json['forced'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['forced'] = this.forced;
    data['image'] = this.image;
    return data;
  }
}