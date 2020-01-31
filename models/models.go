package models
import "time"
//import "github.com/jinzhu/gorm"

// http://gorm.io/docs/models.html
// http://jinzhu.me/gorm/models.html#conventions

// se debe poner esta funcion para definir los nombre de las tablas de forma personalizada
func (Clientes) TableName() string {
    return "Clientes"
}
type Clientes struct {
    //gorm.Model
    Id      string `json:",omitempty"`
    Nombre  string `json:",omitempty"`
}
//
func (Cuentas) TableName() string {
    return "Cuentas"
}
type Cuentas struct {
    Id          string `json:",omitempty"`
    Grupo_id    string `json:",omitempty"`
    Estatus     string `json:",omitempty"`
    Monto       float64 `json:",omitempty"`
    Saldo       float64 `json:",omitempty"`
}
//
func (Grupos) TableName() string {
    return "Grupos"
}
type Grupos struct {
    Id      string `json:",omitempty"`
    Nombre  string `json:",omitempty"`
}
//
func (CalendarioPagos) TableName() string {
    return "CalendarioPagos"
}
type CalendarioPagos struct {
    Id          string      `json:",omitempty"`
    Cuenta_id   string      `json:",omitempty"`
    Num_pago    float64     `json:",omitempty"`
    Monto       float64     `json:",omitempty"`
    Fecha_pago  *time.Time  `json:",omitempty"`
    Estatus     string      `json:",omitempty"`
}
//
func (Transacciones) TableName() string {
    return "Transacciones"
}
type Transacciones struct {
    Id          int         `json:",omitempty"`
    Cuenta_id   string      `json:",omitempty"`
    Fecha       *time.Time  `json:",omitempty"`
    Monto       float64     `json:",omitempty"`
}
//
func (Miembros) TableName() string {
    return "Miembros"
}
type Miembros struct {
    Grupo_id    string
    Cliente_id  string
}
