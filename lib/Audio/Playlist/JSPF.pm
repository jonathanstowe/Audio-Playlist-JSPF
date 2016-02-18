use v6.c;

use JSON::Name;
use JSON::Class;

class Audio::Playlist::JSPF:ver<0.0.1>:auth<github:jonathanstowe> does JSON::Class {

    class Attribution does JSON::Class {
        has Str $.identifier    is rw;
        has Str $.location      is rw;
    }

    class Track does JSON::Class {
        has             @.identifier;
        has Str         $.album         is rw;
        has Int         $.track-number  is rw is json-name('trackNum') = 0;
        has Str         $.title         is rw is required;
        has Str         $.info          is rw is json-skip-null;
        has Str         $.annotation    is rw is json-skip-null;
        has Str         $.image         is rw is json-skip-null;
        has             @.location;
        has Str         $.creator       is rw is json-skip-null;
        has Duration    $.duration      is unmarshalled-by('new') is marshalled-by('Rat') is json-skip-null;
    }

    class Playlist does JSON::Class {
        has Str         $.identifier    is rw is json-skip-null;
        has Str         $.title         is rw is required;
        has Attribution @.attribution;
        has Str         $.info          is rw is json-skip-null;
        has Str         $.annotation    is rw is json-skip-null;
        has Str         $.image         is rw is json-skip-null;
        has Str         $.license       is rw is json-skip-null;
        has Str         $.creator       is rw is json-skip-null;
        has Str         $.location      is rw is json-skip-null;
        has Track       @.track;
        has DateTime    $.date          is unmarshalled-by('new') is marshalled-by('Str') = DateTime.now;
    }

    has Playlist $.playlist  handles <identifier title attribution info annotation image license create location track date>;

    multi submethod BUILD(*%args) {
        if %args<playlist>:exists {
            if %args<playlist> ~~ Playlist {
                $!playlist = %args<playlist>;
            }
            else {
                $!playlist = Playlist.new(|%args<playlist>);
            }
        }
        else {
            $!playlist = Playlist.new(|%args);
        }
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
