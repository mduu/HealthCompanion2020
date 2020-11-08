using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
    [Table("Disease")]
    public class Disease
    {
        [ExplicitKey]
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public DiseaseType DiseaseType { get; set; }

        public string GetCaption()
            => DiseaseType switch
            {
                DiseaseType.AlzheimerDisease => "Alzheimer diseas",
                DiseaseType.Dementia => "Dementia",
                DiseaseType.Arthritis => "Arthritis",
                DiseaseType.Asthma => "Asthma",
                DiseaseType.Cancer => "Cancer",
                DiseaseType.Copd => "COPD",
                DiseaseType.CrohnDisease => "Crohn Disease",
                DiseaseType.CysticFibrosis => "Cystic fibrosis",
                DiseaseType.DiabetesType1 => "Diabetes type 1",
                DiseaseType.DiabetesType2 => "Diabetes type 2",
                DiseaseType.Epilepsy => "Epilepsy",
                DiseaseType.HeartDisease => "Heart disease",
                DiseaseType.Hiv => "HIV / AIDS",
                DiseaseType.MoodDisorders => "Mood disorders",
                DiseaseType.MultipleSclerosis => "Multiple sclerosis",
                DiseaseType.Osteoporosis => "Osteoporosis",
                DiseaseType.ParkinsonDisease => "Parkinson disease",
                _ => "Unknown disease"
            };
    }
}