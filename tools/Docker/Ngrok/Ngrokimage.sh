# pegar a imagem

docker pull ngrok/ngrok
# Execute um agente ngrok apontado para localhost:80

docker run --net=host -it ngrok/ngrok http 80
# Acesse o inspetor da web na máquina host em localhost:3000

docker run -it --p 3000:4040 ngrok/ngrok http 80
# Execute o agente ngrok com o token de autenticação 'xyz'

docker run -it -e NGROK_AUTHTOKEN=xyz ngrok/ngrok:alpine http 80
# Execute o agente ngrok com o arquivo de configuração './ngrok.yml' da máquina host

docker run -it -v $(pwd)/ngrok.yml:/etc/ngrok.yml -e NGROK_CONFIG=/etc/ngrok.yml ngrok/ngrok:alpine http 80


#! site do ngrok para https://dashboard.ngrok.com/get-started/setup