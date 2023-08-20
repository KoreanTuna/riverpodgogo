import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/model/shopping_item_model.dart';

final selectProvider =
    StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) {
  return SelectNotifier();
});

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: "김치",
            quentity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
