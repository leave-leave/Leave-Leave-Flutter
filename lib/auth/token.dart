class RefreshToken {
  String? accessToken;
  String? refreshToken;

  RefreshToken({this.accessToken, this.refreshToken});

  RefreshToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_tokke'] = this.refreshToken;
    return data;
  }
}
