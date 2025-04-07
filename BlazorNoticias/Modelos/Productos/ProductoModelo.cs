
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BlazorNoticias.Modelos.Productos
{
    [Table("Productos")]
    public class ProductoModelo
    {
        [Key]
        public int Id { get; set; }

        [StringLength(100, MinimumLength = 3)]
        public string? Nombre { get; set; }

        [Column(TypeName = "decimal(10, 2)")]
        public decimal Precio { get; set; }

        public bool Activo { get; set; }

        [ForeignKey(nameof(Categoria))]
        public int CategoriaId { get; set; }

        public CategoriaModelo? Categoria { get; set; }

        public ProductoModelo()
        {
            Activo = true;
        }
    }
}
