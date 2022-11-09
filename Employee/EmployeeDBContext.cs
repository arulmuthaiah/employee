using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace Employee
{
    public class EmployeeDBContext : DbContext
    {

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=EmployeeDB;Trusted_Connection=True;");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.EmpId);

                entity.HasOne<Address>(s => s.address)
                .WithOne(g => g.employee).HasForeignKey<Address>(g => g.EmpId);

                entity.HasMany<PhoneNumber>(s => s.phoneNumbers)
                .WithOne(g => g.employee).HasForeignKey(s => s.EmpId);
            });

            modelBuilder.Entity<Address>(entity => {
                entity.HasKey(e => e.AddressId);
            });

            modelBuilder.Entity<PhoneNumber>(entity => {
                entity.HasKey(e => e.PhoneId);
            });
        }

        public DbSet<Employee> employees { get; set; }
        public DbSet<Address> addresses { get; set; }
        public DbSet<PhoneNumber> phoneNumbers { get; set; }
    }
}
