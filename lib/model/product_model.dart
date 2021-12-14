class ProductModel {
  String? code;
  String? name;
  String? purchasePrice;
  String? sellingPrice;
  String? qty;

  ProductModel(
      {this.code, this.name, this.purchasePrice, this.sellingPrice, this.qty});

  ProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    purchasePrice = json['purchasePrice'];
    sellingPrice = json['sellingPrice'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['purchasePrice'] = this.purchasePrice;
    data['sellingPrice'] = this.sellingPrice;
    data['qty'] = this.qty;
    return data;
  }
}