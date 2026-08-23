import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/data/models/cart_item.dart';
import 'package:state_management/src/cubit/logic/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addItem(CartItem item) {
    final existingIndex = state.items.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      final updatedItem = [...state.items];
      final oldItem = updatedItem[existingIndex];
      final bumpedItem = oldItem.copyWith(quantity: oldItem.quantity + 1);
      updatedItem[existingIndex] = bumpedItem;
      emit(state.copyWith(items: updatedItem));
    } else {
      emit(state.copyWith(items: [...state.items, item]));
    }
  }
    void removeItem(String id) {
      emit(state.copyWith(items: state.items.where((item) => item.id != id).toList()));
    }
  }

