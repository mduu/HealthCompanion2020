using System;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.Import
{
    public class RequestImportUserInteractor
    {
        private readonly IUserRepository userRepository;
        private readonly IDocumentRepository documentRepository;
        private readonly IDiseaseRepository diseaseRepository;
        private readonly IAcuteDiseaseRepository acuteDiseaseRepository;

        public RequestImportUserInteractor(
            IUserRepository userRepository,
            IDocumentRepository documentRepository,
            IDiseaseRepository diseaseRepository,
            IAcuteDiseaseRepository acuteDiseaseRepository)
        {
            this.userRepository = userRepository;
            this.documentRepository = documentRepository;
            this.diseaseRepository = diseaseRepository;
            this.acuteDiseaseRepository = acuteDiseaseRepository;
        }

        public async Task<object> ImportAsync(string insuranceNumber, DateTime birthday)
        {
            var user = await userRepository.GetByInsuranceNumberAndBirthdayAsync(insuranceNumber, birthday);
            if (user == null)
            {
                return null;
            }

            var docs = (await documentRepository.GetByUserIdAsync(user.Id)).ToList();
            var diseases = (await diseaseRepository.GetByUserIdAsync(user.Id)).ToList();
            var acuteDiseases = (await acuteDiseaseRepository.GetByUserIdAsync(user.Id)).ToList();

            return new
            {
                user.Id,
                user.Email,
                user.Mobile,
                user.Firstname,
                user.Lastname,
                user.Street,
                user.Zip,
                user.City,
                user.Country,
                user.Birthday,
                user.InsuranceNumber,
                user.Weight,
                user.Height,
                AvailableData = new
                {
                    user.HasHplus,
                    user.HasCoach,
                    user.HasMedicalEvents,
                    user.HasPrescriptionDrugs,
                },
                AvailableDocuments = new
                {
                    General = docs.Any(d => d.DocumentType == DocumentType.General),
                    Diagnosis = docs.Any(d => d.DocumentType == DocumentType.Diagnosis),
                    XRays = docs.Any(d => d.DocumentType == DocumentType.XRays),
                    CtScans = docs.Any(d => d.DocumentType == DocumentType.CtScans),
                    MedicalReports = docs.Any(d => d.DocumentType == DocumentType.MedicalReports),
                    LabResults = docs.Any(d => d.DocumentType == DocumentType.LabResults),
                    Prescription = docs.Any(d => d.DocumentType == DocumentType.Prescription),
                    VaccinationDetails = docs.Any(d => d.DocumentType == DocumentType.VaccinationDetails),
                    Bills = docs.Any(d => d.DocumentType == DocumentType.Bill)
                },
                Diseases = diseases.Select(d => d.DiseaseType),
                AcuteDiseases = acuteDiseases.Select(d => d.AcuteDiseaseType)
            };
        }
    }
}