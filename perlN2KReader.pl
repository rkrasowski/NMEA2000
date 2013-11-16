#!/usr/bin/perl 
use strict;
use warnings;


open(PS,"./linux-arm-gnuaebi/actisense-serial -r /dev/ttyO2 | ./linux-arm-gnuaebi/analyzer |") || die "Failed: $!\n";
while ( <PS> )

	{

		print "$_";

	}

close(PS);



