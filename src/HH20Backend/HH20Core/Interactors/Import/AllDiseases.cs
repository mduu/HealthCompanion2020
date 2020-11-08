using System.Collections.Generic;
using HH20Core.Models;

namespace HH20Core.Interactors.Import
{
    public class AllDiseases
    {
        public List<DiseaseType> Diseases { get; set; }
        public List<AcuteDiseaseType> AcuteDiseases { get; set; }
    }
}