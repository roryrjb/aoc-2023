<?php

/* example

32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483

ranking:

7. Five of a kind, where all five cards have the same label: AAAAA
6. Four of a kind, where four cards have the same label and one card has a different label: AA8AA
5. Full house, where three cards have the same label, and the remaining two cards share a different label: 23332
4. Three of a kind, where three cards have the same label, and the remaining two cards are each different from any other card in the hand: TTT98
3. Two pair, where two cards share one label, two other cards share a second label, and the remaining card has a third label: 23432
2. One pair, where two cards share one label, and the other three cards have a different label from the pair and each other: A23A4
1. High card, where all cards' labels are distinct: 23456

*/

// read file
$lines = file('input.txt');

// loop through lines
foreach ($lines as $line) {
  $parts = explode(' ', $line);
  $cards = $parts[0];
  $score = $parts[1];

  // check for five of a kind
  uniqueCards = array_unique(str_split($cards));

  if (count($uniqueCards) == 1) {
    echo 'Five of a kind';
  }

if (count($uniqueCards) == 2) {
  $cardCounts = array_count_values(str_split($cards));
  if (in_array(4, $cardCounts)) {
    echo 'Four of a kind';
  } else {
    echo 'Full house';
  }
}



?>