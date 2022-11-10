echo "Criando as imagens..."

docker build -t layzan/projeto-backend:1.0 backend/.
docker build -t layzan/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push layzan/projeto-backend:1.0
docker push layzan/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

echo "Finalizado!"