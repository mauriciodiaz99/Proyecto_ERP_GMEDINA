//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ERP_GMEDINA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbDepartamento
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbDepartamento()
        {
            this.tbEmpleados = new HashSet<tbEmpleado>();
            this.tbHistorialContrataciones = new HashSet<tbHistorialContratacione>();
        }
    
        public int depto_Id { get; set; }
        public int area_Id { get; set; }
        public int car_Id { get; set; }
        public string depto_Descripcion { get; set; }
        public bool depto_Estado { get; set; }
        public string depto_RazonInactivo { get; set; }
        public int depto_UsuarioCrea { get; set; }
        public System.DateTime depto_Fechacrea { get; set; }
        public Nullable<int> depto_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> depto_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbArea tbArea { get; set; }
        public virtual tbCargo tbCargo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbEmpleado> tbEmpleados { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbHistorialContratacione> tbHistorialContrataciones { get; set; }
    }
}