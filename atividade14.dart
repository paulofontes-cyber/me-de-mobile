import 'dart:io';

void main() {
  print('Digite os vetores em ordem crescente');

  stdout.write('Tamanho do vetor A: ');
  int n1 = int.parse(stdin.readLineSync()!);
  var a = [];
  for (int i = 0; i < n1; i++) {
    stdout.write('A[$i]: ');
    a.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('Tamanho do vetor B: ');
  int n2 = int.parse(stdin.readLineSync()!);
  var b = [];
  for (int i = 0; i < n2; i++) {
    stdout.write('B[$i]: ');
    b.add(int.parse(stdin.readLineSync()!));
  }

  var c = [];
  int i = 0;
  int j = 0;
  while (i < n1 && j < n2) {
    if (a[i] < b[j]) {
      c.add(a[i]);
      i++;
    } else {
      c.add(b[j]);
      j++;
    }
  }
  while (i < n1) {
    c.add(a[i]);
    i++;
  }
  while (j < n2) {
    c.add(b[j]);
    j++;
  }

  print('Vetor C: $c');
}
