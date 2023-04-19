
class PostsModel {
  int? _userId;
  int? _it;
  String? _title;
  String? _body;

  PostsModel({int? userId, int? it, String? title, String? body}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (it != null) {
      this._it = it;
    }
    if (title != null) {
      this._title = title;
    }
    if (body != null) {
      this._body = body;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get it => _it;
  set it(int? it) => _it = it;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get body => _body;
  set body(String? body) => _body = body;

  PostsModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _it = json['it'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['it'] = this._it;
    data['title'] = this._title;
    data['body'] = this._body;
    return data;
  }
}
