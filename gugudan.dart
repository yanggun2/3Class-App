/*
 * 이 프로그램은 구구단을 출력합니다.
 */

void main() {
  for (int i = 2; i <= 9; i++) {
    printDan(i); //단을 출력한다
    print(''); //단끼리 구분
  }
}

///  <title>
///   내용@@
///  </itle>
///  <description>
///   내용@@@@@@@@
///  </description>

void printDan(int dan) {
  for (int j = 1; j <= 9; j++) {
    print('$dan * $j = ${dan * j}');
  }
}
