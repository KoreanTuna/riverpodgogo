class ShoppingItemModel {
  final String name;
  final int quentity;
  final bool hasBought;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quentity,
    required this.hasBought,
    required this.isSpicy,
  });
  ShoppingItemModel copyWith({
    String? name,
    int? quentity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      quentity: quentity ?? this.quentity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
