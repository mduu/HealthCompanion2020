using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
    [Table("AcuteDisease")]
    public class AcuteDisease
    {
        [ExplicitKey]
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public AcuteDiseaseType AcuteDiseaseType { get; set; }

        public string GetCaption()
            => AcuteDiseaseType switch
            {
                AcuteDiseaseType.BrokenBoneArm => "Broken bone > arm",
                AcuteDiseaseType.BrokenBoneLeg => "Broken bone > leg",
                AcuteDiseaseType.BrokenBoneCollar => "Broken Bone > collar",
                AcuteDiseaseType.Burn => "Burn",
                AcuteDiseaseType.CommonCold => "Common cold",
                AcuteDiseaseType.Flu => "Flu",
                AcuteDiseaseType.HeartAttack => "Heart attack",
                AcuteDiseaseType.RespiratoryInfectionBronchitis => "Respiratory infection > bronchitis",
                AcuteDiseaseType.RespiratoryInfectionCovid19 => "Respiratory infection > COVID-19",
                AcuteDiseaseType.RespiratoryInfectionPneumonia => "Respiratory infection > Pneumonia",
                AcuteDiseaseType.StrepThroat => "Strep throat",
                AcuteDiseaseType.TornLigamentsKnee => "Torn ligaments > knee",
                AcuteDiseaseType.TornLigamentsFoot => "Torn ligaments > food",
                AcuteDiseaseType.TornLigamentsUpperBody => "Torn ligaments > upper body",
                AcuteDiseaseType.Other => "Other",
                _ => "Unknown acute disease"
            };
    }
}