import 'package:crudbarang/api/client.dart';
import 'package:crudbarang/component/loading.dart';
import 'package:crudbarang/model/product_model.dart';
import 'package:crudbarang/pages/add_page.dart';
import 'package:crudbarang/pages/update_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isLoading = true;
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    List<dynamic> response = await Request.get('/list.php');
    setState(() {
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      isLoading = false;
    });
  }

  deleteProduct(String code) async {
    var response = await Request.delete('/delete.php', data: {"code": code});
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Barang"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddPage(),
                ),
              ).then((value) => fetchProduct());
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: Loading(),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${products[index].name!} (${products[index].code})"),
                                  Text(
                                      "Harga Beli : ${products[index].purchasePrice}"),
                                  Text(
                                      "Harga Jual : ${products[index].sellingPrice}"),
                                  Text("Stok : ${products[index].qty}"),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UpdatePage(
                                            product: products[index]),
                                      ),
                                    ).then((value) => fetchProduct());
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    deleteProduct(products[index].code!);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
