void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('List Original $numbers');
  print('List Original ${numbers.length}');
  print('index 0: ${numbers[0]}');
  print('reversed : ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;
  print('Iterable : ${reversedNumbers}');
  print('List : ${reversedNumbers.toList()}');
  print('Set : ${reversedNumbers.toSet()}');
  
  final numbersGreaterThan5= numbers.where((num){
    return num>5;
  });
  print('mayor a 5 : ${numbersGreaterThan5.toSet()}');
  
}
