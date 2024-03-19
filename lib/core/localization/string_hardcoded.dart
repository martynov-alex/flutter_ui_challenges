/// A simple placeholder that can be used to search all the hardcoded strings
/// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  //@Deprecated("Don't forget to remove hardcoded strings")
  String get hardcoded {
    // log(
    //   'DO NOT USE HARDCODED STRINGS: $this',
    //   stackTrace: StackTrace.current,
    //   error: UnimplementedError(),
    // );
    // assert(false, 'DO NOT USE HARDCODED STRINGS: $this');
    return this;
  }
}
