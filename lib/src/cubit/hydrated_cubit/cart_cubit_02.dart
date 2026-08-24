import 'package:hydrated_bloc/hydrated_bloc.dart'; 
import 'package:state_management/src/cubit/hydrated_cubit/cart_state_hydrated_02.dart';
import 'cart_item_02.dart';

class CartCubit2 extends HydratedCubit<CartState2> {
  CartCubit2() : super(CartState2());

  void addItem(CartItem2 item) {
    final existingIndex = state.items.indexWhere((i) => i.id == item.id);

    if (existingIndex >= 0) {
      final updatedItems = [...state.items];
      final oldItem = updatedItems[existingIndex];
      final bumpedItem = oldItem.copyWith(quantity: oldItem.quantity + 1);
      updatedItems[existingIndex] = bumpedItem;

      emit(state.copyWith(items: updatedItems));
    } else {
      emit(state.copyWith(items: [...state.items, item]));
    }
  }

  void removeItem(String id) {
    emit(
      state.copyWith(
        items: state.items.where((item) => item.id != id).toList(),
      ),
    );
  }

  void clearCart() {
    emit(CartState2(items: const []));
  }

  @override
  CartState2? fromJson(Map<String, dynamic> json) {
    return CartState2.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState2 state) {
    return state.toMap();
  }
}