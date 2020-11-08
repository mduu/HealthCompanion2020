using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
    [Table("User")]
    public class User
    {
        [ExplicitKey]
        public Guid Id { get; set; }
        public string InsuranceNumber { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Street { get; set; }
        public string Zip { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public DateTime Birthday { get; set; }
        public int Weight { get; set; }
        public int Height { get; set; }
        public bool HasHplus { get; set; }
        public bool HasCoach { get; set; }
        public bool HasMedicalEvents { get; set; }
        public bool HasPrescriptionDrugs { get; set; }
    }
}