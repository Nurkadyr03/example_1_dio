class Currency {
  // "title": "Дирхам ОАЭ",
  //     "code": "AED",
  //     "cb_price": "3362.19",
  //     "nbu_buy_price": null,
  //     "nbu_cell_price": null,
  //     "date": "26.12.2023 18:00:01"

  String title;
  String code;
  String cb_price;
  String date;

  Currency({
    required this.title,
    required this.code,
    required this.cb_price,
    required this.date,
  });
  factory Currency.fromJson(Map<String ,dynamic>json){
    String title=json["title"]??"no data";
    String code=json["code"]??"no data";
    String cb_price=json["cb_price"]??"no data";
    String date=json["date"]??"no data";
    return Currency(title: title, code: code, cb_price: cb_price, date: date);
   
  }
}
