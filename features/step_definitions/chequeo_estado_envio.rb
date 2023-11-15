Dado('Que estoy registrado como cliente') do
    # Implementar lógica para registrar al cliente si es necesario
  end
  
Dado('existe el envío con el ID {int}') do |envio_id|
    # Implementar lógica para crear el envío con el ID proporcionado
  end
  
Dado('con dirección {string}') do |direccion|
    # Implementar lógica para asignar la dirección al envío
  end
  
Dado('que el envío con ID {int} está sin asignar') do |envio_id|
    # Implementar lógica para marcar el envío como sin asignar
  end
  
Cuando('mando el comando {string}') do |comando|
    # Implementar lógica para simular el envío del comando
  end
  
Entonces('debería ver un mensaje {string}') do |mensaje|
    # Implementar lógica para verificar que se muestra el mensaje esperado
  end
  
Dado('que el envío con ID {int} está entregado') do |envio_id|
    # Implementar lógica para marcar el envío como entregado
  end
  