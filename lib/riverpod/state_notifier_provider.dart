import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
            name: "김치",
            quentity: 3,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: "라면",
            quentity: 5,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: "삼겹살",
            quentity: 10,
            hasBought: false,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: "수빅",
            quentity: 7,
            hasBought: true,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: "카스테라",
            quentity: 20,
            hasBought: false,
            isSpicy: false,
          ),
        ]);

  void add(ShoppingItemModel item) {
    state = [...state, item];
  }

  void remove(ShoppingItemModel item) {
    state = state.where((element) => element != item).toList();
  }

  void update(ShoppingItemModel item) {
    state = state.map((e) => e == item ? item : e).toList();
  }

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quentity: e.quentity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
