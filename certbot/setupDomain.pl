#!/usr/bin/perl -w
use strict;
use warnings;

my $domains = $ENV{'domains'};
my $email = $ENV{'email'};
chomp($domains);
my @split;

&splitDomain($domains);
&editConfig();


sub splitDomain {
	chomp(@_);
		for my $arg(@_){
			 @split = split(',', $arg);
		}
}


sub editConfig {
	for my $dom (@split){
	`mkdir -p /var/www/$dom`;
	`cp /config/nginxtemplate.conf /etc/nginx/sites/$dom.conf`;
	`sed -i "s|URL|$dom|g" /etc/nginx/sites/$dom.conf`;
	`sed -i "s|FOLDER|$split[0]|g" /etc/nginx/sites/$dom.conf`;
	}
	print "will add domains: $domains";
        print "email: $email";
	`sed -i "s|URL|$domains|g" /config/letsencrypt.conf`;
	`sed -i "s|EMAIL|$email|g" /config/letsencrypt.conf`;

}
