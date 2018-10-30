#!/us
set -o errexit
cd "$(dirname "$0")"
docker rm -f eosio_blog_container
docker rm -f mongo_blog_container


