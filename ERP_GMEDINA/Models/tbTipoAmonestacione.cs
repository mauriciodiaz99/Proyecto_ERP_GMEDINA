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
    
    public partial class tbTipoAmonestacione
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbTipoAmonestacione()
        {
            this.tbHistorialAmonestaciones = new HashSet<tbHistorialAmonestacione>();
        }
    
        public int tamo_Id { get; set; }
        public string tamo_Descripcion { get; set; }
        public bool tamo_Estado { get; set; }
        public string tamo_RazonInactivo { get; set; }
        public int tamo_UsuarioCrea { get; set; }
        public System.DateTime tamo_FechaCrea { get; set; }
        public Nullable<int> tamo_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> tamo_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbHistorialAmonestacione> tbHistorialAmonestaciones { get; set; }
    }
}
