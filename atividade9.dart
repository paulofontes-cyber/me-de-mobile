void main() {
  for (int n = 1000; n <= 9999; n++) {
    int a = n ~/ 100;
    int b = n % 100;
    int soma = a + b;

    if (soma * soma == n) {
      print(n);
    }
  }
}
