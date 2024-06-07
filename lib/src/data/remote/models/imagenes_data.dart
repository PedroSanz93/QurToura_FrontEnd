
// lista modelo de image data para mostrar imagenes internas de la app
class ImageData {
  final String assetPath;
  final String description;
  final String mapsUrl;
  final List<String> otrasImagenes;

  ImageData
  (this.assetPath, 
  this.description, 
  this.mapsUrl, 
  this.otrasImagenes
  );
}

List<ImageData> images = [
  ImageData(
    "lib/assets/mezquita.jpg",
    "Mezquita de Córdoba",
    "https://www.google.es/maps/place/Mezquita-Catedral+de+C%C3%B3rdoba/@37.8789056,-4.7819565,16z/data=!4m15!1m8!3m7!1s0xd6d2082ce1a16cf:0xefebc353f81bf636!2sMezquita-Catedral+de+C%C3%B3rdoba!8m2!3d37.8789056!4d-4.7793869!10e1!16zL20vMDNjYmtf!3m5!1s0xd6d2082ce1a16cf:0xefebc353f81bf636!8m2!3d37.8789056!4d-4.7793869!16zL20vMDNjYmtf?entry=ttu",
    [
    'lib/assets/mez1.jpg',
    'lib/assets/mez2.jpg',
    'lib/assets/mez3.jpg',
    'lib/assets/mez4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/alcazar.jpeg",
    "Jardines del Alcazar",
    "https://www.google.com/maps/place/Alc%C3%A1zar+de+los+Reyes+Cristianos/@37.8764365,-4.7835525,17z/data=!3m1!4b1!4m6!3m5!1s0xd6d209c64b08419:0xcb4ad460f15712f5!8m2!3d37.8764323!4d-4.7809776!16zL20vMGNkMjVw?authuser=0&entry=ttu",
      [
    'lib/assets/alcz1.jpg',
    'lib/assets/alcz2.jpg',
    'lib/assets/alcz3.jpg',
    'lib/assets/alcz4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/medina.jpg",
    "Medina Azahara",
    "https://www.google.com/maps/place/Medina+Azahara+-+Conjunto+Arqueol%C3%B3gico+Madinat+al-Zahra/@37.8806474,-4.8563101,17z/data=!3m1!4b1!4m6!3m5!1s0xd6cd871806f2df1:0xa6d8f2cac7862921!8m2!3d37.8806432!4d-4.8537352!16zL20vMDhiYzho?authuser=0&entry=ttu",
      [
    'lib/assets/az1.jpg',
    'lib/assets/az2.jpg',
    'lib/assets/az3.jpg',
    'lib/assets/az4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/albolafia.jpg",
    "Soto de la Albolafia",
    "https://www.google.com/maps/place/Monumento+Natural+Sotos+de+la+Albolafia/@37.8749504,-4.7813256,17z/data=!3m1!4b1!4m6!3m5!1s0xd6d2084dea94021:0x66218d621e92840f!8m2!3d37.8749462!4d-4.7787507!16s%2Fg%2F122cz7mj?authuser=0&entry=ttu",
      [
    'lib/assets/alb1.jpeg',
    'lib/assets/alb2.jpeg',
    'lib/assets/alb3.jpeg',
    'lib/assets/alb4.jpeg',
  ],
  ),
  ImageData(
    "lib/assets/puente.jpg",
    "Puente Romano",
    "https://www.google.com/maps/place/Puente+Romano+de+C%C3%B3rdoba/@37.8766847,-4.7791187,18z/data=!3m2!4b1!5s0xd6d2083632fe841:0x924acbb7f8dcbee8!4m6!3m5!1s0xd6d209ca1831265:0xd6707a33cf6dd271!8m2!3d37.8767086!4d-4.7779731!16s%2Fm%2F0h3pms0?authuser=0&entry=ttu",
      [
    'lib/assets/pu1.jpg',
    'lib/assets/pu2.jpg',
    'lib/assets/pu3.jpg',
    'lib/assets/pu4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/sierra.jpg",
    "Sierra de Córdoba",
    "https://www.google.com/maps/place/Sierra+de+Cordoba/@37.900016,-4.8602997,15z/data=!3m1!4b1!4m6!3m5!1s0xd6cd8f52d31fa9d:0x52370aaf496023aa!8m2!3d37.9!4d-4.85!16s%2Fg%2F11cn5rmwqb?authuser=0&entry=ttu",
      [
    'lib/assets/si1.jpg',
    'lib/assets/si2.jpg',
    'lib/assets/si3.jpg',
    'lib/assets/si4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/barrio.jpg",
    "Mesón el Barrio",
    "https://www.google.com/maps/place/Mes%C3%B3n+del+Barrio/@37.8919879,-4.7634527,17z/data=!3m1!4b1!4m6!3m5!1s0xd6cdf8ff4532883:0x1f9ad9cf3d32137!8m2!3d37.8919838!4d-4.7585818!16s%2Fg%2F1tdkh_md?authuser=0&entry=ttu",
      [
    'lib/assets/ba1.jpg',
    'lib/assets/ba2.jpg',
    'lib/assets/ba3.jpg',
    'lib/assets/ba4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/abuela.jpg",
    "Taberna la Abuela",
    "https://www.google.com/maps/place/Taberna+la+Abuela/@37.8805295,-4.7650655,17z/data=!3m1!4b1!4m6!3m5!1s0xd6cdf81dbf48e55:0xd7275293c9a15a3c!8m2!3d37.8805253!4d-4.7624906!16s%2Fg%2F11xglpln2?authuser=0&entry=ttu",
      [
    'lib/assets/abu1.jpg',
    'lib/assets/abu2.jpg',
    'lib/assets/abu3.jpg',
    'lib/assets/abu4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/viana.jpg",
    "Palacio de Viana",
    "https://www.google.com/maps/place/Palacio+de+Viana/@37.8886478,-4.7766261,17z/data=!3m1!4b1!4m6!3m5!1s0xd6cdf79604fdf91:0xa5e7fa34716c3858!8m2!3d37.8886436!4d-4.7740512!16s%2Fg%2F121v2brs?authuser=0&entry=ttu",
      [
    'lib/assets/vi1.jpg',
    'lib/assets/vi2.jpg',
    'lib/assets/vi3.jpg',
    'lib/assets/vi4.jpg',
  ],
  ),
  ImageData(
    "lib/assets/juderia.jpg",
    "La Judería",
    "https://www.google.com/maps/place/La+Juder%C3%ADa,+Centro,+C%C3%B3rdoba/@37.8781903,-4.7815552,16z/data=!4m6!3m5!1s0xd6d20832b69c283:0x5ece044e8146dac1!8m2!3d37.8797332!4d-4.7788675!16s%2Fg%2F11xd1j78y?authuser=0&entry=ttu",
      [
    'lib/assets/ju1.jpg',
    'lib/assets/ju2.jpg',
    'lib/assets/ju3.jpg',
    'lib/assets/ju4.jpg',
  ],
  ),
];