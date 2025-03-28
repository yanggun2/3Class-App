/*
 * 컬렉션, 맵
 */

void main() {
  //컬렉션
  var l1 = [1, 2, 3, 4, 5, 6];
  var l2 = ['가', '나', '다', '라', '마', '바'];
  print(l1);
  print(l2);

  l1.add(7);
  print(l1);
  l1.remove(2);
  print(l1);

  //맵(key value형태)
  var m1 = {'한국': '서울', '일본': '도쿄'};
  print(m1);
  print(m1['한국']);
  m1['중국'] = '북경';

  var s1 = {1, 2, 3, 3, 3, 3, 4, 5};
  print(s1);
  s1.add(6);
  print(s1);
  s1.add(6);
  print(s1);
}
