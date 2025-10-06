void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('daril');
    print('Éxito: $value');
  } on Exception catch (err) {
    print('Tenemos una Exception : $err');
  } catch (err) {
    print('OPP!! algo terrible pasó: $err');
  } finally {
    print('Fin de try y catch');
  }

  print('fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('No hay parámetros en el Url');
  // throw 'Error en la petición';
  //return 'Tenemos un valor de la petición';
}
