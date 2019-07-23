# goAPI
Simple API REST

## Install

 - go get -u github.com/gorilla/mux

 - go get -u github.com/jinzhu/gorm

Execute with admin permisions:
- mysql -u root -p -v < admin.sql

- mysql -u root -p -v < goapi_db.sql

## Run
- go run webservice.go

## Calls

### Clientes
 - curl http://localhost:3000/clientes
 - curl http://localhost:3000/clientes/ASDFG08
 - curl -k http://localhost:3000/clientes -d 'id=unIdX&nombre=VICTORIA'
 - curl -X PUT http://localhost:3000/clientes/unIdX -d 'nombre=VICTORIA ALADA'
 - curl -X DELETE http://localhost:3000/clientes/unIdX
### Grupos
- curl http://localhost:3000/grupos
- curl http://localhost:3000/grupos/ABCD2
- curl -k http://localhost:3000/grupos -d 'id=unIdX&nombre="GRUPO MODELO"'
- curl -X PUT http://localhost:3000/grupos/unIdX -d 'nombre=VICTORIOSO'
- curl -X DELETE http://localhost:3000/grupos/unIdX
### Cuentas
 - curl http://localhost:3000/cuentas
 - curl http://localhost:3000/cuentas/ABCD2
 - curl -k http://localhost:3000/cuentas -d 'id=unIdX&grupo_id=ABCD2&estatus=PENDIENTE&monto=10000&saldo=10000'
 - curl -X PUT http://localhost:3000/cuentas/unIdX -d 'grupo_id=ABCD2&estatus=ACTIVE&monto=10000&saldo=10000'
 - curl -X DELETE http://localhost:3000/cuentas/unIdX
### Miembros
 - curl http://localhost:3000/miembros
### Transacciones
 - curl http://localhost:3000/transacciones
 - curl http://localhost:3000/transacciones/10001
### Calendario
 - curl http://localhost:3000/calendario
 - curl http://localhost:3000/calendario/10001

