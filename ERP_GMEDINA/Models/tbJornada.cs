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
    
    public partial class tbJornada
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbJornada()
        {
            this.tbSalarioPorHoras = new HashSet<tbSalarioPorHora>();
            this.tbEmpleados = new HashSet<tbEmpleado>();
            this.tbHistorialHorasTrabajadas = new HashSet<tbHistorialHorasTrabajada>();
            this.tbHorarios = new HashSet<tbHorario>();
        }
    
        public int jor_Id { get; set; }
        public string jor_Descripcion { get; set; }
        public bool jor_Estado { get; set; }
        public string jor_RazonInactivo { get; set; }
        public int jor_UsuarioCrea { get; set; }
        public System.DateTime jor_FechaCrea { get; set; }
        public Nullable<int> jor_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> jor_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbSalarioPorHora> tbSalarioPorHoras { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbEmpleado> tbEmpleados { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbHistorialHorasTrabajada> tbHistorialHorasTrabajadas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbHorario> tbHorarios { get; set; }
    }
}
