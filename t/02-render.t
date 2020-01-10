use v6.c;
use Test;

use Array::Shaped::Console;

my @array[2;2] = (-1,1;1,-1);

is printed(@array), "□▧\n▧□\n", "Prints normal square";
@array = (-1,Inf;Inf,-1);
is printed( @array ), "□■\n■□\n", "Prints with infinity";

my @thirds[3;3] Z= 1..9;
is printed(@thirds), "□▢▣\n▤▥▦\n▧▨▩\n", "Spans range";


done-testing;
