package Data::Sah::Filter::perl::Business::ID::SIM::check_sim_num;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        summary => 'Check that string is a valid SIM (Indonesian drive license) number',
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{modules}{"Business::ID::SIM"} //= 0;

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; my \$res = Business::ID::SIM::parse_sim(sim => \$tmp); \$res->[0] == 200 ? [undef,\$tmp] : [\$res->[1], \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

=cut
