class GeminiTextGenerationResponse {
  List<Candidates>? _candidates;
  UsageMetadata? _usageMetadata;
  String? _modelVersion;
  String? _responseId;

  GeminiTextGenerationResponse(
      {List<Candidates>? candidates,
        UsageMetadata? usageMetadata,
        String? modelVersion,
        String? responseId}) {
    if (candidates != null) {
      this._candidates = candidates;
    }
    if (usageMetadata != null) {
      this._usageMetadata = usageMetadata;
    }
    if (modelVersion != null) {
      this._modelVersion = modelVersion;
    }
    if (responseId != null) {
      this._responseId = responseId;
    }
  }

  List<Candidates>? get candidates => _candidates;
  set candidates(List<Candidates>? candidates) => _candidates = candidates;
  UsageMetadata? get usageMetadata => _usageMetadata;
  set usageMetadata(UsageMetadata? usageMetadata) =>
      _usageMetadata = usageMetadata;
  String? get modelVersion => _modelVersion;
  set modelVersion(String? modelVersion) => _modelVersion = modelVersion;
  String? get responseId => _responseId;
  set responseId(String? responseId) => _responseId = responseId;

  GeminiTextGenerationResponse.fromJson(Map<String, dynamic> json) {
    if (json['candidates'] != null) {
      _candidates = <Candidates>[];
      json['candidates'].forEach((v) {
        _candidates!.add(new Candidates.fromJson(v));
      });
    }
    _usageMetadata = json['usageMetadata'] != null
        ? new UsageMetadata.fromJson(json['usageMetadata'])
        : null;
    _modelVersion = json['modelVersion'];
    _responseId = json['responseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._candidates != null) {
      data['candidates'] = this._candidates!.map((v) => v.toJson()).toList();
    }
    if (this._usageMetadata != null) {
      data['usageMetadata'] = this._usageMetadata!.toJson();
    }
    data['modelVersion'] = this._modelVersion;
    data['responseId'] = this._responseId;
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

class UsageMetadata {
  int? _promptTokenCount;
  int? _candidatesTokenCount;
  int? _totalTokenCount;
  List<PromptTokensDetails>? _promptTokensDetails;
  int? _thoughtsTokenCount;

  UsageMetadata(
      {int? promptTokenCount,
        int? candidatesTokenCount,
        int? totalTokenCount,
        List<PromptTokensDetails>? promptTokensDetails,
        int? thoughtsTokenCount}) {
    if (promptTokenCount != null) {
      this._promptTokenCount = promptTokenCount;
    }
    if (candidatesTokenCount != null) {
      this._candidatesTokenCount = candidatesTokenCount;
    }
    if (totalTokenCount != null) {
      this._totalTokenCount = totalTokenCount;
    }
    if (promptTokensDetails != null) {
      this._promptTokensDetails = promptTokensDetails;
    }
    if (thoughtsTokenCount != null) {
      this._thoughtsTokenCount = thoughtsTokenCount;
    }
  }

  int? get promptTokenCount => _promptTokenCount;
  set promptTokenCount(int? promptTokenCount) =>
      _promptTokenCount = promptTokenCount;
  int? get candidatesTokenCount => _candidatesTokenCount;
  set candidatesTokenCount(int? candidatesTokenCount) =>
      _candidatesTokenCount = candidatesTokenCount;
  int? get totalTokenCount => _totalTokenCount;
  set totalTokenCount(int? totalTokenCount) =>
      _totalTokenCount = totalTokenCount;
  List<PromptTokensDetails>? get promptTokensDetails => _promptTokensDetails;
  set promptTokensDetails(List<PromptTokensDetails>? promptTokensDetails) =>
      _promptTokensDetails = promptTokensDetails;
  int? get thoughtsTokenCount => _thoughtsTokenCount;
  set thoughtsTokenCount(int? thoughtsTokenCount) =>
      _thoughtsTokenCount = thoughtsTokenCount;

  UsageMetadata.fromJson(Map<String, dynamic> json) {
    _promptTokenCount = json['promptTokenCount'];
    _candidatesTokenCount = json['candidatesTokenCount'];
    _totalTokenCount = json['totalTokenCount'];
    if (json['promptTokensDetails'] != null) {
      _promptTokensDetails = <PromptTokensDetails>[];
      json['promptTokensDetails'].forEach((v) {
        _promptTokensDetails!.add(new PromptTokensDetails.fromJson(v));
      });
    }
    _thoughtsTokenCount = json['thoughtsTokenCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promptTokenCount'] = this._promptTokenCount;
    data['candidatesTokenCount'] = this._candidatesTokenCount;
    data['totalTokenCount'] = this._totalTokenCount;
    if (this._promptTokensDetails != null) {
      data['promptTokensDetails'] =
          this._promptTokensDetails!.map((v) => v.toJson()).toList();
    }
    data['thoughtsTokenCount'] = this._thoughtsTokenCount;
    return data;
  }
}

class PromptTokensDetails {
  String? _modality;
  int? _tokenCount;

  PromptTokensDetails({String? modality, int? tokenCount}) {
    if (modality != null) {
      this._modality = modality;
    }
    if (tokenCount != null) {
      this._tokenCount = tokenCount;
    }
  }

  String? get modality => _modality;
  set modality(String? modality) => _modality = modality;
  int? get tokenCount => _tokenCount;
  set tokenCount(int? tokenCount) => _tokenCount = tokenCount;

  PromptTokensDetails.fromJson(Map<String, dynamic> json) {
    _modality = json['modality'];
    _tokenCount = json['tokenCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modality'] = this._modality;
    data['tokenCount'] = this._tokenCount;
    return data;
  }
}