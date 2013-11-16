#!/usr/bin/perl 
use strict;
use warnings;


open(PS,"./linux-arm-gnuaebi/actisense-serial -r /dev/ttyO2 | ./linux-arm-gnuaebi/analyzer -json|") || die "Failed: $!\n";
while ( <PS> )

	{
		my $time = systemTime($_);
		if ($time)
			{
				print "Time is: $time\n";
			}
			
				
		

		my $date = systemDate($_);
		if ($date)
			{		
				print "Date is :$date\n";
			}
		#if ($_ =~ m/COG/)
		#	{
	#			print "$_";
		#	}
	}

close(PS);

###################################################################################################


sub systemTime 
	{
		my $data = shift;
		if ($data =~ m/pgn\":\"126992/)
			{

				my @splitData = split (/,/,$data);
				foreach(@splitData)
					{
						if ($_ =~ m/\"Time/g)
							{
								my @timeSplit = split(/\"/,$_);
								my $timeSplit;
								my @finalSplit = split(/\./,$timeSplit[3]);
                                                                my $finalSplit;
                                                                return $finalSplit[0];

							}

					}


			}
	}

sub systemDate 
	{


	        my $data = shift;
                if ($data =~ m/pgn\":\"126992/)
                        {

                                my @splitData = split (/,/,$data);
                                foreach(@splitData)
                                        {

                                                if ($_ =~m/\"Date/g)
                                                        {
							        my @dateSplit = split(/\"/,$_);
                                                                my $dateSplit;
								return $dateSplit[3];
                                                        }
                                        }


                        }
        }






