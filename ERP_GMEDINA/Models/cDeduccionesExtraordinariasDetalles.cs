﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ERP_GMEDINA.Models
{
    [MetadataType(typeof(cDeduccionesExtraordinariasDetalles))]
    public partial class V_DeduccionesExtraordinarias_Detalles
    {
    }

    public class cDeduccionesExtraordinariasDetalles
    {
        [Display(Name = "Id Deducciones Extraordinarias")]
        public int dex_IdDeduccionesExtra { get; set; }

        [Display(Name = "Id Equipo Empleado")]
        public int eqem_Id { get; set; }

        [Range(0.01, 99.99, ErrorMessage = "El Monto Inicial no puede ser menor de 0.01, ni mayor de 99.99")]
        [Required(ErrorMessage = "Campo Requerido")]
        [Display(Name = "Monto Inicial")]
        public decimal dex_MontoInicial { get; set; }

        [Range(0.01, 99.99, ErrorMessage = "El Monto Inicial no puede se menor de 0.01, ni mayo de 99.99")]
        [Required(ErrorMessage = "Campo Requerido")]
        [Display(Name = "Monto Restante")]
        public decimal dex_MontoRestante { get; set; }

        [MaxLength(100, ErrorMessage = "No puede ingresar más de 100 caracteres")]
        [Required(ErrorMessage = "Campo Requerido")]
        [Display(Name = "Observaciones")]
        public string dex_ObservacionesComentarios { get; set; }

        [Display(Name = "Código del Equipo")]
        public string eqtra_Codigo { get; set; }

        [Display(Name = "Id Deducción")]
        public int cde_IdDeducciones { get; set; }

        [Display(Name = "Deducción")]
        public string cde_DescripcionDeduccion { get; set; }

        [Range(0.01, 99.99, ErrorMessage = "El Monto Inicial no puede ser menor de 0.01, ni mayor que 99.99")]
        [Required(ErrorMessage = "Campo Requerido")]
        [Display(Name = "Cuota")]
        public decimal dex_Cuota { get; set; }

        [Display(Name = "Creado por")]
        public int dex_UsuarioCrea { get; set; }

        [Display(Name = "Fecha de Creacion")]
        public System.DateTime dex_FechaCrea { get; set; }

        [Display(Name = "Modificado por")]
        public Nullable<int> dex_UsuarioModifica { get; set; }

        [Display(Name = "Fecha Modificacion")]
        public Nullable<System.DateTime> dex_FechaModifica { get; set; }

        [Display(Name = "Activo")]
        public bool dex_Activo { get; set; }

        [Display(Name = "Empleado")]
        public string per_Empleado { get; set; }

        [Display(Name = "Cargo")]
        public string car_Cargo { get; set; }

        [Display(Name = "Departamento")]
        public string depto_Departamento { get; set; }

        [Display(Name = "Área")]
        public string area_Area { get; set; }

    }
}