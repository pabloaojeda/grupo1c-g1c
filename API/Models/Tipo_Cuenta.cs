namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public class Tipo_Cuenta
    {
        
        public Tipo_Cuenta()
        {
            
        }

        public Tipo_Cuenta(int iD_Tipo_Cuenta, string tipo_Cuenta1)
        {
          ID_Tipo_Cuenta = iD_Tipo_Cuenta;
          Tipo_Cuenta1 = tipo_Cuenta1;
        }

        public int ID_Tipo_Cuenta { get; }
        public string Tipo_Cuenta1 { get; }
    
        
        //public virtual ICollection<Cuenta> Cuentas { get; set; }
    }
}
