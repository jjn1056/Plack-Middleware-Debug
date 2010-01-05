package Plack::Middleware::Debug::Session;
use 5.008;
use strict;
use warnings;
use parent qw(Plack::Middleware::Debug::Base);

sub run {
    my ($self, $env, $panel) = @_;

    return sub {
        my $res = shift;

        my $session = $env->{'plack.session'};
        my $dump = {};
        if ($session) {
            $dump = $session->store->dump_session($session->id);
            $dump->{'Session ID'} = $session->id;
        }

        $panel->content($self->render_hash($dump));
    };
}

1;

__END__

=head1 NAME

=head1 AUTHOR

Masahiro Chiba

=head1 SEE ALSO

L<Plack::Middleware::Session>

=cut
