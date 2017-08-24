use strict; use warnings;

my $lc = 0; #line count
my $id = 1;

open FH, $ARGV[0] or die; ##PATRIC lineage file
open OUT, ">PATRIC_genomeIndex.txt" or die;

print OUT "PATRCI_id\tPATRIC_taxon\tIndex_id\tParentGenome\n";

while(<FH>) { #read file line-by-line
	if($lc > 0) {
		chomp($_); #remove whitespace
		my @line = split "\t", $_; #split line by tab delimiter

		if(defined $line[0] && defined $line[2]) {
			print OUT "$line[0]\t$line[2]\t$id\t$line[0]\n";
			$id++;
		}
	}

	$lc++;
}

close(FH);
close(OUT);

