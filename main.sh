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
        subprocess.run([sys.executable, '-m', 'venv', venv_path], check=True)
        print(f"Ambiente virtual criado em '{venv_path}'.")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao criar ambiente virtual: {e}")

def instalar_dependencias(diretorio_projeto, requirements_file):
    if not os.path.exists(requirements_file):
        print(f"Arquivo de requisitos '{requirements_file}' não encontrado.")
        return
    
    pip_path = os.path.join(diretorio_projeto, 'venv', 'bin', 'pip')  # Unix/macOS
    if not os.path.exists(pip_path):  # Windows fallback
        pip_path = os.path.join(diretorio_projeto, 'venv', 'Scripts', 'pip.exe')

    try:
        subprocess.run([pip_path, 'install', '-r', requirements_file], check=True)
        print(f"Dependências instaladas a partir de '{requirements_file}'.")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao instalar dependências: {e}")

def main():
    if len(sys.argv) < 2:
        print("Uso: python script.py <diretorio_projeto>")
        return

    diretorio_projeto = sys.argv[1]
    requirements_file = os.path.join(diretorio_projeto, 'requirements.txt')

    criar_ambiente(diretorio_projeto)
    instalar_dependencias(diretorio_projeto, requirements_file)

if __name__ == '__main__':
    main()
