use v6.c;

unit module Array::Shaped::Console:ver<0.0.1>;


constant @grayscale is export= chr(0x25A1)..chr(0x25A9);
constant $inf-char is export = chr(0x25A0);

sub printed( @array where @array.shape.elems == 2, @symbols = @grayscale, $non-symbol = $inf-char  ) is export returns Str {
    my @shape = @array.shape;
    my $min = @array.min;
    my $max = @array.max;
    my $convert = { ($_ - $min) * @grayscale.elems / (1 + $max - $min ) };
    my $render;
    for ^@shape[0] -> $i {
        for ^@shape[1] -> $j {
	    if ( @array[$i;$j] ≠ ∞ ) {
		$render ~= @symbols[$convert(@array[$i;$j])];
	    } else {
		$render ~= $non-symbol;
	    }
        }
        $render ~= "\n";
    }
    return $render;
}

=begin pod

=head1 NAME

Array::Shaped::Console - Renders 2d arrays to a console using block symbols

=head1 SYNOPSIS

=begin code :lang<perl6>

use Array::Shaped::Console;

my @array[2;2] = (-1,1;1,-1);
# Prints "□▧\n▧□\n"  using default "grayscale" console symbols array
printed(@array).say;

# Prints "□■\n■□\n" with infinity having a special default symbol.
@array = (-1,Inf;Inf,-1);
say printed( @array );


=end code

=head1 DESCRIPTION

Array::Shaped::Console includes functions and ranges to easily render numeric 2d arrays to the console, using the same shape of the array, and adapting the array range to the number of symbols that are also handled in the function.

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2020 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
