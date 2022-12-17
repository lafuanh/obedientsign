class Settings {
  String id;
  String value;

  Settings({
    required this.id,
    required this.value,
  });
}

List<Settings> pengaturan = [
  Settings(
      id: "0", //language settings
      value: "Bahasa Indonesia"),
  Settings(
      id: "2", // auto lokasi
      value: "on"),
  Settings(
      id: "3", // lokasi offline
      value: "0000" // id Kota or kabupaten
      ),
  Settings(
      id: "4", //Format waktu
      value: "AM / PM"),
  Settings(
      id: "5", //nontifikasi
      value: "on"),
  Settings(
      id: "6", //type alarm
      value: "1"),
  Settings(
      id: "7", // volume notifikasi
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
