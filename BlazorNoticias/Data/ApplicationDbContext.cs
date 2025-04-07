using BlazorNoticias.Modelos;
using BlazorNoticias.Modelos.Productos;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace BlazorNoticias.Data
{
    public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : IdentityDbContext<ApplicationUser>(options)
    {
        public DbSet<PaisesModelo> Paises => Set <PaisesModelo>();
        public DbSet<CategoriaModelo> Categorias => Set<CategoriaModelo>();
        public DbSet<ProductoModelo> Productos => Set<ProductoModelo>();
    }
}
