
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BlazorNoticias.Modelos.Productos
{
    [Table("Categorias")]
    public class CategoriaModelo
    {
        [Key]
        public int Id { get; set; }

        [StringLength(100, MinimumLength = 3)]
        public string Nombre { get; set; }

        public bool Activo { get; set; }

        public CategoriaModelo()
        {
            Activo = true;
        }
    }
}
