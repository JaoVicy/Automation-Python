import os
import sys
import subprocess

def criar_ambiente(diretorio_projeto):






def main():

    diretorio_projeto = sys.argv[1]
    requirements_file = os.path.join(diretorio_projeto, 'requirements.txt')
    criar_ambiente(diretorio_projeto)
    instalar_dependencias(requirements_file)