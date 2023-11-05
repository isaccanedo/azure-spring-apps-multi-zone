# Azure Spring Apps multi zone reference architecture

Este exemplo contém um modelo Terraform que implanta um exemplo de trabalho da arquitetura de referência do centro de arquitetura do Azure: [Arquitetura de referência do Azure Spring Apps de várias zonas (em breve)] (em breve). A arquitetura de referência e o exemplo mostram como executar uma carga de trabalho do Azure Spring Apps em uma configuração de várias zonas. Isso permite maior disponibilidade da carga de trabalho.

![Multi zone Spring Apps architecture diagram](./images/multi-zone-spring-apps-reference-architecture.png)

Este exemplo também aplica uma configuração de proxy reverso adequada com [preservação do nome do host](https://learn.microsoft.com/azure/architecture/best-practices/host-name-preservation). Isso significa que os cookies e os redirecionamentos AAD funcionarão conforme o esperado.

## Features

Esta estrutura de projeto fornece os seguintes recursos:

- Multi-zone Spring Apps deployment with VNet integration
- Proper reverse proxy configuration for Application Gateway with a custom domain
- Integration with Key Vault
- Integration with a MySQL Flexible database

## Começando

### Pré-requisitos

Antes de começar, certifique-se de ter o seguinte disponível:

- Assinatura do Azure com acesso de Colaborador
- Acesso ao Azure Active Directory
- opcional:
   - certificado pfx para seu domínio personalizado
   - Token de acesso pessoal do GitHub

> [NOTA!]
> Também existe a opção de instalar esta infraestrutura com um certificado autoassinado. Este certificado será gerado para você durante a implantação. No entanto, esta configuração só deve ser usada em cenários de teste.

Para implantar a infraestrutura, você pode usar um ambiente instalado localmente ou um contêiner de desenvolvimento pré-configurado.

Ao executar localmente, certifique-se de ter o seguinte instalado:

- Versão mais recente do [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Versão mais recente do [AZ CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

Ao usar o contêiner de desenvolvimento, certifique-se de ter [GitHub Codespaces](https://docs.github.com/codespaces/overview) habilitado em sua organização GitHub ou você pode iniciar o contêiner de desenvolvimento localmente com o [Visual Studio Extensão de contêineres remotos de código](https://code.visualstudio.com/docs/remote/containers).

### Instalação

Esta amostra pode ser configurada em uma configuração de teste ou sem teste.

- [test set up]: In this case the Git PAT token is optional and a self-signed certificate is used. Walkthrough of this setup is found in the [install-test.md](docs/install-test.md) file.
- [non-test set up]: In this case the Git PAT token is mandatory and a pfx certificate for your custom domain is used. Walkthrough of this setup is found in the [install-prod.md](docs/install-prod.md) file.

### What you need to know about this setup

More info on how the terraform templates are build and how they operate can be found in the [docs](docs) folder of this repository. Best starting point is the [maintf.md](docs/maintf.md) file.

### Coming up

We are working on improving this sample. The ideas we have on improving:

- Create Bicep templates for the same setup (in progress)
- Make the database interchangeable for other types of databases (Cosmos DB as a first candidate)
- Currently the apps in Azure Spring Apps are based on the Spring Petclinic sample, these apps should be better configurable.

## Resources

- [Azure Architecture Center: Multi-zone Azure Spring Apps reference architecture(coming up)](article coming up)
- [Preserve the original HTTP host name between a reverse proxy and its back-end web application](https://learn.microsoft.com/azure/architecture/best-practices/host-name-preservation)
- A similar automated setup in multiple regions can be found in the [Azure Spring Apps multi region reference architecture](https://github.com/Azure-Samples/azure-spring-apps-multi-region) GitHub repository with more info in the [Deploy Azure Spring Apps to multiple regions](https://learn.microsoft.com/azure/architecture/reference-architectures/microservices/spring-apps-multi-region) architecture center article.
