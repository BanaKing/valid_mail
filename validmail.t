#!usr/bin/perl  

use Test::More tests => 2;
use ValidMail;  
use strict; 

use_ok("ValidMail");


my @chek_list = qw (INVALID=4 mail.ru=2 иванов.рф=1 rambler.ru=1 vk.com=1);
my @test_list;  


# Открытие тестового файла 
open (FILE, "<", "test_mail.txt") 
	or die "cannot open < test_mail.txt";
push @test_list , <FILE>;
close (FILE);


{
@test_list = &valid_mail (@test_list);

ok(@test_list eq @chek_list, 'valid_mail');
}

