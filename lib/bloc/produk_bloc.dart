import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tokokita/model/produk.dart';

part 'produk_event.dart';
part 'produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  ProdukBloc() : super(ProdukInitial()) {
    on<GetProdukEvent>((event, emit) {
      emit(ListProduk(products: [
        Produk(
          id: 1,
          kodeProduk: "0001",
          namaProduk: "Kamera",
          hargaProduk: 5000000,
        ),
        Produk(
          id: 2,
          kodeProduk: "0002",
          namaProduk: "Kulkas",
          hargaProduk: 2500000,
        ),
        Produk(
          id: 3,
          kodeProduk: "0003",
          namaProduk: "Mesin Cuci",
          hargaProduk: 2000000,
        ),
      ]));
    });
  }
}
