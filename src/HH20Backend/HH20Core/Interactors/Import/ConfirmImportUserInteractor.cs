using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.Import
{
    public class ConfirmImportUserInteractor
    {
        private readonly IDiseaseRepository diseaseRepository;
        private readonly IAcuteDiseaseRepository acuteDiseaseRepository;

        public ConfirmImportUserInteractor(
            IDiseaseRepository diseaseRepository,
            IAcuteDiseaseRepository acuteDiseaseRepository)
        {
            this.diseaseRepository = diseaseRepository;
            this.acuteDiseaseRepository = acuteDiseaseRepository;
        }

        public async Task Confirm(Guid userId, AllDiseases allDiseases)
        {
            await SyncDiseasesAsync(userId, allDiseases.Diseases);
            await SyncAcuteDiseasesAsync(userId, allDiseases.AcuteDiseases);
        }

        private async Task SyncDiseasesAsync(Guid userId, List<DiseaseType> diseaseTypes)
        {
            var existingDiseases = await diseaseRepository.GetByUserIdAsync(userId);

            foreach (var disease in existingDiseases)
            {
                await diseaseRepository.DeleteAsync(disease);
            }

            foreach (var diseaseType in diseaseTypes)
            {
                await diseaseRepository.InsertAsync(new Disease
                {
                    Id = Guid.NewGuid(),
                    DiseaseType = diseaseType,
                    UserId = userId,
                });
            }
        }

        private async Task SyncAcuteDiseasesAsync(Guid userId, List<AcuteDiseaseType> acuteDiseaseTypes)
        {
            var existingAcuteDiseases = await acuteDiseaseRepository.GetByUserIdAsync(userId);

            foreach (var acuteDisease in existingAcuteDiseases)
            {
                await acuteDiseaseRepository.DeleteAsync(acuteDisease);
            }

            foreach (var acuteDiseaseType in acuteDiseaseTypes)
            {
                await acuteDiseaseRepository.InsertAsync(new AcuteDisease
                {
                    Id = Guid.NewGuid(),
                    AcuteDiseaseType = acuteDiseaseType,
                    UserId = userId,
                });
            }
        }
    }
}