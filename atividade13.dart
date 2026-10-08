import 'dart:io';

void main() {
  stdout.write('Quantos numeros: ');
  int n = int.parse(stdin.readLineSync()!);

  var numeros = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Numero: ');
    numeros.add(int.parse(stdin.readLineSync()!));
  }

  var jaContou = [];
  for (int i = 0; i < n; i++) {
    if (!jaContou.contains(numeros[i])) {
      int vezes = 0;
      for (int j = 0; j < n; j++) {
        if (numeros[j] == numeros[i]) {
          vezes++;
        }
      }
      print('${numeros[i]} -> $vezes');
      jaContou.add(numeros[i]);
    }
  }
}
