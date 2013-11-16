#!/usr/bin/perl 
use strict;
use warnings;

my $ACTISENSE;
open($ACTISENSE,"./linux-arm-gnuaebi/actisense-serial -r /dev/ttyO2 | ./linux-arm-gnuaebi/analyzer -json|") || die "Failed: $!\n";


#readingAll();


##while (<$ACTISENSE>)
	#	{
		##	heading($_);
	#	}
#exit();






while ( <$ACTISENSE> )

	{
		
		 my $pos = position($_);
                        if ($pos)
                                {
                                        print "Pos is $pos\n";
                                }


		my $head = heading($_);
			if ($head)
				{
					print "Heading is: $head\n";
				}


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
	}

close($ACTISENSE);


###################################################################################################

#{"timestamp":"2013-11-16-18:42:32.704","prio":"2","src":"128","dst":"255","pgn":"127250","description":"Vessel Heading","fields":{"SID":"0","Heading":"146.7","Variation":"-8.3","Reference":"Magnetic"}}
sub heading 
	{
		my $data = shift;
                if ($data =~ m/pgn\":\"127250/)
			{
				my @splitHead = split(/:{\"/,$data);
				my $splitHead;
				my @finalHead = split(/\"/,$splitHead[1]);
				my $finalHead;
				return $finalHead[6];
			}

	}







#{"timestamp":"2013-11-16-18:08:56.095","prio":"2","src":"127","dst":"255","pgn":"129025","description":"Position, Rapid Update","fields":{"Latitude":"35.7265558","Longitude":"-79.8284838"}}

sub position 
	{
		my $data = shift;
                if ($data =~ m/pgn\":\"129025/)
                        {
				my @splitPos = split(/:{\"/,$data);
				my $splitPos;
				my @splitPosComa = split (/,/,$splitPos[1]);
				my $splitPosComa;
				my @latSplit = split(/\"/,$splitPosComa[0]);
				my $latSplit;
				my @lonSplit = split(/\"/,$splitPosComa[1]);
				my $lonSplit;
				return $latSplit[2].",".$lonSplit[3];
			}


	}




sub readingAll
	{
		while ( <$ACTISENSE> )
			{
				print $_;
			}

	}





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






