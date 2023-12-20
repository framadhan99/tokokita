part of 'produk_bloc.dart';

@immutable
sealed class ProdukState {}

final class ProdukInitial extends ProdukState {}

class ListProduk extends ProdukState {
  final List<Produk> products;
  ListProduk({
    required this.products,
  });
}
