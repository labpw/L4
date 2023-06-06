using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using P04WeatherForecastAPI.Client.Models;
using P04WeatherForecastAPI.Client.Services.WeatherServices;
using P06Shop.Shared.Services.ProductService;
using P06Shop.Shared.Shop;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;

namespace P04WeatherForecastAPI.Client.ViewModels
{
    public partial class ProductsViewModel : ObservableObject
    {
        private readonly IProductService _productService;
        private readonly ProductDetailsView _productDetailsView;
        public ObservableCollection<Product> Products { get; set; }

        [ObservableProperty]
        private Product selectedProduct;  

        public ProductsViewModel(IProductService productService, ProductDetailsView productDetailsView)
        {
            _productDetailsView = productDetailsView;
            _productService = productService;
            Products = new ObservableCollection<Product>();          
        }

        public async void GetProducts()
        {
            var productsResult = await _productService.GetProductsAsync();
            if (productsResult.Success)
            {
                foreach (var p in productsResult.Data)
                {
                    Products.Add(p);
                }
            }
        }

        public async void CreateProduct()
        {
            var newProduct = new Product()
            {
                Title = selectedProduct.Title,
                Description = selectedProduct.Description,
                Barcode = selectedProduct.Barcode,
                Price = selectedProduct.Price,
                ReleaseDate = selectedProduct.ReleaseDate,
            };

            await _productService.CreateProductAsync(newProduct);
            GetProducts();
        }

        public async void UpdateProduct()
        {
            var productToUpdate = new Product()
            {
                Id = selectedProduct.Id,
                Title = selectedProduct.Title,
                Description = selectedProduct.Description,
                Barcode = selectedProduct.Barcode,
                Price = selectedProduct.Price,
                ReleaseDate = selectedProduct.ReleaseDate,
            };

            await _productService.UpdateProductAsync(productToUpdate);
            GetProducts();
        }

        public async void DeleteProduct()
        {
            await _productService.DeleteProductAsync(selectedProduct.Id);
            GetProducts();
        }

        [RelayCommand]
        public async void ShowDetails(Product product)
        {
            _productDetailsView.Show();
            _productDetailsView.DataContext = product;
        }

    }
}
