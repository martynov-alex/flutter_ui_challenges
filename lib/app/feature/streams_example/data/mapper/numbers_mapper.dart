import 'package:flutter_ui_challenges/app/feature/streams_example/data/source/numbers_database_impl.dart';

class NumbersMapper {
  static int fromDto(NumberDto dto) => dto.number;
}
