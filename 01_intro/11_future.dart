void main() {
  print('Inicio del programa');

  httpGet('daril')
      .then((value) {
        print(value);
      })
      .catchError((err) {
        print('Error: $err');
      });
  print('fin del programa');
}

Future<String> httpGet(String url) {
  return Future.delayed(const Duration(seconds: 1), () {
    throw 'error en la petición http';
    //  return 'Respuesta de peticion http';
  });
}
