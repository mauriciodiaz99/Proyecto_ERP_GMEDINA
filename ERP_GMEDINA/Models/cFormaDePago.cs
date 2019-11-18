﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using ERP_GMEDINA.Models;

namespace ERP_GMEDINA.Models
{
    [MetadataType(typeof(cFormaDePago))]
    public partial class tbFormaDePago
    {
    }
    public class cFormaDePago
    {
        [Display(Name = "ID")]
        public int fpa_IdDeducciones { get; set; }

        [Display(Name = "Forma de Pago")]
        [Required(ErrorMessage = "El campo Forma de Pago es requerido")]
        public string cde_DescripcionDeduccion { get; set; }

        [Display(Name = "Creado por")]
        public int fpa_UsuarioCrea { get; set; }

        [Display(Name = "Fecha de Creación")]
        public System.DateTime fpa_FechaCrea { get; set; }

        [Display(Name = "Modificado por")]
        public Nullable<int> fpa_UsuarioModifica { get; set; }

        [Display(Name = "Fecha de Modificación")]
        public Nullable<System.DateTime> fpa_FechaModifica { get; set; }

        [Display(Name = "Es Activo")]
        public bool fpa_Activo { get; set; }
    }
}