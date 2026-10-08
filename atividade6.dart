import 'dart:io';
import 'dart:math';

void main() {
  int numero = Random().nextInt(100) + 1;
  int menor = 0;
  int maior = 101;

  print('Acerte o num de 1 a 100');

  while (true) {
    stdout.write('Palpite: ');
    int? palpite = int.tryParse(stdin.readLineSync()!.trim());

    if (palpite == null || palpite <= menor || palpite >= maior) {
      print('Digite um num inteiro de ${menor + 1} a ${maior - 1}');
      continue;
    }

    if (palpite == numero) {
      print('Vc acertou! Era $numero');
      break;
    }

    if (palpite < numero) {
      menor = palpite;
    } else {
      maior = palpite;
    }

    print('O num ta entre $menor e $maior (sem contar os limites)');
  }
}
