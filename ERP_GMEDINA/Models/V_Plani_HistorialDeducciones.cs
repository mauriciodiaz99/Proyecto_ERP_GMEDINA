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
    
    public partial class V_Plani_HistorialDeducciones
    {
        public int emp_Id { get; set; }
        public int hipa_IdHistorialDePago { get; set; }
        public int hidp_IdHistorialdeDeduPago { get; set; }
        public decimal hipa_TotalISR { get; set; }
        public decimal hipa_AFP { get; set; }
        public string cde_DescripcionDeduccion { get; set; }
        public Nullable<decimal> hidp_Total { get; set; }
        public int cpla_IdPlanilla { get; set; }
        public System.DateTime hipa_FechaPago { get; set; }
        public string nombreEmpleado { get; set; }
        public string identidadEmpleado { get; set; }
        public Nullable<int> TotalDeducciones { get; set; }
    }
}
