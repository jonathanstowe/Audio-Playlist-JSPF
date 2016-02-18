use v6.c;

use JSON::Name;
use JSON::Class;

class Audio::Playlist::JSPF:ver<0.0.1>:auth<github:jonathanstowe> does JSON::Class {

    class Attribution does JSON::Class {
        has Str $.identifier;
        has Str $.location;
    }

    class Track does JSON::Class {
        has             @.identifier;
        has Str         $.album;
        has Int         $.trackNum;
        has Str         $.title;
        has Str         $.info;
        has Str         $.annotation;
        has Str         $.image;
        has             @.location;
        has Str         $.creator;
        has Duration    $.duration      is unmarshalled-by('new') is marshalled-by('Rat');
    }

    class Playlist does JSON::Class {
        has Str         $.identifier;
        has Str         $.title;
        has Attribution @.attribution;
        has Str         $.info;
        has Str         $.annotation;
        has Str         $.image;
        has Str         $.license;
        has Str         $.creator;
        has Str         $.location;
        has Track       @.track;
        has DateTime    $.date          is unmarshalled-by('new') is marshalled-by('Str');
    }

    has Playlist $.playlist handles <identifier title attribution info annotation image license create location track date>;
}

# vim: expandtab shiftwidth=4 ft=perl6
