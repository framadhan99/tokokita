import 'package:flutter/material.dart';
import 'package:tokokita/bloc/logout_bloc.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/login_page.dart';
import 'package:tokokita/ui/page/produk/detail_produk_page.dart';
import 'package:tokokita/ui/page/produk/produk_form_page.dart';
import 'package:tokokita/ui/widget/item_produk_widget.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> refreshData() async {
    await ProdukBloc.getProduk();
    setState(() {});
  }

  void _logout() async {
    var token = await UserInfo().getToken();
    LogoutBloc.logout(token ?? "").then((value) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${value}"),
      ));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ProdukList produk = ProdukList();
    return Scaffold(
      appBar: AppBar(
        title: Text("List Produk"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdukFormPage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: ListTile(
            title: Text("logout"),
            trailing: Icon(Icons.logout),
            onTap: () {
              _logout();
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: refreshData,
        child: FutureBuilder<List<Produk>>(
          future: ProdukBloc.getProduk(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.hasError}"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ItemProduk(
                  title: snapshot.data![index].nama_produk!,
                  subtitle: snapshot.data![index].harga.toString(),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailProdukPage(
                          produk: snapshot.data![index],
                        );
                      },
                    ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
