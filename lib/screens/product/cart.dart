import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductsCubit productsCubit;
  late CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).getTranslate("cart")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/favorites"),
              icon: Icon(Icons.favorite),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => cartCubit.sepetiBosalt(),
              icon: Icon(Icons.clear_all),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        return SizedBox.expand(
          child: state.sepet.length == 0
              ? Center(
                  child: Text(
                      AppLocalizations.of(context).getTranslate("cart-empty")))
              : ListView.builder(
                  itemCount: state.sepet.length,
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.all(14.0),
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                state.sepet[index]["photo"].toString(),
                                height: 90,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.sepet[index]["name"]
                                          .toString()),
                                      SizedBox(width: 12.0),
                                      Text(
                                          state.sepet[index]["count"]
                                                  .toString() +
                                              " x",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ],
                                  ),
                                  if (productsCubit.isFavorite(
                                      state.sepet[index]["id"] as int))
                                    IconButton(
                                        onPressed: () {
                                          productsCubit.removeFromFavorites(
                                              state.sepet[index]["id"] as int);
                                        },
                                        icon: Row(
                                          children: [
                                            Text("Favoriden Kaldir"),
                                          ],
                                        ))
                                  else
                                    IconButton(
                                        onPressed: () {
                                          productsCubit.addToFavorites(
                                              state.sepet[index]);
                                        },
                                        icon:
                                            const Icon(Icons.favorite_border)),
                                  IconButton(
                                      onPressed: () {
                                        cartCubit.sepettenCikart(
                                            id: state.sepet[index]["id"]
                                                as int);
                                      },
                                      icon: Row(
                                        children: [
                                          Text("Sepetten Kaldir"),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                          if (state.sepet[index]["in-stock"] as bool)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.check_box),
                                    const Text("Mevcut"),
                                  ],
                                ),
                                Text(state.sepet[index]["price"].toString() +
                                    " ₺"),
                              ],
                            )
                          else
                            const Row(
                              children: [
                                Icon(Icons.error),
                                Text("Mevcut Degil"),
                              ],
                            ),
                          const Divider(),
                        ],
                      )),
                ),
        );
      }),
    );
  }
}
