using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;

namespace Employee
{
    public class Program
    {
        static void Main(string[] args)
        {
            string jsonData = "{ \"firstName\": \"John\", \"lastName\": \"Smith\", \"age\": 25, \"address\": { \"streetAddress\": \"21 2nd Street\", \"city\": \"New York\", \"state\": \"NY\", \"postalCode\": \"10021\" }, \"phoneNumber\": [ { \"type\": \"home\", \"number\": \"212 555-1234\" }, { \"type\": \"fax\", \"number\": \"646 555-4567\" } ] }";

            EmployeeData employeeData = JsonSerializer.Deserialize<EmployeeData>(jsonData);

            var context = new EmployeeDBContext();

            var employee = new Employee();

            employee.FirstName = employeeData.firstName;
            employee.LastName = employeeData.lastName;
            employee.Age= employeeData.age;
            employee.address.StreetAddress = employeeData.address.streetAddress;
            employee.address.City = employeeData.address.city;
            employee.address.State = employeeData.address.state;
            employee.address.PostalCode = employeeData.address.postalCode;
            foreach (var item in employeeData.phoneNumber)
            {
                var phoneNumberItem = new PhoneNumber();

                phoneNumberItem.Type = item.type;
                phoneNumberItem.Number = item.number;
                employee.phoneNumbers.Add(phoneNumberItem);
            }

            context.employees.Add(employee);
            context.SaveChanges();

            Console.WriteLine("Employee Data Saved Successfully");
        }
    }


    public class AddressData
    {
        public string streetAddress { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string postalCode { get; set; }
    }

    public class PhoneNumberData
    {
        public string type { get; set; }
        public string number { get; set; }
    }

    public class EmployeeData
    {
        
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int age { get; set; }
        public AddressData address { get; set; }
        public ICollection<PhoneNumberData> phoneNumber { get; set; }
    }
}


