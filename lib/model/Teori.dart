class Teori {
  String id;
  String makul;
  

  Teori({this.makul});
  Teori.withId({this.id, this.makul});

 Teori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makul = json['makul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['makul'] = this.makul;
    return data;
  }
}