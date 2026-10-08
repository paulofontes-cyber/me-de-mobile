import 'dart:io';

void main() {
  var v1 = [];
  var v2 = [];
  var v3 = [];
  var v4 = [];

  stdout.write('Tamanho do vetor 1: ');
  int n1 = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n1; i++) {
    stdout.write('v1[$i]: ');
    v1.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('Tamanho do vetor 2: ');
  int n2 = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n2; i++) {
    stdout.write('v2[$i]: ');
    v2.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('Tamanho do vetor 3: ');
  int n3 = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n3; i++) {
    stdout.write('v3[$i]: ');
    v3.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('Tamanho do vetor 4: ');
  int n4 = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n4; i++) {
    stdout.write('v4[$i]: ');
    v4.add(int.parse(stdin.readLineSync()!));
  }

  var v5 = [];
  v5.addAll(v1);
  v5.addAll(v2);
  v5.addAll(v3);
  v5.addAll(v4);

  for (int i = 0; i < v5.length; i++) {
    for (int j = 0; j < v5.length - 1; j++) {
      if (v5[j] > v5[j + 1]) {
        int aux = v5[j];
        v5[j] = v5[j + 1];
        v5[j + 1] = aux;
      }
    }
  }

  var intersecao = [];
  for (int i = 0; i < v1.length; i++) {
    if (v2.contains(v1[i]) && v3.contains(v1[i]) && v4.contains(v1[i])) {
      if (!intersecao.contains(v1[i])) {
        intersecao.add(v1[i]);
      }
    }
  }

  print('a) Vetor 5 ordenado: $v5');
  print('b) Intersecao: $intersecao');
}
