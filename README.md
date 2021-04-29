### Initial set up

Install Ruby & bundler, on Debian/Ubuntu:

	sudo apt-get install ruby
	sudo gem install bundler

Initialize git modules in project directory and use local env:

	git submodule init
	bundle config set path 'vendor/bundle'

Update submodules, get Ruby dependencies, and build project:

	make

### Updates

Easy, rerun `make`!

### More info

* http://middlemanapp.com/
* http://twitter.github.com/bootstrap/
* http://haml.info/
* http://lesscss.org/
