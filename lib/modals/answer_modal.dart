class AnswerModal {
  int? id;
  List<AnswerResponse>? correctOptions;

  AnswerModal({this.id, this.correctOptions});

  AnswerModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['correct_options'] != null) {
      correctOptions = <AnswerResponse>[];
      json['correct_options'].forEach((v) {
        correctOptions!.add(AnswerResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (correctOptions != null) {
      data['correct_options'] = correctOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerResponse {
  String? id;
  String? answer;

  AnswerResponse({this.id, this.answer});

  AnswerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}
