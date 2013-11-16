#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort;


my $PORT = "/dev/ttyO2"; 
my $serialData;



# set pins in appropriate modes to communicate with  modem:
# Set UART 2
# Set Tx pin
`echo 1 > /sys/kernel/debug/omap_mux/spi0_d0`;
# set Rx pin
`echo 21 > /sys/kernel/debug/omap_mux/spi0_sclk`;






my $ob = Device::SerialPort->new($PORT) || die "Can't Open $PORT: $!";

$ob->baudrate(115200) || die "failed setting baudrate";
$ob->parity("none") || die "failed setting parity";
$ob->databits(8) || die "failed setting databits";
#$ob->stty_icrnl(1) || die "failed setting convert cr to new line";
$ob->handshake("none") || die "failed setting handshake";

$ob->write_settings || die "no settings";

$| = 1;

open( DEV, "<$PORT" ) || die "Cannot open $PORT: $_";


my $i = 1;
while (1)
	{
		print"Transmiting test number $i\n";
		$ob->write("Testing serial connection number $i\n");
		#select(undef,undef,undef,0.25);
		sleep(1);
		$i = $i + 1;
	}





while ( $serialData = <DEV> ) 
	{ 
	
		print "Rx: $_\n";	
	
	}										



 undef $ob;

