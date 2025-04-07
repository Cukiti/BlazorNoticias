using BlazorNoticias.Modelos;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BlazorNoticias.Data
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    public class ApplicationUser : IdentityUser
    {
        [StringLength(100)]
        public string? Nombre { get; set; }
        [StringLength(100)]
        public string? Apellido { get; set; }
        [StringLength(100)]
        public string? Compañia { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        [StringLength(100)]
        public string? Direccion {  get; set; }
        [StringLength(100)]
        public string? JobCardnet {  get; set; }

        public DateTime? FechaCreacion { get; set; }

        [ForeignKey(nameof(Pais))]
        public int? PaisId { get; set; }
        public PaisesModelo Pais { get; set; }

        public ApplicationUser() {
            FechaCreacion = DateTime.Now;
        }


    }

}
