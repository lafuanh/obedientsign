class Settings {
  String name;
  String value;

  Settings({
    required this.name,
    required this.value,
  });
}

class jadwalSholat {
  String id;
  String namaJadwal;
  bool alarm;
  String waktuJadwal;

  jadwalSholat(
      {required this.id,
      required this.namaJadwal,
      required this.alarm,
      required this.waktuJadwal});
}

List<jadwalSholat> waktuSholat = [
  jadwalSholat(
    id: "1",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "2",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "3",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "4",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "5",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "6",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
  jadwalSholat(
    id: "7",
    namaJadwal: "imsak",
    alarm: true,
    waktuJadwal: "04:35",
  ),
];
