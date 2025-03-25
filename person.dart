class Person {
  String name = "";
  int age = 0;

  void addOneYear() {
    age++;
  }
}

void main() {
  var na = Person();
  na.name = '김양군';
  na.age = 7;
  print([na.name, na.age]);
}
