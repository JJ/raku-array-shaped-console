NAME [![Test-install distro](https://github.com/JJ/raku-array-shaped-console/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-array-shaped-console/actions/workflows/test.yaml)
====

Array::Shaped::Console - Renders 2d arrays to a console using block symbols

SYNOPSIS
========

```raku
use Array::Shaped::Console;

my @array[2;2] = (-1,1;1,-1);
# Prints "□▧\n▧□\n"  using default "grayscale" console symbols array
printed(@array).say;

# Prints "□■\n■□\n" with infinity having a special default symbol.
@array = (-1,Inf;Inf,-1);
say printed( @array );
```

DESCRIPTION
===========

Array::Shaped::Console includes functions and ranges to easily render
numeric 2d arrays to the console, using the same shape of the array,
and adapting the array range to the number of symbols that are also
handled in the function.

These symbol sets, as well as the "infinity" symbol, are predefined;

    @grayscale = chr(0x25A1)..chr(0x25A9);
	@dashes = '–'..'―';
	@lines = '⎽'...'⎺';
	@shades = '░'..'▓';
	@lower = '▁'..'█';
	@left = '▏'...'█';
	@squares = <▪ ◾ ◼>;
	@circles = <◌ ○ ◍ ●>;
	@chars = ".:-=+*#%@".comb;
	$inf-char = chr(0x25A0);

@grayscale is used by default.

method printed( @array, @shapes = @grayscale, $non-symbol = $inf-char)
----------------------------------------------------------------------

Returns a string that collates, using the array shape, in a single string that separates rows by a carriage return.

AUTHOR
======

JJ Merelo <jjmerelo@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2020-2022 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

