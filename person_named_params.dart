class Person {
  String? name;
  int? age;

  Person({this.name, this.age});
}

void main() {
  var p = Person(); //name : null, age: null
  var p2 = Person(name: '김양군'); //age: null
  var p3 = Person(age: 7); //name: null
  var p4 = Person(name: '김양군', age: 7);
}
