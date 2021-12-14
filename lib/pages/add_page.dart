import 'package:crudbarang/api/client.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();


  void addProduct() async {
    var response = await Request.post("/add.php", data: {
      "code": codeController.text,
      "name": nameController.text,
      "purchasePrice": purchasePriceController.text,
      "sellingPrice": sellingPriceController.text,
      "qty": qtyController.text
    });
    Navigator.pop(context,true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    label: Text("Kode Barang"),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    label: Text("Nama Barang"),
                  ),
                ),
                TextFormField(
                  controller: purchasePriceController,
                  decoration: const InputDecoration(
                    label: Text("Harga Beli"),
                  ),
                ),
                TextFormField(
                  controller: sellingPriceController,
                  decoration: const InputDecoration(
                    label: Text("Harga Jual"),
                  ),
                ),
                TextFormField(
                  controller: qtyController,
                  decoration: const InputDecoration(
                    label: Text("QTY"),
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                    addProduct();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
