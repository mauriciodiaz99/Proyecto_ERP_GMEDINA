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
    
    public partial class tbRazonSalida
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbRazonSalida()
        {
            this.tbHistorialSalidas = new HashSet<tbHistorialSalida>();
        }
    
        public int rsal_Id { get; set; }
        public string rsal_Descripcion { get; set; }
        public bool rsal_Estado { get; set; }
        public string rsal_RazonInactivo { get; set; }
        public int rsal_UsuarioCrea { get; set; }
        public System.DateTime rsal_FechaCrea { get; set; }
        public Nullable<int> rsal_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> rsal_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbHistorialSalida> tbHistorialSalidas { get; set; }
    }
}
