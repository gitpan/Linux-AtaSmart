#!perl

use strict;
use warnings;

use Test::More;
use English qw(-no_match_vars);

eval "use Test::Perl::Critic";
plan skip_all => 'Test::Perl::Critic required to criticise code' if $@;
Test::Perl::Critic->import(-profile => "xt/perlcriticrc")
  if -e "xt/perlcriticrc";
all_critic_ok();
