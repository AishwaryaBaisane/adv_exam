import 'dart:convert';

class QuotesModal {
  List<Quotes> quotes;

  QuotesModal({required this.quotes});

  factory QuotesModal.fromJson(Map m1) {
    return QuotesModal(
        quotes: (m1['quotes']  as List).map((e)=> Quotes.fromJson(e)).toList() ) ;
    //
  }
}

class Quotes {
  // late int id;
  late String quote, author;

  Quotes({required this.quote, required this.author});

  factory Quotes.fromJson(Map m1) {
    return Quotes( quote: m1['quote'], author: m1['author']);
  }
}

