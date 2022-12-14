#!/bin/bash

set -euo pipefail

rm -rf ./images

esh='.esh'
wget -qO "$esh" "https://raw.githubusercontent.com/jirutka/esh/v0.3.2/esh"

generated_warning() {
	cat <<-EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "write-templates.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#

	EOH
}

wp_versions=( '6.1' )
for wp in "${wp_versions[@]}"; do
  export wp

	dir="images/$wp"
	mkdir -p "$dir"

	echo "processing $dir..."

  {
			generated_warning
			sh -e "./$esh" Dockerfile.template
	} > "$dir/Dockerfile"

	cp mhsendmail "$dir/"
	cp php.ini "$dir/"
	mkdir "$dir/wp-content"
	cp -rf wp-content/* "$dir/wp-content/"
done
