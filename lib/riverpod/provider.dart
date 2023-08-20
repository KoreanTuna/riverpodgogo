import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodgogo/model/shopping_item_model.dart';
import 'package:riverpodgogo/riverpod/state_notifier_provider.dart';

final filteredShoopingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);
  if (filterState == FilterState.all) {
    return shoppingListState;
  }
  return shoppingListState
      .where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState {
  nonSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
