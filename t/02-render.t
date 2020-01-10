use v6.c;
use Test;

use Array::Shaped::Console;

my @array[2;2] = (-1,1;1,-1);

is printed(@array), "□▧\n▧□\n", "Prints normal square";
is printed(@array, @dashes), "–―\n―–\n", "Prints alternative array";

@array = (-1,Inf;Inf,-1);
is printed( @array ), "□■\n■□\n", "Prints with infinity";

@array Z= 1..4;
is printed( @array, @lines ), "⎽⎼\n⎻⎺\n", "Prints with dashes";


my @thirds[3;3] Z= 1..9;
is printed(@thirds), "□▢▣\n▤▥▦\n▧▨▩\n", "Spans range";


done-testing;
