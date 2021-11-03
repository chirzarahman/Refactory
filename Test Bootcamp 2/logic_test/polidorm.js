function _isPalindrome(str) {
  var data = str.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "");
  var ccount = 0;
  if (data === "") {
    console.log("Nothing found!");
    return false;
  }
  if (data.length % 2 === 0) {
    ccount = data.length / 2;
  } else {
    if (data.length === 1) {
      console.log("Entry is a palindrome.");
      return true;
    } else {
      ccount = (data.length - 1) / 2;
    }
  }
  for (var x = 0; x < ccount; x++) {
    if (data[x] != data.slice(-1 - x)[0]) {
      console.log(data + " # --> not palindrome");
      return false;
    }
  }
  console.log(data + " # --> palindrome");
  return true;
}
_isPalindrome("Radar");
_isPalindrome("Malam");
_isPalindrome("Kasur ini rusak");
_isPalindrome("Ibu Ratna antar ubi");
_isPalindrome("Malas");
_isPalindrome("Makan nasi goreng");
_isPalindrome("Balonku ada lima");
