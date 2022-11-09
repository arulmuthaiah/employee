using System;
using System.Collections.Generic;
using System.Text;

namespace Employee
{
    public class Employee
    {
        public Employee() {
            phoneNumbers = new HashSet<PhoneNumber>();
            address = new Address();
        }
        public int EmpId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public virtual Address address { get; set; }
        public ICollection<PhoneNumber> phoneNumbers { get; set; }
    }

    public class Address
    {
        public int AddressId { get; set; }
        public int EmpId { get;set; }
        public string StreetAddress { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public Employee employee { get; set; }
    }

    public class PhoneNumber
    {
        
        public int PhoneId { get; set; }
        public int EmpId { get; set; }
        public string Type { get; set; }
        public string Number { get; set; }
        public Employee employee { get; set; }
    }
}
