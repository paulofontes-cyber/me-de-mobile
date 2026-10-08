import 'dart:io';

List<int> somarVetores(List<int> a, List<int> b) {
  var soma = <int>[];
  for (int i = 0; i < a.length; i++) {
    soma.add(a[i] + b[i]);
  }
  return soma;
}

int somarElementos(List<int> vetor) {
  int total = 0;
  for (int i = 0; i < vetor.length; i++) {
    total += vetor[i];
  }
  return total;
}

void main() {
  stdout.write('Tamanho dos vetores: ');
  int n = int.parse(stdin.readLineSync()!);

  var a = <int>[];
  var b = <int>[];
  for (int i = 0; i < n; i++) {
    stdout.write('A[$i]: ');
    a.add(int.parse(stdin.readLineSync()!));
  }
  for (int i = 0; i < n; i++) {
    stdout.write('B[$i]: ');
    b.add(int.parse(stdin.readLineSync()!));
  }

  var c = somarVetores(a, b);
  print('Vetor soma: $c');
  print('Soma dos elementos: ${somarElementos(c)}');
}
