use v6.c;
use Test;

use Array::Shaped::Console;

my @array[2;2] = (-1,1;1,-1);

is printed(@array), "□▧\n▧□\n", "Prints normal square";
is printed(@array, @dashes), "–―\n―–\n", "Prints alternative array";

@array = (-1,Inf;Inf,-1);
is printed( @array ), "□■\n■□\n", "Prints with infinity";

@array = (-1,-Inf;-Inf,-1);
is printed( @array ), "□■\n■□\n", "Prints with minus infinity";

@array Z= 1..4;
is printed( @array, @lines ), "⎽⎼\n⎻⎺\n", "Prints with dashes";


my @thirds[3;3] Z= 1..9;
is printed(@thirds), "□▢▣\n▤▥▦\n▧▨▩\n", "Spans range";

my @rows-four[4;2] Z= 1..8;
is printed(@rows-four, @left), "▏▎\n▍▌\n▋▊\n▉█\n", "Non-square stuff";

my @seq-row[1;3] = [1..3,];
is printed(@seq-row,@squares), "▪◾◼\n", "Squares";

my @ya-seq-row[1;4] = [1..4,];
is printed(@ya-seq-row,@circles), "◌○◍●\n", "Circles";


done-testing;
