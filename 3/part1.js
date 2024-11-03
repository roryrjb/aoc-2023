const fs = require("fs");
const lines = fs.readFileSync("input.txt", "utf8").split("\n");

function* getMatchesFromLine(line) {
  let i = 0;
  let accumulator = "";
  for (let i = 0; i < line.length; i++) {
    let ch = line[i];

    if (ch >= "0" && ch <= "9") {
      accumulator += ch;
    } else {
      yield [accumulator, i - accumulator.length];
      accumulator = "";
    }
  }
}

function isSymbol(ch) {
  switch (ch) {
    case "*":
    case "+":
    case "#":
    case "$":
    case "=":
    case "/":
    case "@":
    case "%":
    case "&":
    case "-":
      return true;
  }

  return false;
}

let total = 0;

for (let i = 0; i < lines.length; i++) {
  let thisLine = lines[i];
  let prevLine;
  let nextLine;
  if (i > 0) prevLine = lines[i - 1];
  if (i !== lines.length - 1) nextLine = lines[i + 1];

  for (const [match, index] of getMatchesFromLine(thisLine)) {
    if (!match) continue;
    let m = false;

    if (prevLine) {
      for (let k = index - 1; k < index + match.length + 1; k++) {
        if (isSymbol(prevLine[k])) {
          m = true;
          break;
        }
      }
    }

    if (!m && nextLine) {
      for (let k = index - 1; k < index + match.length + 1; k++) {
        if (isSymbol(nextLine[k])) {
          m = true;
          break;
        }
      }
    }

    if (!m) {
      if (isSymbol(thisLine[index + match.length])) {
        m = true;
      }

      if (isSymbol(thisLine[index - 1])) {
        m = true;
      }
    }

    if (m) {
      total += parseInt(match, 10);
    }
  }
}

console.log("part1", total);
