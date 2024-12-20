build: update
	bundle exec middleman build

develop: update
	bundle exec middleman serve

update:
	bundle config set --local path 'vendor/bundle'
	bundle install
