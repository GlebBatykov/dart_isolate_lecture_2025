int fibonacci(int number) {
  if (number == 0 || number == 1) {
    return 0;
  }

  if (number == 2) {
    return 1;
  }

  return fibonacci(number - 1) + fibonacci(number - 2);
}
