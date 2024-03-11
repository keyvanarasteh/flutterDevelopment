import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(super.initialState);

  addToFavorites(Map<String, dynamic> product) {
    var currentFavorites = state.favorites;

    bool found = false;

    for (int i = 0; i < currentFavorites.length; i++) {
      if (currentFavorites[i]["id"] == product["id"]) {
        found = true;
        break;
      }
    }

    if (found) {
      // urun favori listede zaten mevcut
      // eklemeye gerek yok
    } else {
      currentFavorites.add(product);
      // yeni durum hazirliyorum
      final updatedState = ProductsState(
        favorites: currentFavorites,
      );

      emit(updatedState);

      print("eklendi");
    }
  }

  addToFavorites2(Map<String, dynamic> product) {
    var currentFavorites = state.favorites;

    if (currentFavorites.any((element) => element["id"] == product["id"])) {
      // zaten var favori de o urun
    } else {
      currentFavorites.add(product);
      final newState = ProductsState(favorites: currentFavorites);
      emit(newState);
    }
  }

  bool isFavorite(int productId) {
    return state.favorites.any((element) => element["id"] == productId);
  }

  removeFromFavorites(int productID) {
    var currentFavorites = state.favorites;

    currentFavorites.removeWhere((element) => element["id"] == productID);

    final newState = ProductsState(favorites: currentFavorites);

    emit(newState);
  }

  clearFavorites() {
    final updatedState = ProductsState(
      favorites: const [],
    );

    emit(updatedState);
  }
}
