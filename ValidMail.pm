#!usr/bin/perl  
package ValidMail;
use 5.010; 
use strict; 
use Encode; 


use base qw (Exporter);
our @ISA = qw (Exporter);
our @EXPORT = qw (&valid_mail);

sub valid_mail {
  my @domains_list = @_;
	my @sort_domains_list;
	my %count;
	my $regex = '(
		^
		[A-Za-z0-а-яА-Я\w\.\-]+
		@
		(
		[A-Za-z0-а-яА-Я\w\.\-]+
		\.+
		\w{2,})
		$
		)';

	foreach (@domains_list) {
		chomp; 
		my $domain = 'INVALID';
		my $str = decode ('utf8', $_);
		$domain = $2 if $str =~ /$regex/x;
		$count{$domain}++;
	}

	foreach (sort {$count{$b} <=> $count{$a}} keys %count ) {
		my $str = encode_utf8($_);
		push @sort_domains_list, $str."=".$count{$_};
	}
	return @sort_domains_list;
}
