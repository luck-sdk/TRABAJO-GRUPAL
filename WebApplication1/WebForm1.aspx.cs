using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        NorthwindEntitiesPRUEBA1 db = new NorthwindEntitiesPRUEBA1();
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }
  
        protected void btnConsulta1_Click(object sender, EventArgs e)
        {
            var clientes = from c in db.Customers
                           select new
                           {
                               Codigo = c.CustomerID,
                               Nombre = c.CompanyName,
                               Ciudad = c.City,
                               Pais = c.Country
                           };

            gvConsultas.DataSource = clientes.ToList();
            gvConsultas.DataBind();
        }

        protected void btnConsulta2_Click(object sender, EventArgs e)
        {
            var bajoStock = from p in db.Products
                            where p.UnitsInStock < 10
                            select new
                            {
                                Producto = p.ProductName,
                                Stock = p.UnitsInStock
                            };

            gvConsultas.DataSource = bajoStock.ToList();
            gvConsultas.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            var productos = from p in db.Products
                            select new
                            {
                                p.ProductID,
                                p.ProductName,
                                p.UnitPrice,
                                p.UnitsInStock
                            };

            gvAdministrar.DataSource = productos.ToList();
            gvAdministrar.DataBind();

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            var empleados = from emp in db.Employees
                            select new
                            {
                                emp.EmployeeID,
                                Nombre = emp.FirstName + " " + emp.LastName,
                                emp.Title,
                                emp.City
                            };

            gvAdministrar.DataSource = empleados.ToList();
            gvAdministrar.DataBind();

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var detalles = from d in db.Order_Details
                           select new
                           {
                               d.OrderID,
                               Producto = d.Products.ProductName,
                               d.Quantity,
                               d.UnitPrice
                           };

            gvAdministrar.DataSource = detalles.ToList();
            gvAdministrar.DataBind();
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            var clientes = from c in db.Customers
                           select new
                           {
                               Tabla = "Cliente",
                               Codigo = c.CustomerID.ToString(),
                               Nombre = c.CompanyName,
                               Detalle = c.Country
                           };

            var productos = from p in db.Products
                            select new
                            {
                                Tabla = "Producto",
                                Codigo = p.ProductID.ToString(),
                                Nombre = p.ProductName,
                                Detalle = "Precio: " + p.UnitPrice.ToString() +
                                          " / Stock: " + p.UnitsInStock.ToString()
                            };

            var categorias = from cat in db.Categories
                             select new
                             {
                                 Tabla = "Categoría",
                                 Codigo = cat.CategoryID.ToString(),
                                 Nombre = cat.CategoryName,
                                 Detalle = cat.Description
                             };

            var union = clientes
                        .Concat(productos)
                        .Concat(categorias)
                        .ToList();

            gvAdministrar.DataSource = union;
            gvAdministrar.DataBind();

        }

        protected void btnConsulta3_Click(object sender, EventArgs e)
        {
            var empleados = from emp in db.Employees
                            where emp.City == "London"
                            select new
                            {
                                Nombre = emp.FirstName + " " + emp.LastName,
                                Cargo = emp.Title,
                                Ciudad = emp.City
                            };

            gvConsultas.DataSource = empleados.ToList();
            gvConsultas.DataBind();
        }


        protected void btnConsulta4_Click(object sender, EventArgs e)
        {
            var pedidosConEmpleado = (from o in db.Orders
                                      join emp in db.Employees
                                      on o.EmployeeID equals emp.EmployeeID
                                      select new
                                      {
                                          Pedido = o.OrderID,
                                          Empleado = emp.FirstName + " " + emp.LastName,
                                          Fecha = o.OrderDate
                                      }).ToList()   // ← AQUÍ forzamos ejecución para evitar errores
                                        .Select(x => new
                                        {
                                            x.Pedido,
                                            x.Empleado,
                                            Fecha = x.Fecha.HasValue
                                                      ? x.Fecha.Value.ToString("yyyy-MM-dd")
                                                      : "(sin fecha)"
                                        });

            gvConsultas.DataSource = pedidosConEmpleado.ToList();
            gvConsultas.DataBind();
        }

        protected void btnConsulta5_Click(object sender, EventArgs e)
        {
            var clientesBrasil = from c in db.Customers
                                 where c.Country == "Brazil"
                                 select new
                                 {
                                     c.CompanyName,
                                     c.ContactName
                                 };

            gvConsultas.DataSource = clientesBrasil.ToList();
            gvConsultas.DataBind();

        }

        protected void btnProyeccion1_Click(object sender, EventArgs e)
        {
            var totalPorProducto = from p in db.Products
                                   select new
                                   {
                                       Producto = p.ProductName,
                                       Total = p.UnitPrice * p.UnitsInStock
                                   };

            gvProyecciones.DataSource = totalPorProducto.ToList();
            gvProyecciones.DataBind();

        }

        protected void btnProyeccion2_Click(object sender, EventArgs e)
        {
            var añosPedidos = from o in db.Orders
                              select new
                              {
                                  o.OrderID,
                                  Año = o.OrderDate.HasValue ? (int?)o.OrderDate.Value.Year : null
                              };

            gvProyecciones.DataSource = añosPedidos.ToList();
            gvProyecciones.DataBind();
        }

        protected void btnProyeccion3_Click(object sender, EventArgs e)
        {
            var largoNombre = from c in db.Customers
                              select new
                              {
                                  Cliente = c.CompanyName,
                                  Largo = c.CompanyName.Length
                              };

            gvProyecciones.DataSource = largoNombre.ToList();
            gvProyecciones.DataBind();
        }

        protected void btnProyeccion4_Click(object sender, EventArgs e)
        {
            var titulos = from e1 in db.Employees
                          select new
                          {
                              e1.FirstName,
                              e1.LastName,
                              e1.Title
                          };

            gvProyecciones.DataSource = titulos.ToList();
            gvProyecciones.DataBind();

        }

        protected void btnProyeccion5_Click(object sender, EventArgs e)
        {
            var preciosConDescuento = from p in db.Products
                                      select new
                                      {
                                          p.ProductName,
                                          PrecioConDescuento = p.UnitPrice * 0.9m
                                      };

            gvProyecciones.DataSource = preciosConDescuento.ToList();
            gvProyecciones.DataBind();
        }

        protected void btnReiniciar_Click(object sender, EventArgs e)
        {
            gvAdministrar.DataSource = null;
            gvAdministrar.DataBind();

            gvConsultas.DataSource = null;
            gvConsultas.DataBind();

            gvProyecciones.DataSource = null;
            gvProyecciones.DataBind();

            // Opcional: Limpiar cualquier variable de sesión o ViewState relacionada
            ViewState["DatosAdministrar"] = null;
            ViewState["DatosConsultas"] = null;
            ViewState["DatosProyecciones"] = null;

            // Opcional: Mostrar mensaje de confirmación
            ScriptManager.RegisterStartupScript(this, this.GetType(), "reinicioExitoso",
                "alert('Todas las consultas han sido reiniciadas correctamente.');", true);
        }
    }
}