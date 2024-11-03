int calculateMaxDistance(int timeInMs, int recordDistance) {
  var output = 0;
  for (var acceleration = 0; acceleration < timeInMs; acceleration++) {
    var timeLeft = timeInMs - acceleration;
    var distance = acceleration * timeLeft;

    if (distance > recordDistance) {
      output++;
    }
  }

  return output;
}

// Time:      7  15   30
// Distance:  9  40  200

// Time:        63     78     94     68
// Distance:   411   1274   2047   1035

void main() {
  var result = 0;
  // var data = [[7, 9], [15, 40], [30, 200]];
  // var data = [[71530, 940200]];
  // var data = [[63, 411], [78, 1274], [94, 2047], [68, 1035]];
  var data = [[63789468, 411127420471035]];

  for (var [time, distance] in data) {
    var timesBeat = calculateMaxDistance(time, distance);
    print(timesBeat);
    if (result == 0) {
      result = timesBeat;
    } else {
      result *= timesBeat;
    }
  }
  print(result);
}