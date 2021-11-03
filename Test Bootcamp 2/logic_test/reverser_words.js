function wordsReverser(string) {
  return string.split("").reverse().join("").split(" ").reverse().join(" ");
}

console.log(wordsReverser("I am A Great human"));