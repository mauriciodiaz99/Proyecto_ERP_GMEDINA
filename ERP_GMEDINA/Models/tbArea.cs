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
    
    public partial class tbArea
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbArea()
        {
            this.tbDepartamentos = new HashSet<tbDepartamento>();
            this.tbEmpleados = new HashSet<tbEmpleado>();
        }
    
        public int area_Id { get; set; }
        public int car_Id { get; set; }
        public int suc_Id { get; set; }
        public string area_Descripcion { get; set; }
        public bool area_Estado { get; set; }
        public string area_Razoninactivo { get; set; }
        public int area_Usuariocrea { get; set; }
        public System.DateTime area_Fechacrea { get; set; }
        public Nullable<int> area_Usuariomodifica { get; set; }
        public Nullable<System.DateTime> area_Fechamodifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbDepartamento> tbDepartamentos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbEmpleado> tbEmpleados { get; set; }
        public virtual tbCargo tbCargo { get; set; }
        public virtual tbSucursale tbSucursale { get; set; }
    }
}
