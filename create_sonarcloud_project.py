import requests
import os

# Configurar las credenciales de autenticación de SonarCloud
sonarcloud_base_url = 'https://sonarcloud.io'
sonarcloud_token = os.environ['SONAR_TOKEN']

# Datos del nuevo proyecto a crear
project_key = 'quind123'
project_name = 'Nuevo Proyecto'
organization = 'duvanquind'

# Endpoint para la creación de proyectos
url = f'{sonarcloud_base_url}/api/projects/create'

# Payload con los datos del nuevo proyecto
payload = {
    'key': project_key,
    'name': project_name,
    'organization': organization,
}

# Encabezados de autenticación
headers = {
    'Authorization': f'Bearer {sonarcloud_token}',
    'Content-Type': 'application/json',
}

# Realizar la solicitud HTTP POST para crear el proyecto
response = requests.post(url, headers=headers, json=payload)

# Verificar el resultado
if response.status_code == 200:
    print(f"Proyecto '{project_name}' creado exitosamente.")
else:
    print(f"Error al crear el proyecto. Código de respuesta: {response.status_code}")
    print(response.json())
