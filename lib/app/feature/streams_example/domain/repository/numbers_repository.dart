abstract interface class NumbersRepository {
  Stream<List<int>> watchNumbers();
  Stream<int?> watchLastNumber();
  Future<void> addNumber(int number);
  Future<void> addNumbers(List<int> numbers);
  Future<void> deleteNumbers();
}
