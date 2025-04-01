void main() {
  var n = 10; // 사각형 크기 (10x10)

  print("\n1. 꽉 찬 사각형");
  print(drawFilledRectangle(n));

  print("\n2. 테두리 사각형");
  print(drawBorderRectangle(n));

  print("\n3. / 대각선 사각형");
  print(drawDiagonalSlash(n));

  print("\n4. \\ 대각선 사각형");
  print(drawBackslash(n));

  print("\n5. X 표시 사각형");
  print(drawXRectangle(n));
}

// 1. 꽉 찬 사각형 (모든 칸에 '=' 출력)
String drawFilledRectangle(int n) {
  var re = "";
  for (var y = 0; y < n; y++) {
    re += "=" * n + "\n"; // 한 줄에 '='을 n개 출력 후 줄 바꿈
  }
  return re;
}

// 2. 테두리 사각형 (가장자리에만 '=' 출력)
String drawBorderRectangle(int n) {
  var re = "";
  for (var y = 0; y < n; y++) {
    for (var x = 0; x < n; x++) {
      // 첫 행(y == 0), 마지막 행(y == n-1), 첫 열(x == 0), 마지막 열(x == n-1)인 경우 '=' 출력
      re += (y == 0 || y == n - 1 || x == 0 || x == n - 1) ? "=" : " ";
    }
    re += "\n"; // 한 줄이 끝나면 줄 바꿈
  }
  return re;
}

// 3. / 대각선 사각형 (오른쪽 위 → 왼쪽 아래 방향)
String drawDiagonalSlash(int n) {
  var re = "";
  for (var y = 0; y < n; y++) {
    for (var x = 0; x < n; x++) {
      // x + y == n - 1 인 경우 '/' 출력 (우상단 > 좌하단)
      re += (x == n - y - 1) ? "/" : " ";
    }
    re += "\n";
  }
  return re;
}

// 4. \ 대각선 사각형 (왼쪽 위 → 오른쪽 아래 방향)
String drawBackslash(int n) {
  var re = "";
  for (var y = 0; y < n; y++) {
    for (var x = 0; x < n; x++) {
      // x == y 인 경우 '\' 출력 (좌상단 > 우하단)
      re += (x == y) ? "\\" : " ";
    }
    re += "\n";
  }
  return re;
}

// 5. X 표시 사각형 (두 개의 대각선을 조합)
String drawXRectangle(int n) {
  var re = "";
  for (var y = 0; y < n; y++) {
    for (var x = 0; x < n; x++) {
      // 두 대각선이 겹치는 경우 '*' 출력
      re += (x == y || x == n - y - 1) ? "*" : " ";
    }
    re += "\n";
  }
  return re;
}
