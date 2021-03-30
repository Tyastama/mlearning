class Course {
  String id;
  String materi;
  String kategori_mapel;


  Course({this.materi, this.kategori_mapel});
  Course.withId({this.id, this.materi, this.kategori_mapel});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materi = json['materi'];
    kategori_mapel = json['kategori_mapel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['materi'] = this.materi;
    data['kategori_mapel'] = this.kategori_mapel;
    return data;
  }
}