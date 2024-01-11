package Sah::Schema::business::id::sim::num;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Indonesian driving license number (nomor SIM)',
    prefilters => ['Str::remove_nondigit', 'Business::ID::SIM::check_sim_num'],
    description => <<'MARKDOWN',

MARKDOWN
    examples => [
        {value=>'', valid=>0, summary=>'Empty string'},
        {value=>'123', valid=>0, summary=>'Too short'},
        {value=>'000515540181', valid=>1},
        {value=>'0005.1554.0181', valid=>1, summary=>'Non-digits removed', validated_value=>'000515540181'},
    ],
}];

1;

# ABSTRACT:
