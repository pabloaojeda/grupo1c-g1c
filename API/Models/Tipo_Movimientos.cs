namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public class Tipo_Movimientos
    {
        
        public Tipo_Movimientos()
        {
           
        }

        public Tipo_Movimientos(int iD_tipo_Movimiento, string tipo_Movimiento)
        {
          ID_tipo_Movimiento = iD_tipo_Movimiento;
          Tipo_Movimiento = tipo_Movimiento;
        }

        public int ID_tipo_Movimiento { get; }
        public string Tipo_Movimiento { get; }
    
       
        public virtual ICollection<Movimiento> Movimientos { get; set; }
    }
}
