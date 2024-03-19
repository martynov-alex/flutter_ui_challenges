abstract interface class NumbersDatabase {
  Stream<List<int>> watchNumbers();
  Stream<int?> watchLastNumber();
  Future<void> addNumber(int number);
  Future<void> addNumbers(List<int> numbersList);
  Future<void> deleteNumbers();
}
