class Settings {
  String name;
  String value;

  Settings({
    required this.name,
    required this.value,
  });
}

List<Settings> pengaturan = [
  Settings(
      name: "settLanguage", //language settings
      value: "Bahasa Indonesia"),
  Settings(
      name: "2", // auto lokasi
      value: "on"),
  Settings(
      name: "3", // lokasi offline
      value: "0000" // id Kota or kabupaten
      ),
  Settings(
      name: "4", //Format waktu
      value: "AM / PM"),
  Settings(
      name: "5", //nontifikasi
      value: "on"),
  Settings(
      name: "6", //type alarm
      value: "1"),
  Settings(
      name: "7", // volume notifikasi
      value: "50"),
];

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
