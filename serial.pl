#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort;


my $PORT = "/dev/ttyO1"; 
my $serialData;

my $ob = Device::SerialPort->new($PORT) || die "Can't Open $PORT: $!";

$ob->baudrate(9600) || die "failed setting baudrate";
$ob->parity("none") || die "failed setting parity";
$ob->databits(8) || die "failed setting databits";
#$ob->stty_icrnl(1) || die "failed setting convert cr to new line";
$ob->handshake("none") || die "failed setting handshake";

$ob->write_settings || die "no settings";

$| = 1;

open( DEV, "<$PORT" ) || die "Cannot open $PORT: $_";



while (1)
	{
		$ob->write("Testing serial connection\n");
		sleep(1);
	}





while ( $serialData = <DEV> ) 
	{ 
	
		print "Rx: $_\n";	
	
	}										



 undef $ob;

