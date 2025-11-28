class RagResponse {
  bool? success;
  Data? data;

  RagResponse({this.success, this.data});

  RagResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? question;
  String? answer;
  List<Sources>? sources;
  bool? fromCache;
  String? responseTime;

  Data({
    this.question,
    this.answer,
    this.sources,
    this.fromCache,
    this.responseTime,
  });

  Data.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add( Sources.fromJson(v));
      });
    }
    fromCache = json['fromCache'];
    responseTime = json['responseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    data['fromCache'] = fromCache;
    data['responseTime'] = responseTime;
    return data;
  }
}

class Sources {
  String? id;
  String? title;
  String? category;
  String? content;
  double? similarity;

  Sources({this.id, this.title, this.category, this.content, this.similarity});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    content = json['content'];
    similarity = json['similarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['content'] =content;
    data['similarity'] = similarity;
    return data;
  }
}
