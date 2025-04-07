using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazorNoticias.Migrations
{
    /// <inheritdoc />
    public partial class descripcionnoticia : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Descripcion",
                table: "Categorias",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ImagenAlmacenada",
                table: "Categorias",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Descripcion",
                table: "Categorias");

            migrationBuilder.DropColumn(
                name: "ImagenAlmacenada",
                table: "Categorias");
        }
    }
}
