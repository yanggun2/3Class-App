/*
 * 클래스 필드 이름앞에 '_'(접근지정자)를 붙이는 것은 다수의 언어에서 사용하는 스타일임
 * 예) Java, C++, C#
 */

class Person {
  //String _name = "";
  //int _age = 0;

  String _name;
  int _age;
  String _desc;

  //이런 방식의 생성자는 Dart언어의 고유한 형태임
  Person(this._name, this._age, this._desc);

  //필드 값을 수정하는 것은 통제된 메서드에서만 하는 것이 좋음
  void addOneYear() {
    _age++;
  }

  //게터, 세터를 이용해 값을 전달하거나 수정하는 것을 통제할 수 있음!
  int get age => _age;
  String get name => _name;
  String get desc => '$_desc!!!';
  set desc(String v) => _desc = v;
}

void main() {
  var na = Person("김양군", 7, "김양군은 귀엽다");
  //na.name = '김양군';
  //na.age = 7;
  print([na.name, na.age, na.desc]);

  na.addOneYear();
  na.desc = "아니다 우주최강 귀엽다";
  //na.name = '김양양'; //외부 개입으로 이름과 나이가 강제로 바뀔 수 있는 문제점이 있음
  //na.age++; // 변수 앞에 _ 삽입하고 게터사용, 생성자 사용하여 전체 코드 수정
  print([na.name, na.age, na.desc]);
}
