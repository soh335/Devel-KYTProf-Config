on test => sub {
    requires 'Test::More', 0.98;
};

on configure => sub {
    requires 'YAML';
    requires 'Devel::KYTProf';
};

on 'develop' => sub {
};

