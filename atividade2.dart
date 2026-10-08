import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Qtd de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  if (n < 0) {
    print('Qtd nao pode ser negativa');
    return;
  }
  if (n == 0) {
    print('S = 0.0');
    return;
  }
  if (n == 1) {
    print('S = ${pow(3, 24) / 5}');
    return;
  }

  double fatorial = 1;
  double logFatorial = 0;
  double expoente = 0;
  double soma = 0;
  int sinal = 1;

  for (int i = 1; i <= n; i++) {
    for (int j = (i - 1) * 4 + 1; j <= i * 4; j++) {
      fatorial *= j;
      logFatorial += log(j);
    }

    sinal = i <= 3 || i.isOdd ? 1 : -1;
    double base = (2 * i + 1).toDouble();

    if (!fatorial.isFinite) {
      expoente = (logFatorial + log(log(base) / ln10)) / ln10;
      continue;
    }

    double atual = fatorial * log(base) / ln10 - log(5 * i) / ln10;
    if (i == 1) {
      expoente = atual;
      soma = sinal.toDouble();
    } else {
      soma = soma * pow(10, expoente - atual) + sinal;
      expoente = atual;
    }
  }

  String menos = sinal < 0 ? '-' : '';
  if (!fatorial.isFinite) {
    print('S ≈ ${menos}10^(10^(${expoente.toStringAsFixed(6)}))');
  } else if (expoente >= 1e12) {
    print('S ≈ ${menos}10^(${expoente.toStringAsExponential(10)})');
  } else {
    int inteiro = expoente.floor();
    double mantissa = soma * pow(10, expoente - inteiro);
    print('S ≈ ${mantissa.toStringAsFixed(6)} × 10^$inteiro');
  }
}
