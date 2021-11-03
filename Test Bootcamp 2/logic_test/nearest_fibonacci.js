fib = function (numMax) {
  for (var fibArray = [], i = 0, j = 1, k = 0; k < numMax; i = j, j = x, k++) {
    x = i + j;
    fibArray.push(x);
  }
  console.log(fibArray);
};

fib(4);
