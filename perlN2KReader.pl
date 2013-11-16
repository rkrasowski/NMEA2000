#!/usr/bin/perl 
use strict;
use warnings;


open(PS,"./actisense-serial -r /dev/ttyO2 | ./analyzer |") || die "Failed: $!\n";
while ( <PS> )

	{

		print "$_";

	}

close(PS);



