class Cities {
  String id;
  String lokasi;

  Cities(this.id, this.lokasi);

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(json['id'], json['lokasi']);
  }
}
