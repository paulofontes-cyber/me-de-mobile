import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Qtd de termos: ');
  int n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('Qtd nao pode ser negativa');
    return;
  }

  stdout.write('Valor de X: ');
  double x = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
  if (!x.isFinite) {
    print('Valor de X invalido');
    return;
  }

  double soma = 0;
  int num = 1;
  int passo = 1;

  for (int i = 0; i < n; i++) {
    int fatorial = 1;
    for (int j = 1; j <= num; j++) {
      fatorial *= j;
    }

    soma += pow(x, i + 2) / fatorial;
    num += passo;
    if (num == 4 || num == 1) {
      passo = -passo;
    }
  }

  print('S = $soma');
}
