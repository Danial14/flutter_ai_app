class GeminiTranslatorResponse {
  List<Candidates>? _candidates;

  GeminiTranslatorResponse({List<Candidates>? candidates}) {
    if (candidates != null) {
      this._candidates = candidates;
    }
  }

  List<Candidates>? get candidates => _candidates;
  set candidates(List<Candidates>? candidates) => _candidates = candidates;

  GeminiTranslatorResponse.fromJson(Map<String, dynamic> json) {
    if (json['candidates'] != null) {
      _candidates = <Candidates>[];
      json['candidates'].forEach((v) {
        _candidates!.add(new Candidates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._candidates != null) {
      data['candidates'] = this._candidates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Candidates {
  Content? _content;
  String? _finishReason;
  int? _index;

  Candidates({Content? content, String? finishReason, int? index}) {
    if (content != null) {
      this._content = content;
    }
    if (finishReason != null) {
      this._finishReason = finishReason;
    }
    if (index != null) {
      this._index = index;
    }
  }

  Content? get content => _content;
  set content(Content? content) => _content = content;
  String? get finishReason => _finishReason;
  set finishReason(String? finishReason) => _finishReason = finishReason;
  int? get index => _index;
  set index(int? index) => _index = index;

  Candidates.fromJson(Map<String, dynamic> json) {
    _content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    _finishReason = json['finishReason'];
    _index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._content != null) {
      data['content'] = this._content!.toJson();
    }
    data['finishReason'] = this._finishReason;
    data['index'] = this._index;
    return data;
  }
}

class Content {
  List<Parts>? _parts;
  String? _role;

  Content({List<Parts>? parts, String? role}) {
    if (parts != null) {
      this._parts = parts;
    }
    if (role != null) {
      this._role = role;
    }
  }

  List<Parts>? get parts => _parts;
  set parts(List<Parts>? parts) => _parts = parts;
  String? get role => _role;
  set role(String? role) => _role = role;

  Content.fromJson(Map<String, dynamic> json) {
    if (json['parts'] != null) {
      _parts = <Parts>[];
      json['parts'].forEach((v) {
        _parts!.add(new Parts.fromJson(v));
      });
    }
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._parts != null) {
      data['parts'] = this._parts!.map((v) => v.toJson()).toList();
    }
    data['role'] = this._role;
    return data;
  }
}

class Parts {
  String? _text;

  Parts({String? text}) {
    if (text != null) {
      this._text = text;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;

  Parts.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    return data;
  }
}