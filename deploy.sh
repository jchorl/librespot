set -e

echo "starting"
echo "$2" | docker login -u "$1" --password-stdin
echo "login successful, pushing"
docker push jchorl/librespot
echo "done"
