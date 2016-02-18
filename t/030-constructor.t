#!perl6

use v6;

use Test;

use Audio::Playlist::JSPF;

my $pl;

lives-ok { $pl = Audio::Playlist::JSPF.new(title => "foo") }, "create a new playlist object";
isa-ok $pl, Audio::Playlist::JSPF, "and as expected";
isa-ok $pl.playlist, Audio::Playlist::JSPF::Playlist, "and we populated the playlist";

lives-ok { $pl.track.append: Audio::Playlist::JSPF::Track.new(title => "foo", creator => "Me") }, "add a track";
is $pl.track.elems, 1, "should have one track";

say $pl.to-json;


done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
