
use JSON::Name;
use JSON::Class;
class Audio::Playlist::JSPF does JSON::Class {
    class Attribution does JSON::Class {
        has Str $.identifier;
        has Str $.location;
    }
    class Track does JSON::Class {
        has  @.identifier;
        has Str $.album;
        has Int $.trackNum;
        has Str $.title;
        has Str $.info;
        has Str $.annotation;
        has Str $.image;
        has  @.location;
        has Str $.creator;
        has Int $.duration;
    }
    class Playlist does JSON::Class {
        class Attribution does JSON::Class {
            has Str $.identifier;
            has Str $.location;
        }
        class Track does JSON::Class {
            has  @.identifier;
            has Str $.album;
            has Int $.trackNum;
            has Str $.title;
            has Str $.info;
            has Str $.annotation;
            has Str $.image;
            has  @.location;
            has Str $.creator;
            has Int $.duration;
        }
        has Str $.identifier;
        has Str $.title;
        has Attribution @.attribution;
        has Str $.info;
        has Str $.annotation;
        has Str $.image;
        has Str $.license;
        has Str $.creator;
        has Str $.location;
        has Track @.track;
        has Str $.date;
    }
    has Playlist $.playlist;
}