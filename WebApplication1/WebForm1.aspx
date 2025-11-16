<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ptm - Consultas y Proyecciones</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --success-color: #2ecc71;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }
        
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .section-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .section-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
        }
        
        .section-header {
            background-color: var(--secondary-color);
            color: white;
            padding: 15px 20px;
            font-weight: 600;
        }
        
        .section-body {
            padding: 20px;
        }
        
        .btn-custom {
            border-radius: 6px;
            font-weight: 500;
            padding: 8px 16px;
            margin: 5px;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-success-custom {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }
        
        .btn-warning-custom {
            background-color: var(--warning-color);
            border-color: var(--warning-color);
        }
        
        .btn-danger-custom {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }
        
        .btn-info-custom {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        
        .table th {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .footer {
            background-color: var(--secondary-color);
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 30px;
            border-radius: 10px 10px 0 0;
        }
        
        .badge-section {
            background-color: var(--primary-color);
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            margin-left: 10px;
        }
        
        .section-icon {
            margin-right: 10px;
        }
        
        .action-bar {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid var(--primary-color);
        }
        
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #dee2e6;
        }
        
        .reset-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h1><i class="fas fa-chart-line"></i> PTM - Consultas y Proyecciones</h1>
                        <p class="mb-0">Sistema de administración y análisis de datos</p>
                    </div>
                    <div class="col-md-4 text-end">
                        <div class="btn-group">
                            <button type="button" class="btn btn-light btn-sm"><i class="fas fa-user"></i> Usuario</button>
                            <button type="button" class="btn btn-light btn-sm"><i class="fas fa-cog"></i> Configuración</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <!-- ==================== CRUD PRINCIPAL ==================== -->
            <div class="section-card">
                <div class="section-header">
                    <i class="fas fa-database section-icon"></i> Administración
                    <span class="badge-section">CRUD</span>
                </div>
                <div class="section-body">
                    <div class="mb-3">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" 
                            CssClass="btn btn-success btn-custom" />
                        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" 
                            CssClass="btn btn-warning btn-custom" />
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" 
                            CssClass="btn btn-danger btn-custom" />
                        <asp:Button ID="btnConsultar" runat="server" Text="Consultar" OnClick="btnConsultar_Click" 
                            CssClass="btn btn-primary btn-custom" />
                    </div>
                    
                    <div class="table-responsive">
                        <asp:GridView ID="gvAdministrar" runat="server" AutoGenerateColumns="true" 
                            CssClass="table table-striped table-hover" GridLines="None">
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ==================== CONSULTAS ==================== -->
            <div class="section-card">
                <div class="section-header">
                    <i class="fas fa-search section-icon"></i> Consultas
                    <span class="badge-section">5 Consultas</span>
                </div>
                <div class="section-body">
                    <div class="mb-3">
                        <asp:Button ID="btnConsulta1" runat="server" Text="Consulta 1" OnClick="btnConsulta1_Click" 
                            CssClass="btn btn-info-custom btn-custom" />
                        <asp:Button ID="btnConsulta2" runat="server" Text="Consulta 2" OnClick="btnConsulta2_Click" 
                            CssClass="btn btn-info-custom btn-custom" />
                        <asp:Button ID="btnConsulta3" runat="server" Text="Consulta 3" OnClick="btnConsulta3_Click" 
                            CssClass="btn btn-info-custom btn-custom" />
                        <asp:Button ID="btnConsulta4" runat="server" Text="Consulta 4" OnClick="btnConsulta4_Click" 
                            CssClass="btn btn-info-custom btn-custom" />
                        <asp:Button ID="btnConsulta5" runat="server" Text="Consulta 5" OnClick="btnConsulta5_Click" 
                            CssClass="btn btn-info-custom btn-custom" />
                    </div>
                    
                    <div class="table-responsive">
                        <asp:GridView ID="gvConsultas" runat="server" AutoGenerateColumns="true" 
                            CssClass="table table-striped table-hover" GridLines="None">
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ==================== PROYECCIONES ==================== -->
            <div class="section-card">
                <div class="section-header">
                    <i class="fas fa-chart-bar section-icon"></i> Proyecciones
                    <span class="badge-section">5 Proyecciones</span>
                </div>
                <div class="section-body">
                    <div class="mb-3">
                        <asp:Button ID="btnProyeccion1" runat="server" Text="Proyección 1" OnClick="btnProyeccion1_Click" 
                            CssClass="btn btn-primary-custom btn-custom" />
                        <asp:Button ID="btnProyeccion2" runat="server" Text="Proyección 2" OnClick="btnProyeccion2_Click" 
                            CssClass="btn btn-primary-custom btn-custom" />
                        <asp:Button ID="btnProyeccion3" runat="server" Text="Proyección 3" OnClick="btnProyeccion3_Click" 
                            CssClass="btn btn-primary-custom btn-custom" />
                        <asp:Button ID="btnProyeccion4" runat="server" Text="Proyección 4" OnClick="btnProyeccion4_Click" 
                            CssClass="btn btn-primary-custom btn-custom" />
                        <asp:Button ID="btnProyeccion5" runat="server" Text="Proyección 5" OnClick="btnProyeccion5_Click" 
                            CssClass="btn btn-primary-custom btn-custom" />
                    </div>
                    
                    <div class="table-responsive">
                        <asp:GridView ID="gvProyecciones" runat="server" AutoGenerateColumns="true" 
                            CssClass="table table-striped table-hover" GridLines="None">
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ==================== REINICIAR CONSULTAS ==================== -->
            <div class="section-card">
                <div class="section-header">
                    <i class="fas fa-eraser section-icon"></i> Limpiar Resultados
                </div>
                <div class="section-body">
                    <div class="alert alert-warning">
                        <i class="fas fa-exclamation-triangle"></i> 
                        Esta acción limpiará todos los resultados de consultas y proyecciones mostrados.
                    </div>
                    
                    <div class="text-center">
                        <asp:Button ID="btnReiniciar" runat="server" Text="Reiniciar Consultas" 
                            OnClick="btnReiniciar_Click" CssClass="btn btn-warning btn-lg" 
                            OnClientClick="return confirm('¿Está seguro de que desea reiniciar todas las consultas? Se perderán los resultados actuales.');" />
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="container">
                <p class="mb-0">PTM - Consultas y Proyecciones &copy; 2023</p>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


