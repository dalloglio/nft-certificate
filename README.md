# [WIP] NFT Blockchain Certificate (ERC1155)

Este projeto implementa um contrato inteligente baseado no padrão ERC1155, utilizado para emitir certificados de curso como NFTs (Tokens Não Fungíveis) para alunos. Além de emitir certificados, o contrato possui uma funcionalidade de recompensa automática para alunos que completam múltiplos cursos.

## Funcionalidades

- **Emissão de certificados**: Mintar NFTs que representam certificados de conclusão de curso para os alunos.
- **Recompensas automáticas**: Alunos que recebem certificados podem ganhar tokens de recompensa automaticamente com base no número de certificados emitidos.
- **Certificados dinâmicos**: Certificados são armazenados e podem ser recuperados para cada aluno, incluindo informações como nome do aluno, nome do curso e data de conclusão.
- **Suporte ao padrão ERC1155**: Utiliza o padrão ERC1155 para suportar múltiplos tokens no mesmo contrato inteligente.

## Tecnologias utilizadas

- **Solidity**: Linguagem de programação para contratos inteligentes.
- **Hardhat**: Ferramenta de desenvolvimento para compilar, implantar, testar e depurar contratos inteligentes.
- **OpenZeppelin**: Conjunto de bibliotecas seguras para desenvolvimento de contratos inteligentes.
- **Next.js**: Framework para criação do front-end.
- **Material-UI**: Biblioteca de componentes de interface para React.
- **Ethers.js**: Biblioteca para interagir com a blockchain Ethereum no front-end.

## Arquitetura do contrato

### Certificado (NFT)

Cada certificado é representado por um NFT no padrão ERC1155. O contrato armazena os seguintes dados para cada certificado:

- **Nome do aluno**: O nome do aluno que concluiu o curso.
- **Nome do curso**: O nome do curso que foi completado.
- **Data de conclusão**: A data em que o curso foi concluído.

### Recompensas

Alunos são recompensados com base no número de certificados emitidos:

- **1 certificado**: Recompensa de 10 tokens.
- **Entre 2 e 5 certificados**: Recompensa de 20 tokens.
- **Mais de 5 certificados**: Recompensa de 50 tokens.

## Estrutura do projeto

- **contracts/**: Diretório onde ficam os contratos inteligentes escritos em Solidity.
- **ignition/**: Módulos para deploy e interação com os contratos.
- **test/**: Testes automatizados para garantir o funcionamento correto dos contratos.

## Dapp

Projeto onde está implementada a interface do projeto em Next.js e Material-UI.

## Como rodar o projeto

### Requisitos

- **Node.js**: Para rodar o ambiente de desenvolvimento JavaScript.
- **Hardhat**: Ferramenta para desenvolvimento de contratos inteligentes.
- **Metamask**: Extensão para o navegador para interagir com a blockchain.

### Passo a passo

1. **Clonar o repositório**:

```bash
git clone https://github.com/dalloglio/nft-certificate.git
cd nft
```

2. **Instalar as dependências**:

```bash
npm install
```

3. **Compilar o contrato**:

Para compilar, implantar, testar e depurar o contrato:

```bash
npm run compile
```

4. **Configurar a rede local do Hardhat**:

Inicie uma rede local do Hardhat:

```bash
npm run dev
```

5. **Deploy do contrato**:

Use o seguinte comando para fazer o deploy do contrato na rede local:

```bash
npm run deploy
```

6. **Conectar ao frontend**:

Para rodar a aplicação Next.js no frontend:

```bash
git clone https://github.com/dalloglio/nft-certificate-dapp.git
cd nft-certificate-dapp
npm install
npm run dev
```

Acesse no navegador o dapp em http://localhost:3000

7. **Adicionar rede local no Metamask**:

O Dapp ao ser executado irá solicitar que seja conectado à Metamask, bem como irá configurar a rede local do Hardhat à Metamask.

8. **Mintar certificados**:

Para mintar um certificado para um aluno, acesse http://localhost:3000 e preencha o formulário com as informações do aluno.

## Estrutura do certificado

Cada certificado NFT emitido contém as seguintes informações:

```json
{
    "id": 1,
    "uri": "http://localhost:3000/certificates/1.json",
    "studentName": "Ricardo Pires",
    "courseName": "Blockchain Avançado",
    "completionDate": "2024-09-10"
}
```

## Frontend

O frontend foi desenvolvido usando **Next.js** e **Material-UI**. Ele permite que o dono do contrato mint certificados diretamente pela interface e visualize os certificados já emitidos. Também exibe as recompensas recebidas.

### Features

- **Conectar metamask**: O usuário pode se conectar com sua carteira Metamask para ver seus certificados.
- **Emitir certificados**: Administrador pode emitir certificados diretamente pela interface.
- **Visualizar certificados**: Administrador pode visualizar certificados emitidos para os alunos.
- **Sistema de recompensas**: Recompensas automáticas são exibidas com base no número de certificados emitidos.

## Testes Automatizados - N/A

Para rodar os testes:

```bash
npx hardhat test
```

## Contribuições

Sinta-se à vontade para contribuir com o projeto enviando pull requests, relatando bugs ou sugerindo melhorias.
