void main() {
  print(GreetPerson(name: 'Juan'));
  print(GreetPerson(name: 'Juan', message: 'Bienvenido,'));
}

String GreetPerson({required String name, String message = 'Hola,'}) {
  return '$message $name';
}
