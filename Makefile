default:
	# update git modules
	git submodule update
	# update ruby dependencies
	bundle install
	# build static site
	bundle exec middleman build
