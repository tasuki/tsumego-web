default:
	# update git modules
	git submodule init
	git submodule update
	# update ruby dependencies
	bundle config set --local path 'vendor/bundle'
	bundle install
	# build static site
	bundle exec middleman build
