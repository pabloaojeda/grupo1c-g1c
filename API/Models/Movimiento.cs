namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public class Movimiento
    {
    private int iD_movimiento;
    private int iD_tipo_movimiento;
    private string descripcion;
    private System.DateTime fecha_Hora;
    private decimal monto;
    private int iD_cuenta_origen;
    private string iD_cuenta_final;
    private int iD_Cuenta;
        public Movimiento()
        {
            
        }

        public Movimiento(int ID_tipo_Movimiento, string Descripcion, decimal Monto, string ID_cuenta_final, int ID_cuenta_origen)
        {
          
          this.iD_tipo_movimiento = ID_tipo_Movimiento;
          this.descripcion = Descripcion;
          //this.fecha_Hora = Fecha_Hora;, DateTime Fecha_Hora
          this.monto = Monto;
          this.iD_cuenta_final = ID_cuenta_final;
          this.iD_Cuenta = ID_cuenta_origen;
        }

        public Movimiento(int ID_movimiento, int ID_tipo_Movimiento, string Descripcion, DateTime Fecha_Hora, decimal Monto, int ID_cuenta_origen, string ID_cuenta_final, int ID_Cuenta)
        {
          this.iD_movimiento = ID_movimiento;
          this.iD_tipo_movimiento = ID_tipo_Movimiento;
          this.descripcion = Descripcion;
          this.fecha_Hora = Fecha_Hora;
          this.monto = Monto;
          this.iD_cuenta_origen = ID_cuenta_origen;
          this.iD_cuenta_final = ID_cuenta_final;
          this.iD_Cuenta = ID_Cuenta;
        }

    //    public Movimiento( string ID_tipo_Movimiento, string Descripcion, DateTime Fecha_Hora, decimal Monto, int ID_cuenta_origen, int ID_cuenta_final)
    //{
     
    //  this.iD_tipo_movimiento = ID_tipo_Movimiento;
    //  this.descripcion = Descripcion;
    //  this.fecha_Hora = Fecha_Hora;
    //  this.monto = Monto;
    //  this.iD_cuenta_origen = ID_cuenta_origen;
    //  this.iD_cuenta_final = ID_cuenta_final;
    //}
        public int ID_movimiento { get=>iD_movimiento; set => iD_movimiento=value; }
        public int ID_tipo_Movimiento { get=>iD_tipo_movimiento; set=>iD_tipo_movimiento=value; }
        public string Descripcion { get=>descripcion; set=>descripcion=value; }
        public System.DateTime Fecha_Hora { get=>fecha_Hora; set=>fecha_Hora=value; }
        public decimal Monto { get=>monto; set=>monto=value; }
        public int ID_cuenta_origen { get=>iD_cuenta_origen; set=>iD_cuenta_origen=value; }
        public string ID_cuenta_final { get=>iD_cuenta_final; set=>iD_cuenta_final=value; }
        public int ID_Cuenta { get => iD_Cuenta; set => iD_Cuenta = value; }
    
        
        //public virtual Cuenta Cuentas { get; set; }
        //public virtual Tipo_Movimientos Tipo_Movimientos { get; }
    }
}
