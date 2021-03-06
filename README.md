# Audio::Playlist::JSPF

JSON representation of a 'playlist'

![Build Status](https://github.com/jonathanstowe/Audio-Playlist-JSPF/workflows/CI/badge.svg)

## Synopsis

```raku

use Audio::Playlist::JSPF;

my $playlist = Audio::Playlist::JSPF.from-json($some-json);

say "Playing from { $playlist.title }";

for $playlist.track -> $track {
    if $track.location.elems {
       say "Playing track { $track.title } by { $track.creator }";
       # TYpically if there is more than one location we might
       # choose the most suitable one.
       my $track-uri = $track.location.first; 
       # Do something with the track
    }
}

```

## Description

This is a JSON representation of [XSPF](http://xspf.org/) which is
a format for sharing media playlists.

Because this does the role L<JSON::Class> the objects can be created
directly from and serialised to JSON via the C<from-json> and C<to-json>
methods that role provides.

Currently there doesn't seem to be much software using this format for
playlists but JSON is convenient for a variety of reasons.

## Installation

Assuming you have a working Rakudo installation you should be able to install this with *zef* :

    # From the source directory
   
    zef install .

    # Remote installation

    zef install Audio::Playlist::JSPF

## Support

If you have any problems or suggestions with this module please report them at:

https://github.com/jonathanstowe/Audio-Playlist-JSPF/issues

And I'll see what I can do.


## Licence

This is free software.

Please see the [LICENCE](LICENCE) file in the distribution

© Jonathan Stowe 2016 - 2021
