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
    
    public partial class V_Plani_EmpleadoPorPlanilla
    {
        public int emp_Id { get; set; }
        public string NombreColaborador { get; set; }
        public string car_Descripcion { get; set; }
        public string area_Descripcion { get; set; }
        public string cpla_DescripcionPlanilla { get; set; }
        public string fpa_Descripcion { get; set; }
        public System.DateTime hipa_FechaPago { get; set; }
        public Nullable<decimal> hipa_SueldoNeto { get; set; }
        public string peri_DescripPeriodo { get; set; }
        public string cin_DescripcionIngreso { get; set; }
        public Nullable<decimal> hip_TotalPagar { get; set; }
        public string cde_DescripcionDeduccion { get; set; }
        public Nullable<decimal> hidp_Total { get; set; }
    }
}
