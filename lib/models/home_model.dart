class ImageModel{
  late String imagePath;
  late String author;

  ImageModel(this.imagePath,this.author);

  factory ImageModel.fromJson(Map<String,dynamic> json){
    return ImageModel(
      json['download_url'],
      json['author']
    );
  }
}