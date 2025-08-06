import os
import sys
import subprocess

def criar_ambiente(diretorio_projeto):

    if not os.path.exists(diretorio_projeto):
        print(f"Diretório do projeto '{diretorio_projeto}' não encontrado.")
        return
    venv_path = os.path.join(diretorio_projeto, 'venv')
    if os.path.exists(venv_path):
        print(f"Ambiente virtual já existe em '{venv_path}'.")
        return
    try:
        subprocess.run(['venv', venv_path], check=True)




def main():

    diretorio_projeto = sys.argv[1]
    requirements_file = os.path.join(diretorio_projeto, 'requirements.txt')
    criar_ambiente(diretorio_projeto)
    instalar_dependencias(requirements_file)