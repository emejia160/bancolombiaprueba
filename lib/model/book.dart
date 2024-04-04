class Book {
  late String? title;
  late String? subtitle;
  late String? isbn13;
  late String? price;
  late String? image;
  late String? url;
  late String? authors;
  late String? publisher;
  late String? language;
  late String? year;
  late String? description;
  

  Book({
     this.title,
     this.subtitle,
     this.isbn13,
     this.price,
     this.image,
     this.url,
     this.authors,
     this.publisher,
     this.language,
     this.year,
     this.description
  });

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
    authors = json['authors'];
    publisher = json['publisher'];
    language = json['language'];
    year = json['year'];
    description = json['desc'];
  }
  
}