import 'package:dolang/features/book_list/models/book_model.dart';
import 'package:dolang/features/home/models/destination_model.dart';

class DetailBookArguments {
  final BookModel book;
  final DestinationModel destination;

  DetailBookArguments(this.book, this.destination);
}
