void main() {
  // 날짜 입력 
  var input = '2025-03-22';

  // DateTime으로 변환
  var date = DateTime.parse(input);

  // 요일 리스트 (월요일부터 시작)
  var days = ['월', '화', '수', '목', '금', '토', '일'];

  // 입력한 날짜의 요일 출력
  print(days[date.weekday - 1]); // DateTime의 요일은 1(월)~7(일)이라 -1 해줌
}
