cd roar-docker
docker build -f Dockerfile_roar_db_image -t localhost:5000/roar-db:v1 .
docker build -f Dockerfile_roar_web_image --build-arg warFile=roar.war -t localhost:5000/roar-web:v1 .
docker push localhost:5000/roar-db:v1
docker push localhost:5000/roar-web:v1
echo Images created and pushed to localhost:5000