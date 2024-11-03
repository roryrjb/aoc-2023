const fs = require("fs");
const lines = fs.readFileSync("input.txt", "utf8").split("\n");
let total = 0;

function* getAsterisksFromLine(line) {
  let x = 0;
  for (let x = 0; x < line.length; x++) {
    let ch = line[x];

    if (ch == "*") {
      yield x;
    }
  }
}

function* getNumbersFromLine(line) {
  let x = 0;
  let accumulator = "";
  for (let x = 0; x < line.length; x++) {
    let ch = line[x];

    if (ch >= "0" && ch <= "9") {
      accumulator += ch;
    } else {
      if (accumulator) {
        yield [accumulator, x - accumulator.length];
        accumulator = "";
      }
    }
  }
}

const asteriskPositions = [];
const numberPositions = [];

for (let y = 0; y < lines.length; y++) {
  let thisLine = lines[y];

  for (const x of getAsterisksFromLine(thisLine)) {
    asteriskPositions.push({ x, y });
  }

  for (const [match, x] of getNumbersFromLine(thisLine)) {
    numberPositions.push({ match, x, y });
  }
}

function intersects(match, x1, y1, x2, y2) {
  const xLowest = x2 - 1;
  const xHighest = x2 + match.length;
  const xMatch = x1 <= xHighest && x1 >= xLowest;
  const yMatch = Math.abs(y1 - y2) <= 1;
  return xMatch && yMatch;
}

const intersectionsByAsteriskCoord = {};

for (const { x: sx, y: sy } of asteriskPositions) {
  for (const { match, x: nx, y: ny } of numberPositions) {
    if (intersects(match, sx, sy, nx, ny)) {
      intersectionsByAsteriskCoord[`${sx},${sy}`] =
        intersectionsByAsteriskCoord[`${sx},${sy}`] || [];
      intersectionsByAsteriskCoord[`${sx},${sy}`].push(match);
    }
  }
}

for (const key in intersectionsByAsteriskCoord) {
  const values = intersectionsByAsteriskCoord[key];
  if (values.length === 2) {
    const subtotal = parseInt(values[0]) * parseInt(values[1]);
    total += subtotal;
  }
}

console.log("part2", total);
