﻿using Microsoft.EntityFrameworkCore;
using P06Shop.Shared.Shop;

namespace P05Shop.API.Models
{
    public class DataContext : DbContext
    {

        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
            
        }

        public DbSet<Product> Products { get; set; }
    }
}
