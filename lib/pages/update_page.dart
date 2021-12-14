import 'package:crudbarang/api/client.dart';
import 'package:crudbarang/model/product_model.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeForm();
  }

  void initializeForm() {
    codeController.text = widget.product.code!;
    nameController.text = widget.product.name!;
    purchasePriceController.text = widget.product.purchasePrice!;
    sellingPriceController.text = widget.product.sellingPrice!;
    qtyController.text = widget.product.qty!;
  }

  void updateProduct() async {
    var response = await Request.put("/update.php", data: {
      "code": codeController.text,
      "name": nameController.text,
      "purchasePrice": purchasePriceController.text,
      "sellingPrice": sellingPriceController.text,
      "qty": qtyController.text
    });
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data Barang"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: codeController,
                  readOnly: true,
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
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    updateProduct();
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
