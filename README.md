# Gestão de Empresas, Equipamentos e Usuários

Este é um aplicativo de back-end desenvolvido para gerenciar empresas, equipamentos e usuários. Ele oferece funcionalidades para criar, atualizar e listar empresas, equipamentos e usuários, bem como associá-los de forma eficaz.

## Sobre o Projeto

Este projeto é uma aplicação de gerenciamento que permite às empresas controlar seus equipamentos e usuários de maneira eficiente. Ele fornece uma API para criar e atualizar empresas, adicionar equipamentos a essas empresas e associar usuários responsáveis aos equipamentos. Além disso, você pode listar e visualizar informações detalhadas sobre empresas, equipamentos e usuários.

## Processo de Deploy

Para implantar a aplicação, siga estas etapas:

1. Crie a imagem Docker executando o seguinte comando na raiz do projeto:

docker build -t rmapps-back .


2. Quando você estiver implantando a aplicação pela primeira vez, execute o seguinte comando para configurar o banco de dados:

docker-compose run back rake db:setup


3. Após a configuração inicial, você pode iniciar a aplicação com o seguinte comando:

docker-compose down
docker-compose up -d


Isso iniciará a aplicação em um contêiner Docker e a tornará acessível na porta configurada.

Certifique-se de ajustar qualquer configuração adicional, como variáveis de ambiente, conforme necessário para atender aos requisitos específicos de implantação do seu ambiente.
