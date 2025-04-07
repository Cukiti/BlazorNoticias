using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazorNoticias.Migrations
{
    /// <inheritdoc />
    public partial class usuariopaisidnull : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<int>(
                name: "PaisId",
                table: "AspNetUsers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers",
                column: "PaisId",
                principalTable: "Paises",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<int>(
                name: "PaisId",
                table: "AspNetUsers",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Paises_PaisId",
                table: "AspNetUsers",
                column: "PaisId",
                principalTable: "Paises",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
