#!/usr/bin/perl -w
use strict;
use warnings;

#windows setting
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

use LWP::Simple;

#my $id = shift @ARGV || '074';

my $url = "http://www.yahoo.co.jp";

my $content = get($url);
die "$url を読み込めませんでした。" unless defined $content;

#$content = decode('utf-8', $content);
$content =~ s/<!--(.*?)-->//gs;
$content =~ / SELECTED>▼([^<]+)</;
print "$content\n";
#if($content =~ /現在、危険情報はでておりませんが、/){
#  print "危険情報は出ておりません\n";
#}else{
#  print "危険情報が出ています！\n";
#}
print "詳細はhttp://www.anzen.mofa.go.jpを見てください\n";
