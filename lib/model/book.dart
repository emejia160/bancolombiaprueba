class Book {
  late String title;
  late String subtitle;
  late String isbn13;
  late String price;
  late String image;
  late String url;
  

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url
  });

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
  }
}