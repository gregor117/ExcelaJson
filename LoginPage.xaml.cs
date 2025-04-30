using System.Net.Http.Json;
using System;
using System.Net.Http;
using Microsoft.Maui.Controls;

namespace MauiApp_Interfaz;

public partial class LoginPage : ContentPage
{

    private readonly string urlBase = ""; 

    public LoginPage()
    {
        InitializeComponent();
    }

    private async void OnLoginClicked(object sender, EventArgs e)
    {
        mensajeLabel.IsVisible = true;

        string usuario = usuarioEntry.Text;
        string pass = contrasenaEntry.Text;

        if (string.IsNullOrWhiteSpace(usuario) || string.IsNullOrWhiteSpace(pass))
        {
            mensajeLabel.TextColor = Colors.Red;
            mensajeLabel.Text = "Por favor llena todos los campos: usuario y contraseña.";
            return;
        }

        string url = $"";

        try
        {
            using var client = new HttpClient();

            var credenciales = new
            {
                usuario = usuario,
                pass = pass
            };

            var response = await client.PostAsJsonAsync(url, credenciales);

            if (response.IsSuccessStatusCode)
            {
                mensajeLabel.TextColor = Colors.Green;
                mensajeLabel.Text = "Inicio de sesión exitoso.";

                
                Application.Current.MainPage = new AppShell();
            }
            else
            {
                mensajeLabel.TextColor = Colors.Red;
                mensajeLabel.Text = "Usuario o contraseña incorrectos.";
            }
        }
        catch (Exception ex)
        {
            mensajeLabel.TextColor = Colors.Red;
            mensajeLabel.Text = $"Error de conexión: {ex.Message}";
        }
    }
}
