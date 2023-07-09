

/// Future<String> join([String separator = '']);
/// Future          forEach(void Function(T element) action);
/// Future<List<T>> toList();
/// Future<Set<T>>  toSet();
void setList() {
  List<String> names = ["Vlad", "Vladislav", "Moofiy","Vlad", "Vladislav", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names.toList());
  print(names.toSet());
  names.forEach((element) {
    print(element);
  });
  print(names.join("-"));

}


/// Stream<S> map<S>(S Function(T event) convert);
void mapExample() {
  List<String> names = ["Vlad", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names.map((element) => element.toUpperCase()).toList());
}

/// Stream<S>      expand<S>(Iterable<S> Function(T element) convert);
void expand() {
  /// Expand the list to what ever you return in the function
  List<String> names = ["Vlad", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names
      .expand((element) => [
    element,
    element.length,
  ])
      .toList());
}



/// Future<S>        fold<S>(S initialValue, S Function(S previous, T element) combine);
void foldExample() {
  /// try to print the first letter of every item in the list and combine them together and make the string start with !
  /// using foreach
  /// using fold
  List<String> names = [
    "Vlad",
    "Vladislav",
    "Moofiy",
    "Maxim",
    "Malik",
    "T-bag"
  ];
  /// return one single element from the collection, start with the initial value,
  /// and then combine the element with prev and return the new value and store it in prev!
  /// for more understanding debug it!
  String value = names.fold<String>("-", (previousValue, element) {
    print(previousValue);
    print(element);
    return previousValue + element[0];
  });
  print(value);
}

/// Future<T>       reduce(T Function(T previous, T element) combine);
void reduceExample() {
  /// reduce is just like Fold, but with no initial value, and it start with the first 2 elements in the list
  List<String> names = ["Vlad", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names.reduce((value, element) {
    print(value);
    print(element);
    return value[0] + element[0];
  }));
}




/// Stream<T> skip(int count);
/// Stream<T> skipWhile(bool Function(T element) test);
/// Stream<T> take(int count);
/// Stream<T> takeWhile(bool Function(T element) test);
/// Future<T> elementAt(int index);

void skipTake() {
  var names = ["Vlad", "Vladislav", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names.skip(3));
  print(names.skipWhile((value) => value.startsWith("V")));
  print(names.take(3));
  print(names.takeWhile((value) => value.startsWith("V")));
}

/// Stream<T> where(bool Function(T event) test);
/// Future<T> firstWhere(bool Function(T element) test, {T Function()? orElse});
/// Future<T> lastWhere(bool Function(T element) test, {T Function()? orElse});
/// Future<T> lastIndexWhere(bool Function(T element) test, {T Function()? orElse});
/// Future<T> singleWhere(bool Function(T element) test, {T Function()? orElse});
/// Future<T> indexWhere(bool Function(T element) test, {T Function()? orElse});
/// Future<T> lastIndexWhere(bool Function(T element) test, {T Function()? orElse});
void whereExample() {
  var names = ["Vlad", "Vladislav", "Moofiy", "Maxim", "Malik", "T-bag"];
  print(names.where((element) => element.startsWith("M")));
  print(names.firstWhere((element) => element.startsWith("M")));
  print(names.lastWhere((element) => element.startsWith("M")));

  /// check if 1 element satisfy the test and return it otherwise return orElse or throw exception!
  print(names.singleWhere((element) => element.startsWith("T"), orElse: () {
    return "No one element is found";
  }));
  print(names.indexWhere((element) => element.startsWith("M")));
  print(names.lastIndexWhere((element) => element.startsWith("M")));
}



/// Future<bool> any(bool Function(T element) test);
/// Future<bool> every(bool Function(T element) test);
/// Future<bool> contains(Object? needle);
/// Future<bool> get isEmpty;
void anyEvery() {
  const names = ["Vlad", "Ivan", "Moofiy", "Maxim"];
  print(names.any((element) => element.length <= 4));
  print(names.every((element) => element.length >= 4));
  print(names.contains("Ivan"));
  print(names.isEmpty);
}

/// Future<T> get first;
/// Future<T> get last;
/// Future<int> get length;
/// Future<T> get single;
void firstLast() {
  const names = ["Vlad", "Ivan", "Moofiy", "Maxim"];
  print(names.first);
  print(names.last);
  print(names.isEmpty);
  print(names.length);

  /// check if the list have one element, throw exception if not
  print(names.single);
}

/// Call methods Here
void main(List<String> arguments) {

}

