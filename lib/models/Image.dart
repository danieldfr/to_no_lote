class Image {
  List<String> images;

  Image(this.images);

  // Construtor vazio
  Image.empty() : images = [];

  // Getters
  List<String> get getImages => images;

  // Setters
  set setImages(List<String> value) => images = value;
}