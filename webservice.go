package main

import (
    "log"
    "strconv"
    "net/http"
    "encoding/json"
    "github.com/gorilla/mux"
    "github.com/jinzhu/gorm"
    _ "github.com/jinzhu/gorm/dialects/mysql"
    models "./models" //se importa el paquete y se asigna a la variable models
)

// go get -u github.com/gorilla/mux
// go get -u github.com/jinzhu/gorm

func dbConn() (db *gorm.DB) {
    dbDriver := "mysql"
    dbUser := "goapi"
    dbPass := "goapi"
    dbName := "goapi_db"
    db, err := gorm.Open(dbDriver, dbUser+":"+dbPass+"@/"+dbName+"?parseTime=true") // parseTime para parsear fechas :O
    if err != nil {
        panic(err.Error())
    }
    return db
}

func ClientesEndPoint(w http.ResponseWriter, request *http.Request) {
    db := dbConn()
    defer db.Close()

    params := mux.Vars(request)
    vars := mux.Vars(request)
    request.ParseForm()                     // Parses the request body
    form := request.Form // x will be "" if parameter is not set
    log.Println(vars, params, form)
    var clientes []models.Clientes
    var cliente models.Clientes

    switch request.Method {
        case "GET":
            log.Println("GET")
            if params["id"] != ""{
                // db.Find(&cliente,  params["id"]) // solo funciona con IDs integer
                db.Where("id = ?", params["id"]).First(&cliente)
                json.NewEncoder(w).Encode(cliente)
                // if cliente != (models.Clientes{}) {
                // }else{
                //     json.NewEncoder(w).Encode(cliente) }
            }else{
                db.Find(&clientes)
                json.NewEncoder(w).Encode(clientes)
            }
        case "POST":
            log.Println("POST")
            cliente.Id = form["id"][0]
            cliente.Nombre = form["nombre"][0]
            
            db.NewRecord(cliente) // => returns 'true' as primary key is blank
            db.Create(&cliente)
            db.NewRecord(cliente) // => return 'false' after 'user' created

            db.Save(&cliente)
        case "PUT":
            log.Println("PUT")
            log.Println(form["nombre"], params["id"])
            db.Where("id = ?", params["id"]).Find(&cliente)
            cliente.Nombre = form["nombre"][0]

            db.Save(&cliente)
        case "DELETE":
            log.Println("DELETE")
            db.Where("id = ?", params["id"]).Find(&cliente)
            // log.Println(cliente)
            db.Delete(&cliente)
        default:
            log.Println("Metodo no permitido")
            w.WriteHeader(http.StatusMethodNotAllowed)

    }
    return
}

func GruposEndPoint(w http.ResponseWriter, request *http.Request) {
    db := dbConn()
    defer db.Close()

    params := mux.Vars(request)
    vars := mux.Vars(request)
    request.ParseForm()                     // Parses the request body
    form := request.Form // x will be "" if parameter is not set
    log.Println(vars, params, form)
    var grupos []models.Grupos
    var grupo models.Grupos

    switch request.Method {
        case "GET":
            log.Println("GET")
            if params["id"] != ""{
                db.Where("id = ?", params["id"]).First(&grupo)
                json.NewEncoder(w).Encode(grupo)
            }else{
                db.Find(&grupos)
                json.NewEncoder(w).Encode(grupos)
            }
        case "POST":
            log.Println("POST")
            grupo.Id = form["id"][0]
            grupo.Nombre = form["nombre"][0]
            
            db.NewRecord(grupo) // => returns 'true' as primary key is blank
            db.Create(&grupo)
            db.NewRecord(grupo) // => return 'false' after 'user' created

            db.Save(&grupo)
        case "PUT":
            log.Println("PUT")
            log.Println(form["nombre"], params["id"])
            db.Where("id = ?", params["id"]).Find(&grupo)
            grupo.Nombre = form["nombre"][0]

            db.Save(&grupo)
        case "DELETE":
            log.Println("DELETE")
            db.Where("id = ?", params["id"]).Find(&grupo)
            db.Delete(&grupo)
        default:
            log.Println("Metodo no permitido")
            w.WriteHeader(http.StatusMethodNotAllowed)

    }
    return
}

func CuentasEndPoint(w http.ResponseWriter, request *http.Request) {
    db := dbConn()
    defer db.Close()

    params := mux.Vars(request)
    vars := mux.Vars(request)
    request.ParseForm()
    form := request.Form
    log.Println(vars, params, form)
    var cuentas []models.Cuentas
    var cuenta models.Cuentas

    switch request.Method {
        case "GET":
            log.Println("GET")
            if params["id"] != ""{
                db.Where("id = ?", params["id"]).First(&cuenta)
                json.NewEncoder(w).Encode(cuenta)
            }else{
                db.Find(&cuentas)
                log.Println(cuentas)
                json.NewEncoder(w).Encode(cuentas)
            }
        case "POST":
            log.Println("POST")
            // todos los datos son obligatorios, si alguno no existe lo deja vacio
            cuenta.Id = form["id"][0]
            cuenta.Grupo_id = form["grupo_id"][0]
            cuenta.Estatus = form["estatus"][0]
            cuenta.Monto, _ = strconv.ParseFloat(form["monto"][0], 64)
            cuenta.Saldo, _ = strconv.ParseFloat(form["saldo"][0], 64)

            db.NewRecord(cuenta) // => returns 'true' as primary key is blank
            db.Create(&cuenta)
            guardado := db.NewRecord(cuenta) // => return 'false' after 'user' created
            if guardado {
                db.Save(&cuenta)
            }else{
                log.Println(guardado)
            }

        case "PUT":
            log.Println("PUT")
            db.Where("id = ?", params["id"]).Find(&cuenta)
            // todos los datos son obligatorios, si alguno no existe lo deja vacio
            cuenta.Grupo_id = form["grupo_id"][0]
            cuenta.Estatus = form["estatus"][0]
            cuenta.Monto, _ = strconv.ParseFloat(form["monto"][0], 64)
            cuenta.Saldo, _ = strconv.ParseFloat(form["saldo"][0], 64)

            db.Save(&cuenta)
        case "DELETE":
            log.Println("DELETE")
            db.Where("id = ?", params["id"]).Find(&cuenta)
            db.Delete(&cuenta)
        default:
            log.Println("Metodo no permitido")
            w.WriteHeader(http.StatusMethodNotAllowed)

    }
    return
}

func MiembrosEndPoint(w http.ResponseWriter, request *http.Request) {
    json.NewEncoder(w).Encode(models.Clientes{})
    return
}

func TransaccionesEndPoint(w http.ResponseWriter, request *http.Request) {
    db := dbConn()
    defer db.Close()

    params := mux.Vars(request)
    vars := mux.Vars(request)
    request.ParseForm()
    form := request.Form
    log.Println(vars, params, form)
    var trans []models.Transacciones
    // var tran models.Transacciones

    switch request.Method {
        case "GET":
            log.Println("GET")
            if params["id"] != ""{
                db.Where("cuenta_id = ?", params["id"]).Find(&trans)
                json.NewEncoder(w).Encode(trans)
            }else{
                db.Find(&trans)
                json.NewEncoder(w).Encode(trans)
            }
        default:
            log.Println("Metodo no permitido")
            w.WriteHeader(http.StatusMethodNotAllowed)
    }
    return

}

func CalendarioPagosEndPoint(w http.ResponseWriter, request *http.Request) {
    db := dbConn()
    defer db.Close()

    params := mux.Vars(request)
    vars := mux.Vars(request)
    request.ParseForm()
    form := request.Form
    log.Println(vars, params, form)
    var calendario []models.CalendarioPagos
    // var tran models.Transacciones

    switch request.Method {
        case "GET":
            log.Println("GET")
            if params["id"] != ""{
                db.Where("cuenta_id = ?", params["id"]).Find(&calendario)
                json.NewEncoder(w).Encode(calendario)
            }else{
                db.Find(&calendario)
                json.NewEncoder(w).Encode(calendario)
            }
        default:
            log.Println("Metodo no permitido")
            w.WriteHeader(http.StatusMethodNotAllowed)
    }
    return
}

func main() {
    // go run webservice.go
    log.Println("Server started on: http://localhost:3000")

    router := mux.NewRouter()
    router.HandleFunc("/clientes", ClientesEndPoint)
    router.HandleFunc("/clientes/{id}", ClientesEndPoint)
    /*
    curl http://localhost:3000/clientes
    curl http://localhost:3000/clientes/ASDFG08
    curl -k http://localhost:3000/clientes -d 'id=unIdX&nombre=VICTORIA'
    curl -X PUT http://localhost:3000/clientes/unIdX -d 'nombre=VICTORIA ALADA'
    curl -X DELETE http://localhost:3000/clientes/unIdX
    */
    router.HandleFunc("/grupos", GruposEndPoint)
    router.HandleFunc("/grupos/{id}", GruposEndPoint)
    /*
    curl http://localhost:3000/grupos
    curl http://localhost:3000/grupos/ABCD2
    curl -k http://localhost:3000/grupos -d 'id=unIdX&nombre="GRUPO MODELO"'
    curl -X PUT http://localhost:3000/grupos/unIdX -d 'nombre=VICTORIOSO'
    curl -X DELETE http://localhost:3000/grupos/unIdX
    */
    router.HandleFunc("/cuentas", CuentasEndPoint)
    router.HandleFunc("/cuentas/{id}", CuentasEndPoint)
    /*
    curl http://localhost:3000/cuentas
    curl http://localhost:3000/cuentas/ABCD2
    FALLA curl -k http://localhost:3000/cuentas -d 'id=unIdX&grupo_id=UNGRUPOX&estatus=PENDIENTE&monto=10000&saldo=10000'
    curl -k http://localhost:3000/cuentas -d 'id=unIdX&grupo_id=ABCD2&estatus=PENDIENTE&monto=10000&saldo=10000'
    curl -X PUT http://localhost:3000/cuentas/unIdX -d 'grupo_id=ABCD2&estatus=PENDIENTEX&monto=10000&saldo=10000'
    curl -X DELETE http://localhost:3000/cuentas/unIdX
    */
    router.HandleFunc("/miembros", MiembrosEndPoint)
    /*
    curl http://localhost:3000/miembros
    */
    router.HandleFunc("/transacciones", TransaccionesEndPoint)
    router.HandleFunc("/transacciones/{id}", TransaccionesEndPoint)
    /*
    curl http://localhost:3000/transacciones
    curl http://localhost:3000/transacciones/10001
    */
    router.HandleFunc("/calendario", CalendarioPagosEndPoint)
    router.HandleFunc("/calendario/{id}", CalendarioPagosEndPoint)
    /*
    curl http://localhost:3000/calendario
    curl http://localhost:3000/calendario/10001
    */

    log.Fatal(http.ListenAndServe(":3000", router))
}
