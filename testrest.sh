echo "Test Server"
ping -c 2 localhost

echo "Test the listing of all containers"
curl -s -X GET -H 'Accept: application.json' http://localhost:8080/containers?state=running | python -mjson.tool

echo "Test the listing of all running containers"

curl -s -X GET -H 'Accept: application.json' http://localhost:8080/containers | python -mjson.tool

echo "Test to list the images"
curl -s -X GET -H 'Accept: application.json' http://localhost:8080/images | python -mjson.tool

echo "Return information on a container with a specific ID"
curl -s -X GET -H 'Accept: application.json' http://localhost:8080/containers/e1437a0eb584 | python -mjson.tool


echo " Return the log file of a container"
curl -s -X GET -H 'Accept: application.json' http://localhost:8080/containers/5ebbca943d63/logs| python -mjson.tool


echo "Creating a container based on images that already exist"
curl -X POST -H 'Content-Type: application/json' http://localhost:8080/containers -d '{"image": "Hello World"}'
curl -X POST -H 'Content-Type: application/json' http://localhost:8080/containers -d '{"image": "0a6ba66e537a"}'
curl -X POST -H 'Content-Type: application/json' http://localhost:8080/containers -d '{"image": "0a6ba66e537a","publish":"8081:22"}'


echo "Stop the ubunut container"
curl -X PATCH -H 'Content-Type: application/json' http://localhost:8080/containe/5ebbca943d63  -d '{"state": "stopped"}'


echo "Restart the ubuntu container"
curl -X PATCH -H 'Content-Type: application/json' http://localhost:8080/containers/5ebbca943d63 -d '{"state": "running"}'


echo "Delete a container by its ID"
curl -s -X DELETE -H 'Accept:application.json' http://localserver:8080/container/036715a9b22f  -d '{"state": "running"}'

echo"Delete an image by ID"
curl -s -X DELETE -H 'Accept:application.json' http://localhost:8080/images/0a6ba66e537a

