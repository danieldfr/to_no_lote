class Lot {
  List<String> images;
  String zipCode;
  String publicPlace;
  String number;
  String district;
  int cityId;
  double width;
  double length;
  double price;
  String type;
  String description;
  String lat;
  String long;
  List<String> saleTypes;

  Lot({
    required this.images,
    required this.zipCode,
    required this.publicPlace,
    required this.number,
    required this.district,
    required this.cityId,
    required this.width,
    required this.length,
    required this.price,
    required this.type,
    required this.description,
    required this.lat,
    required this.long,
    required this.saleTypes,
  });

  // Construtor vazio
  Lot.empty()
      : images = [],
        zipCode = '',
        publicPlace = '',
        number = '',
        district = '',
        cityId = 0,
        width = 0.0,
        length = 0.0,
        price = 0.0,
        type = '',
        description = '',
        lat = '',
        long = '',
        saleTypes = [];

  // Getters
  List<String> get getImages => images;
  String get getZipCode => zipCode;
  String get getPublicPlace => publicPlace;
  String get getNumber => number;
  String get getDistrict => district;
  int get getCityId => cityId;
  double get getWidth => width;
  double get getLength => length;
  double get getPrice => price;
  String get getType => type;
  String get getDescription => description;
  String get getLat => lat;
  String get getLong => long;
  List<String> get getSaleTypes => saleTypes;

  // Setters
  set setImages(List<String> value) => images = value;
  set setZipCode(String value) => zipCode = value;
  set setPublicPlace(String value) => publicPlace = value;
  set setNumber(String value) => number = value;
  set setDistrict(String value) => district = value;
  set setCityId(int value) => cityId = value;
  set setWidth(double value) => width = value;
  set setLength(double value) => length = value;
  set setPrice(double value) => price = value;
  set setType(String value) => type = value;
  set setDescription(String value) => description = value;
  set setLat(String value) => lat = value;
  set setLong(String value) => long = value;
  set setSaleTypes(List<String> value) => saleTypes = value;
}
