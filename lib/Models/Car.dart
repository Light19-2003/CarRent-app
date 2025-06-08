class Car {
  String name;
  String brand;
  int year;
  double price;
  bool isElectric;
  String imageUrl;

  Car({
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    required this.isElectric,
    required this.imageUrl,
  });
}

List<Car> carList = [
  Car(
    name: 'Model Light',
    brand: 'Lamborghini',
    year: 2023,
    price: 79999.99,
    isElectric: true,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-AFLocP1oMhiviPelXz4yXjFDRSjkjU9SNA&s',
  ),
  Car(
    name: 'Mustang GT',
    brand: 'Ford',
    year: 2021,
    price: 55999.99,
    isElectric: false,
    imageUrl:
        'https://www.ford.com/is/image/content/dam/brand_ford/en_us/brand/cars/mustang/2022/collections/dm/22_FRD_MST_40600_GT_34Front.tif?croppathe=1_3x2&wid=900',
  ),
  Car(
    name: 'Civic',
    brand: 'Honda',
    year: 2020,
    price: 20999.99,
    isElectric: false,
    imageUrl:
        'https://hondanews.com/en-US/honda-automobiles/releases/release-e4cc6a6a724fbb5e50f6ce1109f89f30-2020-honda-civic-sedan-press-kit/_jcr_content/image.img.jpg',
  ),
  Car(
    name: 'i4',
    brand: 'BMW',
    year: 2022,
    price: 55990.00,
    isElectric: true,
    imageUrl:
        'https://www.bmwusa.com/content/dam/bmwusa/i4/2022/Overview/BMW-MY22-i4-Overview-Standard-Desktop.jpg',
  ),
  Car(
    name: 'Taycan',
    brand: 'Porsche',
    year: 2022,
    price: 103800.00,
    isElectric: true,
    imageUrl:
        'https://files.porsche.com/filestore/image/multimedia/none/modelseries-j1-e3s-modelimage-sideshot/thumbwhite/d4f01eeb-dc40-11eb-80ed-005056bbdc38;sK/porsche-thumbwhite.jpg',
  ),
];
