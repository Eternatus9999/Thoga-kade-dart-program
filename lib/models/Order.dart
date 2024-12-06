class Order{
  final String id;
  final String item;
  final double qty;
  final double totalPrice;

  Order(this.id, this.item, this.qty, this.totalPrice);

  String toString() => 'id: $id, item: $item, qty: $qty, totalPrice: $totalPrice |';
}