# NAME

Devel::KYTProf::Config - use Devel::KYTProf and add profile by yaml config file.

# SYNOPSIS

    perl -MDevel::KYTProf::Config ...

# DESCRIPTION

Devel::KYTProf::Config is adding [Devel::KYTProf](http://search.cpan.org/perldoc?Devel::KYTProf) profile by yaml config file.

When Devel::KYTProf::Config is imported, start to search .kytprof.yaml.
If you want to add specific module method to [Devel::KYTProf](http://search.cpan.org/perldoc?Devel::KYTProf) profile, write to
.kytprof.yaml like this.

    ---
    "Text::Xslate"
        - render

Also you can add all methods of module to profile like this.

    ---
    "Text::Xslate" : ":all"

# SEE ALSO

[Devel::KYTProf](http://search.cpan.org/perldoc?Devel::KYTProf)

# LICENSE

Copyright (C) soh335

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

soh335 <sugarbabe335@gmail.com>
