#!/usr/bin/env perl
use strict; use warnings;

my %parent = (); #stores parent taxon ID
my $lc = 0; #line count
open FH, $ARGV[0] or die; ##PATRIC lineage file

open OUT, ">PATRIC_nodes.txt" or die;
print OUT "131567\t1\n"; #adds a root taxon id to the PATRIC nodes (similar to the NCBI format)

while(<FH>) { #read file line-by-line
	chomp($_); #remove whitespace
	my @line = split "\t", $_; #split line by tab delimiter

	if(defined $line[10] && index($line[10], ";") != -1) { #check if non-empty string
		my @lineage = split /\;/, $line[10]; #split lieage column by semicolon

		for(my $i = $#lineage; $i > 0; $i--) { #read lineages backward (from child to parent)
			if(!defined $parent{$lineage[$i]}) { #check if parent for current taxon id exists
				print OUT "$lineage[$i]\t$lineage[$i - 1]\n"; #print current taxon and parent taxon id
				$parent{$lineage[$i]} = $lineage[$i - 1]; #store info in memory
			}

			else { 
				if($lineage[$i - 1] != $parent{$lineage[$i]}) { #check if parent id in current line is the same as the one stored in hash
					print "Error at line $lc: $_\nParental taxon for $lineage[$i] ($lineage[$i - 1]) is different from the one stored in hash: $parent{$lineage[$i]}\nExiting\n";
					exit;
				}
			}
		}
	}
}

close(FH);
close(OUT);
