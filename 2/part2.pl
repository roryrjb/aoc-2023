use strict;
use warnings;

open(my $fh, "input.txt");

my $total = 0;

while (<$fh>) {
	my ($num, $game) = $_ =~ m/Game (\d+):\s(.*)/;
	my %colour_counter = ("red" => 0, "green" => 0, "blue" => 0);

	foreach (split(";", $game)) {
		foreach (split(",", $_)) {
			my ($count, $colour) = $_ =~ m/(\d+)\s(.*)/;

			if ($count > $colour_counter{$colour}) {
				$colour_counter{$colour} = $count;
			}
		}
	}

	my $power = 0;

	foreach (keys %colour_counter) {
		my $val = $colour_counter{$_};

		if ($val > 0) {
			if ($power == 0) {
				$power = $val;
			} else {
				$power *= $val;
			}
		}
	}

	$total += $power;
}

print "$total\n";
