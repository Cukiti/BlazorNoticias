using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace BlazorNoticias.Modelos



{
    [Table("Paises")]
    public class PaisesModelo
    {
        [Key]
        public int? Id { get; set; }

        [StringLength(128, MinimumLength = 3)]
        public string? Nombre { get; set; } = string.Empty;

        public bool? Activoo { get; set; }

        public PaisesModelo()
        {
            Activoo = true;
        }
    }
}
