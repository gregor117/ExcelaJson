using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using Newtonsoft.Json;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Storage;

namespace MauiApp_Interfaz
{
    public partial class MainPage : ContentPage
    {
        private string rutaCatalogo;
        private string rutaVolumen;
        private bool _enProceso = false;
        private string _archivoResultadoPath;
        private List<string> _logIncidencias = new();

        public MainPage()
        {
            InitializeComponent();
            chkImpuestos.IsChecked = true;
            chkReposicion.IsChecked = true;
            chkPMP.IsChecked = false;
        }

        private async void OnSeleccionarArchivoCatalogoClicked(object sender, EventArgs e)
        {
            var result = await FilePicker.Default.PickAsync(new PickOptions { PickerTitle = "Selecciona archivo cat\u00e1logo" });
            if (result != null)
            {
                rutaCatalogo = result.FullPath;
                lblArchivoCatalogo.Text = Path.GetFileName(rutaCatalogo);
            }
        }

        private async void OnSeleccionarArchivoVolumenClicked(object sender, EventArgs e)
        {
            var result = await FilePicker.Default.PickAsync(new PickOptions { PickerTitle = "Selecciona archivo volumen" });
            if (result != null)
            {
                rutaVolumen = result.FullPath;
                lblArchivoVolumen.Text = Path.GetFileName(rutaVolumen);
            }
        }

        private async void OnIniciarProcesoClicked(object sender, EventArgs e)
        {
            if (_enProceso) return;
            _enProceso = true;

            try
            {
                if (rbSustituir?.IsChecked == true && rutaVolumen != null)
                {
                    bool continuar = await DisplayAlert("Advertencia",
                        "Los precios por volumen se van a eliminar y quedar\u00e1n solo los del archivo de origen \u00bfDesea continuar el proceso?",
                        "S\u00ed", "No");
                    if (!continuar) return;
                }

                bool respaldo = await DisplayAlert("Recomendaci\u00f3n",
                    "Recomendamos tener un respaldo reciente de su base de datos, \u00bfDesea continuar el proceso?",
                    "S\u00ed", "No");
                if (!respaldo) return;

                if (!await ValidarArchivos())
                {
                    await DisplayAlert("Error", "Error de layout en uno de los archivos.", "OK");
                    return;
                }

                string json = await GenerarJsonDesdeExcel(rutaCatalogo, rutaVolumen);
                editorJson.Text = json;

                await DisplayAlert("JSON Generado", "JSON generado correctamente, enviando a la API...", "OK");
                await LlamarApi(json);
                await GenerarExcelResultados();
                await GenerarLogIncidencias();
                await DisplayAlert("Proceso finalizado", $"Se generó el Excel de resultados y el log de incidencias:\n\n{_archivoResultadoPath}\n{_archivoResultadoPath.Replace(".xlsx", "_Log.json")}", "OK");
            }
            finally
            {
                _enProceso = false;
            }
        }
        private async Task GenerarExcelAsync()
        {

            string folderPath = FileSystem.Current.AppDataDirectory;


            string fileName = "PreciosComparativos.xlsx";


            string filePath = Path.Combine(folderPath, fileName);


            using var package = new ExcelPackage();
            var worksheet = package.Workbook.Worksheets.Add("Precios");

            worksheet.Cells[1, 1].Value = "Producto";
            worksheet.Cells[1, 2].Value = "Precio";


            await package.SaveAsAsync(new FileInfo(filePath));

            await Launcher.Default.OpenAsync(new OpenFileRequest
            {
                File = new ReadOnlyFile(filePath)
            });
        }
        private async Task GenerarExcelResultados()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            var nombreArchivo = $"Resultado_{DateTime.Now:yyyyMMdd_HHmmss}.xlsx";
            var ruta = Path.Combine(FileSystem.Current.AppDataDirectory, nombreArchivo);
            _archivoResultadoPath = ruta;

            using var package = new ExcelPackage();

            if (rutaCatalogo != null && File.Exists(rutaCatalogo))
            {
                var hojaCatalogo = package.Workbook.Worksheets.Add("Catalogo");
                hojaCatalogo.Cells[1, 1].Value = "Articulo";
                hojaCatalogo.Cells[1, 2].Value = "Precio Nuevo";
                hojaCatalogo.Cells[1, 3].Value = "PMP";
                hojaCatalogo.Cells[1, 4].Value = "Costo Reposición";

                using var packageCatalogo = new ExcelPackage(new FileInfo(rutaCatalogo));
                var hojaNombre = entryHojaCatalogo.Text?.Trim();
                var hoja = !string.IsNullOrEmpty(hojaNombre)
                    ? packageCatalogo.Workbook.Worksheets[hojaNombre]
                    : packageCatalogo.Workbook.Worksheets[0];

                int filaDestino = 2;
                for (int fila = 2; !string.IsNullOrEmpty(hoja.Cells[fila, 1].Text); fila++, filaDestino++)
                {
                    hojaCatalogo.Cells[filaDestino, 1].Value = hoja.Cells[fila, 1].Text;
                    hojaCatalogo.Cells[filaDestino, 2].Value = hoja.Cells[fila, 2].Text;
                    hojaCatalogo.Cells[filaDestino, 3].Value = hoja.Cells[fila, 4].Text;
                    hojaCatalogo.Cells[filaDestino, 4].Value = hoja.Cells[fila, 5].Text;
                }
            }

            if (rutaVolumen != null && File.Exists(rutaVolumen))
            {
                var hojaVolumen = package.Workbook.Worksheets.Add("Volumen");
                hojaVolumen.Cells[1, 1].Value = "Articulo";
                hojaVolumen.Cells[1, 2].Value = "Precio Nuevo";
                hojaVolumen.Cells[1, 3].Value = "Unidad";
                hojaVolumen.Cells[1, 4].Value = "Volumen";
                hojaVolumen.Cells[1, 5].Value = "Fórmula";

                using var packageVolumen = new ExcelPackage(new FileInfo(rutaVolumen));
                var hojaNombre = entryHojaVolumen.Text?.Trim();
                var hoja = !string.IsNullOrEmpty(hojaNombre)
                    ? packageVolumen.Workbook.Worksheets[hojaNombre]
                    : packageVolumen.Workbook.Worksheets[0];

                int filaDestino = 2;
                for (int fila = 2; !string.IsNullOrEmpty(hoja.Cells[fila, 1].Text); fila++, filaDestino++)
                {
                    hojaVolumen.Cells[filaDestino, 1].Value = hoja.Cells[fila, 1].Text;
                    hojaVolumen.Cells[filaDestino, 2].Value = hoja.Cells[fila, 2].Text;
                    hojaVolumen.Cells[filaDestino, 3].Value = hoja.Cells[fila, 3].Text;
                    hojaVolumen.Cells[filaDestino, 4].Value = hoja.Cells[fila, 4].Text;
                    hojaVolumen.Cells[filaDestino, 5].Value = hoja.Cells[fila, 5].Text;
                }
            }

            await package.SaveAsAsync(new FileInfo(ruta));
        }
        private async Task GenerarExcelPrecios(List<object> articulos)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            var filePath = Path.Combine(FileSystem.Current.AppDataDirectory, "PreciosComparativos.xlsx");

            using var package = new ExcelPackage();
            var hoja = package.Workbook.Worksheets.Add("Precios");


            hoja.Cells[1, 1].Value = "Artículo";
            hoja.Cells[1, 2].Value = "Precio Anterior";
            hoja.Cells[1, 3].Value = "Precio Nuevo";

            int fila = 2;
            foreach (dynamic art in articulos)
            {
                hoja.Cells[fila, 1].Value = art.Articulo;
                hoja.Cells[fila, 2].Value = art.PrecioAnterior;
                hoja.Cells[fila, 3].Value = art.Precio;
                fila++;
            }

            await package.SaveAsAsync(new FileInfo(filePath));

            await MostrarArchivo(filePath, "Excel generado con precios comparativos.");
        }
        private async Task GenerarLogIncidencias(List<string> incidencias)
        {
            var logNombre = "PreciosComparativosLog.json";
            var logRuta = Path.Combine(FileSystem.Current.AppDataDirectory, logNombre);

            var jsonLog = JsonConvert.SerializeObject(incidencias, Formatting.Indented);
            await File.WriteAllTextAsync(logRuta, jsonLog);

            await MostrarArchivo(logRuta, "Log de incidencias generado.");
        }
        private async Task MostrarArchivo(string ruta, string mensaje)
        {
            bool abrir = await DisplayAlert("Archivo generado", $"{mensaje}\n¿Deseas abrir el archivo?", "Sí", "No");
            if (abrir)
            {
                await Launcher.Default.OpenAsync(new OpenFileRequest
                {
                    File = new ReadOnlyFile(ruta)
                });
            }
        }
        private async Task CompartirArchivo(string ruta)
        {
            await Share.Default.RequestAsync(new ShareFileRequest
            {
                Title = "Descargar archivo",
                File = new ShareFile(ruta)
            });
        }
        private async void OnGenerarExcelClicked(object sender, EventArgs e)
        {
            try
            {
                await GenerarExcelResultados();
                await DisplayAlert("Éxito", "El archivo Excel se generó correctamente.", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"No se pudo generar el archivo: {ex.Message}", "OK");
            }
        }

        private async Task<bool> ValidarArchivos()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            try
            {
                if (rutaCatalogo != null)
                {
                    using var package = new ExcelPackage(new FileInfo(rutaCatalogo));
                    var hojaNombre = entryHojaCatalogo.Text?.Trim();
                    var hoja = !string.IsNullOrEmpty(hojaNombre)
                        ? package.Workbook.Worksheets[hojaNombre]
                        : package.Workbook.Worksheets.Count > 0 ? package.Workbook.Worksheets[0] : null;

                    if (hoja == null)
                    {
                        await DisplayAlert("Error", "No se encontr\u00f3 la hoja del cat\u00e1logo.", "OK");
                        return false;
                    }

                    for (int fila = 2; !string.IsNullOrEmpty(hoja.Cells[fila, 1].Text); fila++)
                    {
                        if (!EsNumero(hoja.Cells[fila, 2].Text) || !EsNumero(hoja.Cells[fila, 4].Text) || !EsNumero(hoja.Cells[fila, 5].Text))
                            return false;
                    }
                }

                if (rutaVolumen != null)
                {
                    using var package = new ExcelPackage(new FileInfo(rutaVolumen));
                    var hojaNombre = entryHojaVolumen.Text?.Trim();
                    var hoja = !string.IsNullOrEmpty(hojaNombre)
                        ? package.Workbook.Worksheets[hojaNombre]
                        : package.Workbook.Worksheets.Count > 1 ? package.Workbook.Worksheets[1] : package.Workbook.Worksheets[0];

                    if (hoja == null)
                    {
                        await DisplayAlert("Error", "No se encontr\u00f3 la hoja de volumen.", "OK");
                        return false;
                    }

                    for (int fila = 2; !string.IsNullOrEmpty(hoja.Cells[fila, 1].Text); fila++)
                    {
                        if (!EsNumero(hoja.Cells[fila, 2].Text) || !EsNumero(hoja.Cells[fila, 4].Text))
                            return false;
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }
        private async Task GenerarLogIncidencias()
        {
            if (_logIncidencias.Count == 0)
                _logIncidencias.Add("No se detectaron incidencias.");

            var jsonLog = JsonConvert.SerializeObject(_logIncidencias, Formatting.Indented);
            var rutaLog = _archivoResultadoPath.Replace(".xlsx", "_Log.json");
            await File.WriteAllTextAsync(rutaLog, jsonLog);
        }

        private bool EsNumero(string texto)
        {
            return double.TryParse(texto, System.Globalization.NumberStyles.Any, System.Globalization.CultureInfo.InvariantCulture, out _);
        }

        private async Task<string> GenerarJsonDesdeExcel(string rutaCatalogo, string rutaVolumen)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            var articulos = new List<object>();
            var volumenes = new List<object>();

            if (!string.IsNullOrEmpty(rutaCatalogo) && File.Exists(rutaCatalogo))
            {
                using var package = new ExcelPackage(new FileInfo(rutaCatalogo));
                var hojaNombre = entryHojaVolumen.Text?.Trim();
                var hoja = !string.IsNullOrEmpty(hojaNombre)
                    ? package.Workbook.Worksheets[hojaNombre]
                    : package.Workbook.Worksheets.Count > 1
                        ? package.Workbook.Worksheets[1]
                        : package.Workbook.Worksheets[0];

                int fila = 2;
                while (!string.IsNullOrEmpty(hoja.Cells[fila, 1].Text))
                {
                    articulos.Add(new
                    {
                        Articulo = hoja.Cells[fila, 1].Text,
                        Precio = double.Parse(hoja.Cells[fila, 2].Text),
                        Unidad = hoja.Cells[fila, 3].Text,
                        PMP = double.Parse(hoja.Cells[fila, 4].Text),
                        CReposicion = double.Parse(hoja.Cells[fila, 5].Text)
                    });
                    fila++;
                }
            }

            if (!string.IsNullOrEmpty(rutaVolumen) && File.Exists(rutaVolumen))
            {
                using var package = new ExcelPackage(new FileInfo(rutaVolumen));
                var hojaNombre = entryHojaVolumen.Text?.Trim();
                var hoja = !string.IsNullOrEmpty(hojaNombre) ? package.Workbook.Worksheets[hojaNombre] : package.Workbook.Worksheets[0];

                int fila = 2;
                while (!string.IsNullOrEmpty(hoja.Cells[fila, 1].Text))
                {
                    volumenes.Add(new
                    {
                        Articulo = hoja.Cells[fila, 1].Text,
                        Precio = double.Parse(hoja.Cells[fila, 2].Text),
                        Unidad = hoja.Cells[fila, 3].Text,
                        Volumen = Convert.ToInt32(double.Parse(hoja.Cells[fila, 4].Text)),
                        Formula = hoja.Cells[fila, 5].Text
                    });
                    fila++;
                }
            }

            var payload = new
            {
                Usuario = "SIST",
                OrigenPrecio = rutaCatalogo != null ? Path.GetFileName(rutaCatalogo) : "",
                OrigenVolumen = rutaVolumen != null ? Path.GetFileName(rutaVolumen) : "",
                PrecVolumen = rbSustituir?.IsChecked == false ? "Sustituir" : "Actualizar",
                PrecioConImpto = chkImpuestos?.IsChecked == true,
                CostoRepCero = chkReposicion?.IsChecked == true,
                PrecioMaxPublico = chkPMP?.IsChecked == false,
                Articulos = articulos,
                Volumenes = volumenes
            };

            return JsonConvert.SerializeObject(payload, Formatting.Indented);
        }

        private async Task LlamarApi(string json)
        {
            var cliente = new HttpClient();
            var jsonData = json;
            var content = new StringContent(json, Encoding.UTF8, "application/json");


            var urlBase = Preferences.Get("UrlBase", string.Empty);

            if (string.IsNullOrWhiteSpace(urlBase))
            {
                await DisplayAlert("Error", "No se ha definido una URL base. Por favor, inicia sesión nuevamente.", "OK");
                return;
            }

            var urlCompleta = $"{urlBase}";
            var respuesta = await cliente.PostAsync(urlCompleta, content);
            var respuestaContenido = await respuesta.Content.ReadAsStringAsync();

            Console.WriteLine(json);
            Console.WriteLine(respuestaContenido);

            editorJson.Text = "Respuesta de la API:\n" + respuestaContenido;

            if (respuesta.IsSuccessStatusCode)
                await DisplayAlert("\u00c9xito", "Datos enviados correctamente.", "OK");
            else
                await DisplayAlert("Error", "Error al enviar los datos a la API.", "OK");
        }

        private void OnReiniciarClicked(object sender, EventArgs e)
        {
            rutaCatalogo = null;
            rutaVolumen = null;

            lblArchivoCatalogo.Text = "Archivo no seleccionado";
            lblArchivoVolumen.Text = "Archivo no seleccionado";

            editorJson.Text = string.Empty;

            rbActualizar.IsChecked = true;
            chkImpuestos.IsChecked = true;
            chkReposicion.IsChecked = true;
            chkPMP.IsChecked = false;

            DisplayAlert("Listo", "Formulario reiniciado. Puedes seleccionar nuevos archivos.", "OK");
        }
    }
}