# DataEX - Data Project Template in Microsoft Fabric using Terraform

> ⚠️ **Este projeto ainda está em desenvolvimento.**  
> O objetivo é fornecer um **template Terraform padronizado** para provisionar ambientes completos  no **Microsoft Fabric**.



## 📌 Objetivo do Projeto
- Item 1
- Item 2



## 📂 Estrutura do Projeto
```plaintext
.
raiz
├── main.tf                 # Orquestra os módulos
├── variables.tf            # Declara as variáveis usadas na 
├── locals.tf               # Variáveis locais (naming/tagging)
├── terraform.tfvars        # Valores definidos pelo usuário
├── modules/
└── README.md               # Este documento
```


## 🧱 Arquitetura Final
imagens rg no azure \
imagens workspace fabric

## ⚙️ Pré-requisitos
- Terraform (versão)
- Azure CLI (versão)
- Permissões de Contributor/Owner na Subscription do Azure

## 🛠️ Provisionando o ambiente

1. Clone o repositório:
   ```bash
   git clone https://github.com/jvtaboada/dtx-fabric-project-template.git
   cd fabric-terraform-template

2. Configure as variáveis no arquivo terraform.tfvars
3. Inicialize o Terraform:
    ```bash
    terraform init

... continua