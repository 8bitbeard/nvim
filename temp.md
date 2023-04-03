# Testes de integração com TaaC da Squad NOME_DA_SQUAD

1. [Introdução](#introdução)
2. [Ambiente de desenvolvimento](#ambiente-de-desenvolvimento)
3. [Implementando cenários de teste](#implementando-cenários-de-teste)
4. [Dados das peças e massas de teste](#dados-das-peças-e-massas-de-teste)
5. [Execução dos testes](#execução-dos-testes)
    1. [Mensagem do commit](#mensagem-do-commit)
    2. [Github Issue Form](#github-issue-form)

## Introdução

Bem vindo ao repositório de testes de integração da Squad Pagamentos. Este repositório tem como objetivo agrupar todos os nossos testes, e fornecer um framework capaz de executar testes sob demanda em ambos os ambientes suportados pelo TaaC (DES e HOM). Como toda a nossa solução nasceu utilizando a linguagem Python, por questões de padronização, nós escolhemos o Python como linguagem principal para a codificação dos testes, e o Pytest como Framework de testes.


## Ambiente de desenvolvimento:

Para instalar todas as dependências, e ter seu projeto pronto para trabalhar, basta executar o seguinte comando:

```bash
pip install -r requirements.txt
```

Este comando irá instalar todas as dependências contidas no arquivo `requirements.txt` contido na raiz do projeto.

Nós recomendamos o uso do `Python 3.8`, que é a versão utilizada pelo nosso time no desenvolvimento das nossas peças e na implementação desse framework. Segue abaixo a lista de dependências que serão instaladas:
- Pytest
- PyYaml
- PyLint
- Black
- Boto3

Obs: Você pode notar a existência de dois arquivos requirements.txt no projeto. É importante que serjam instaladas as dependências contidas no arquivo presente `na raiz do projeto`, pois é nele que temos os modulos de lint e padronização do repositório, que são importantes na etapa de desenvolvimento.

## Implementando cenários de teste:
Existe uma pasta chamada `tests` que pode ser encontrada na raiz do projeto, e é nela que as configurações do framework de teste são implementadas. Dentro dessa pasta temos uma outra chamada `integration`, que agrupa vários arquivos python no padrão `test_<serviço_aws>_<nome_da_peça>.py`. Esses são os arquivos em que as classes e métodos de teste são implementados.

Cada arquivo desse deve ser o responsável por agrupar todos os testes de uma determinada peça, e precisam seguir o seguinte padrão:

```python
@pytest.mark.flow('<fluxo_do_teste>')
@pytest.mark.aws_service('<serviço_aws_da_peça>.')
@pytest.mark.service_name('<nome_da_peça_sendo_testada>')
class TestLambdaSaldoCredorAbertura: # Seguir o padrão Test<peça><nome_peça> em PascalCase
    @pytest.mark.env('<ambientes_elegíveis_do_teste>')
    def test_success_lambda_invoke(<fixtures_utilizadas_no_teste>):
        # lógica do teste, seguindo o padrão AAA (arrange, act, assert)

```

Esse projeto utiliza `marks` do pytest para classificar os cenáros a serem executados. Para que que o cenário seja coletado na hora da execuão, eles precisam ser informados. Abaixo segue uma breve explicação de cada um deles:
- flow: Mark para definir o fluxo de negócio da peça. Exemplo: `"analise"`
- aws_service: Mark para classificar o serviço AWS cujo o teste está validando. Exemplo: `"lambda"`
- service_name: Mark para definir o nome da peça sendo testada. Exemplo: `"lambdasaldocredorpagamentos"`
- env: Mark para definir os ambientes cujo o teste deve ser executado. Exemplo: `"dev", "hom"`

## Dados das peças e massas de teste:

Como os testes implementados neste projeto são executados tanto em DES quanto em HOM, se faz necessária uma forma de configurar as peças com seus dados correspondentes ao ambiente (Região AWS e nome da peça por exemplo), bem como definir as massas de teste específicas por ambiente.

Para configurar os dados da peça, basta adicionar um objeto de configuração ao `yaml` correspondente ao ambiente desejado, presente na pasta `config`.

Para configurar a massa de testes, basta incluir um objeto ao `yaml` presente na pasta `data`.

## Execução dos testes

Para executar os testes, basta utilizar o seguinte comando:

```bash
python -m pytest tests/integration -M "<marks>" -E <ambiente>
```

Mais de um mark pode ser utilizado, basta separ cada mark com um espaço. Exemplos:
```bash
python -m pytest tests/integration -M "analise lambda lambdasaldocredorabertura" -E dev

python -m pytest tests/integration -M "execucao" -E hom

python -m pytest tests/integration -M "lambda" -E dev
```

Existem duas formas de executar os testes deste projeto via TaaC diretamente na conta AWS:

### Mensagem do commit
Na etapa de desenvolimento dos testes, é bastante comum surgir a necessidade de validar os testes implementados para se certificar que os mesmos estão funcionando corretamente antes de realizar o merge para a `main`. Tendo isso em vista, existe uma forma de executar os testes em um ambiente desejado, utilizando um padrão de mensagem de commit.

Para executar os testes no ambiente de desenvolvimento, basta alterar o arquivo `testspec-dev.yml` presente na raiz do projeto, com as configurações desejadas (utilizando o padrão de execução de testes informado acima), e dar um push de um commit em sua branch de desenvolvimento contendo o seguinte padrão:

```bash
# Para executar em Desenvolvimento
"[DEV] Executando os testes da lambdasaldocredorabertura"

# Para executar em Homologação
"[HOM] Executando os testes do s3saldoredorpagaentos"
```

Ao dar o push em sua branch com um commit neste padrão, uma `Action` do Github será iniciada, executando os testes na AWS conforme a configuração do seu testspec no ambiente escolhido.

### Github Issue Form
Também vão existir os casos em que será necessário rodar os testes de forma regressiva, pare realizar um check do comportamento de um fluxo, peça, ou serviço da AWS em determinado momento. Para estes casos, nós implementamos uma forma de iniciar uma execução do TaaC via preechimento de um formulário de `Issue` do Github.

Para realizar uma execução desta forma, basta acessar a aba de `issues` deste repositóio, selecionar o template de issue para testes no TaaC e preencher as seguintes informações:
- Makrs para coleta dos cenários a serem executados
- Ambiente em que os testes serão executados
- Dados adicionais para descrever a execução dos testes

Ao abrir a issue, uma `Action` do Github será iniciada e configurará uma branch de execução chamada `runner` que irá executar os testes de acordo com as informações preenchidas no formulário da Issue.

Após a execução ser finalizada, um comentário será adicionado automaticamente a `Issue` que foi aberta, com as seguintes informações:
- Id ta execução do TaaC
- Quantidade de testes que passaram
- Quantidade de testes que falharam
- Tempo total de execução em segundos
- Gráfico apresentando porcentagem de sucesso/falha da execução
