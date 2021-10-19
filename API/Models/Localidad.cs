namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public class Localidad
    {
        private int iD_Localidad;
        private string localidad1;
        private string codigo_Postal;
        private int iD_Provincia;
        public Localidad()
        {
            
        }

        public Localidad(int ID_Localidad, string Localidad1, string Codigo_Postal, int ID_Provincia)
        {
          this.iD_Localidad = ID_Localidad;
          this.localidad1 = Localidad1;
          this.codigo_Postal = Codigo_Postal;
          this.iD_Provincia = ID_Provincia;      
        }

        public int ID_Localidad { get=>iD_Localidad; }
        public string Localidad1 { get=>localidad1; }
        public string Codigo_Postal { get => codigo_Postal; }
        public int ID_Provincia { get=>iD_Provincia; }
    
        
        //public virtual Cliente Clientes { get; set; }
        //public virtual Provincia Provincia { get; }
    }
}
