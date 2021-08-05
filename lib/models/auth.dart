class LoginResponse {
  int? id;
  String? role;
  String? username;
  String? negeri;
  String? zon;
  String? token;

  LoginResponse(
      {this.id, this.role, this.username, this.negeri, this.zon, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["role"] is String) this.role = json["role"];
    if (json["username"] is String) this.username = json["username"];
    if (json["negeri"] is String) this.negeri = json["negeri"];
    if (json["zon"] is String) this.zon = json["zon"];
    if (json["token"] is String) this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["role"] = this.role;
    data["username"] = this.username;
    data["negeri"] = this.negeri;
    data["zon"] = this.zon;
    data["token"] = this.token;
    return data;
  }
}
