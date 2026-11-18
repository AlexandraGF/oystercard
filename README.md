
## Runtime and accounting fixes

Use a supported Ruby version (3.2 or later), then install the locked test dependencies with Bundler and run `bundle exec rspec`. The full 25-example suite was validated using JRuby 10.1.3.0 (Ruby 4.0.9); gem archives were checksum-verified and no native extension scripts were run.

Gem downloads now use HTTPS, and the lock contains only the declared RSpec dependencies. Touch-in keeps a Journey object, touch-out records the correct entry/exit history, and abandoned or missing entries receive the Journey penalty fare. Invalid, negative and non-finite top-ups are rejected without changing the balance. The previous test that undercharged a missing entry now expects the penalty.
