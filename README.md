# Modelo de Projeto de Dados no Fabric via Terraform 

## ⚙️ Pré-requisitos locais

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli) **>= 1.12.2** (confira rodando `terraform -version`)  
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) **>= 2.63.0** (confira rodando `az version`)  
- Permissões de **Contributor** ou **Owner** na Subscription do Azure  

> ℹ️ As restrições de versão dos providers estão definidas no arquivo [`versions.tf`](./versions.tf).

<br>

## 📥 Instalação e autenticação

Para configurar seu ambiente local, siga a documentação oficial da Microsoft:  
👉 [Instalar Terraform no Windows, Azure CLI e autenticar no Microsoft Azure](https://learn.microsoft.com/pt-br/azure/developer/terraform/get-started-windows-bash)  

Nessa página, o usuário deve seguir especialmente as etapas:  
- **Instalar o Terraform no Windows com o Bash**  
- **Autenticar o Terraform no Azure**  

<br>

## 🛠️ Provisionando o ambiente Fabric

1. Clone o repositório:
   ```pwsh
   git clone https://github.com/jvtaboada/dtx-fabric-project-template.git
   cd dtx-fabric-project-template
   ```
   >*Baixa o código do projeto e entra no diretório*
    
<br>

2. Copie o arquivo de variáveis de exemplo e ajuste conforme seu ambiente:
    ```pwsh
    cp terraform.tfvars.example terraform.tfvars
    ```
    >*Siga as instruções do arquivo e defina os parâmetros*

<br>

3. Inicialize o projeto Terraform:
    ```pwsh
    terraform init
    ```
    >*Baixa os providers e prepara o diretório para execução*

<br>

4. Valide as configurações do projeto:
    ```pwsh
    terraform validate
    ```
    >*Verifica se os arquivos .tf estão corretos*

<br>

5. Gere o plano de execução:
    ```pwsh
    terraform plan -var-file="terraform.tfvars" -out="plan.tfplan"
    ```
    > *Mostra o que será criado / alterado / destruído*

    > *Parâmetro -out salva o plano para aplicar depois*

<br>

6. Aplique o plano:
    ```pwsh
    terraform apply plan.tfplan
    ```
    >*Executa o plano salvo e cria os recursos no Azure e Fabric*

<br>
✅ O ambiente está pronto!

<br>

---


### 🧹 Para excluir todos os recursos criados:
    
   ```pwsh
   terraform destroy
   ```