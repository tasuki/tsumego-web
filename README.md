### Initial set up

Install Ruby & bundler, on Debian/Ubuntu:

	sudo apt install bundler

Get Ruby dependencies, and build project:

	make

### Updates

Easy, rerun `make`!

### Typography

RubyPants converts straight quotes and apostrophes in rendered page text,
including YAML front matter. The hook in `config.rb` runs after the main layout;
`lib/smart_quotes.rb` handles Haml's escaped quotes without changing attributes
or code. Dashes and ellipses are left alone.

Run typography tests:

	bundle exec ruby test/smart_quotes_test.rb

### More info

* https://middlemanapp.com/
* https://haml.info/
* https://sass-lang.com/
