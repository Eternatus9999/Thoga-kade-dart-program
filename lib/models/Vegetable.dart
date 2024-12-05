class Vegetable {
  final String id;
  final String name;
  final double pricePerKg;
  final double availableQuantity;
  final String category;
  final String expiryDate;

  Vegetable(this.id, this.name, this.pricePerKg, this.availableQuantity, this.category, this.expiryDate);

  String? toJson() {
    return '{id: $id, name: $name, pricePerKg: $pricePerKg, availableQuantity: $availableQuantity, category: $category, "expiryDate: $expiryDate}';
  }
}