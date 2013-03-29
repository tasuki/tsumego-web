default:
	# update git modules
	git submodule update
	# update ruby dependencies
	bundle
	# build static site
	middleman build
