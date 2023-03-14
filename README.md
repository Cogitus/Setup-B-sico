# Setup Básico
O propósito deste repositório é de fornecer a instalação dos programas básicos para um ambiente Linux recém instalado. Note que alguns dos comandos, tal como a instalação da ferramenta ```Anaconda``` bem como da linguagem ```rust``` têm instaladores que precisam de parâmetros sendo passados manualmente, desta forma, a execução do script ```config_pipeline.sh``` não é totalmente automatizada.

# Como usar?

## 1) Clonando o repo
```bash
    foo@bar:~$ git clone https://github.com/Cogitus/Setup-B-sico.git
    foo@bar:~$ cd Setup-B-sico/
    foo@bar:~$ bash config_pipeline.sh
```

## 2) Baixando diretamente arquivo
```bash
    foo@bar:~$ wget --content-disposition "https://raw.githubusercontent.com/Cogitus/Setup-B-sico/main/config_pipeline.sh"
    foo@bar:~$ bash bash config_pipeline.sh
```