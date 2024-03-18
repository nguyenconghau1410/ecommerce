class Category {
  String? title;
  String? image;
  String? icon;

  Category(this.title, this.image, this.icon);
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json['title'], json['image'], json['icon']);
  }
}

final List<Category> categories = [
  Category("Mobile", "images/Ip15.jpg", ""),
  Category("Laptop", "images/lapdell.jpg", ""),
  Category("PC", "images/pc.jpg", ""),
  Category("Air", "images/Sony.jpg", ""),
  Category("Watch", "images/watch.jpg", ""),
];

class Categories {
  String? id;
  String? name;
  String? icon;

  Categories(this.id, this.name, this.icon);
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(json['_id'], json['name'], json['icon']);
  }

}
