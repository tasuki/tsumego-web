default:
	# update ruby dependencies
	bundle config set --local path 'vendor/bundle'
	bundle install
	# build static site
	bundle exec middleman build
