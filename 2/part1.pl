use strict;
use warnings;

open(my $fh, "input.txt");

my $some_value = "";

my @foo = qw/1 2 3/;
my @another_list = (@foo, 2, 3);

my $first_elem = @foo[0];

my $total = 0;
my %colour_max = ("red" => 12, "green" => 13, "blue" => 14);

while (<$fh>) {
	my ($num, $game) = $_ =~ m/Game (\d+):\s(.*)/;

	foreach (split(";", $game)) {
		foreach (split(",", $_)) {
			my ($count, $colour) = $_ =~ m/(\d+)\s(.*)/;

			if ($count > $colour_max{$colour}) {
				goto END_OF_LINE;
			}
		}
	}

	$total += $num;

	END_OF_LINE:
}

print "$total\n";
