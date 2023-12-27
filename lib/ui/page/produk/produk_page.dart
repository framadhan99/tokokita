import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Produk"),
        actions: [
          IconButton(
            onPressed: () {},
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
            onTap: () {},
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {},
      ),
    );
  }
}
