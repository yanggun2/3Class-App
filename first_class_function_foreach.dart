/*
 * for 문과 forEach() 함수
 * 일급객체?
 */

void func_a() {
  print('왼쪽!');
}

void func_b() {
  print('오른쪽!');
}

void main() {
  func_a();
  func_b();

  var fun = func_a;
  fun();

  fun = func_b;
  fun();
  
  var list = [1, 2, 3, 4, 5];
  //list.forEach();
}

/*
void main() {
  var lottoNums = [5, 6, 11, 13, 17, 21];
  //일반 for문
  /*
   for (var num in lottoNums) {
    print(num);
  }
  */
  //forEach문 (익명함수)
  lottoNums.forEach((num) {
    print(num);
  });
}
*/
