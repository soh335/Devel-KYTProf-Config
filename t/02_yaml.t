use strict;
use warnings;

use Test::More;
use Devel::KYTProf::Config;
use Devel::KYTProf;

ok +Devel::KYTProf->_orig_code->{"Data::Dumper"}->{"Dumper"}, "adding profile by specific method ";
ok +Devel::KYTProf->_orig_code->{"Pod::Usage"}->{"pod2usage"}, "adding profile by all methods";

done_testing;
