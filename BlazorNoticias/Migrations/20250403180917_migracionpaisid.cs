using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazorNoticias.Migrations
{
    /// <inheritdoc />
    public partial class migracionpaisid : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PaisId",
                table: "AspNetUsers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_PaisId",
                table: "AspNetUsers",
                column: "PaisId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers",
                column: "PaisId",
                principalTable: "Paises",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_PaisId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "PaisId",
                table: "AspNetUsers");
        }
    }
}
