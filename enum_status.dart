/*
 * 열거타입
 */

// login, logout은 보통 0,1 로 사용함
// 그러나 열거형으로 사용하는 이유는? 가독성을 위해서.
enum Status { login, logout }  

void main() {
  var authStatus = Status.logout;
  print(authStatus);

  switch (authStatus) {
    case Status.login:
      print('로그인');
      break;
    case Status.logout:
      print('로그아웃');
      break;
  }
}
