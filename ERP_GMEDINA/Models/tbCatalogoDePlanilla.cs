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
    
    public partial class tbCatalogoDePlanilla
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbCatalogoDePlanilla()
        {
            this.tbTipoPlanillaDetalleDeduccions = new HashSet<tbTipoPlanillaDetalleDeduccion>();
            this.tbTipoPlanillaDetalleIngresoes = new HashSet<tbTipoPlanillaDetalleIngreso>();
            this.tbEmpleados = new HashSet<tbEmpleado>();
        }
    
        public int cpla_IdPlanilla { get; set; }
        public string cpla_DescripcionPlanilla { get; set; }
        public int cpla_FrecuenciaEnDias { get; set; }
        public bool cpla_RecibeComision { get; set; }
        public int cpla_UsuarioCrea { get; set; }
        public System.DateTime cpla_FechaCrea { get; set; }
        public Nullable<int> cpla_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> cpla_FechaModifica { get; set; }
        public bool cpla_Activo { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbTipoPlanillaDetalleDeduccion> tbTipoPlanillaDetalleDeduccions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbTipoPlanillaDetalleIngreso> tbTipoPlanillaDetalleIngresoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbEmpleado> tbEmpleados { get; set; }
    }
}