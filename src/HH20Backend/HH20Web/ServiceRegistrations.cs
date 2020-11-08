using HH20Core.Configuration;
using HH20Core.Interactors.Comments;
using HH20Core.Interactors.Documents;
using HH20Core.Interactors.Import;
using HH20Core.Interactors.ShareViewing;
using HH20Core.Interactors.Users;
using HH20Core.Interactors.Users.Creation;
using HH20Core.Repositories;
using HH20Core.Services.DocumentStorage;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace HH20Web
{
    public static class ServiceRegistrations
    {
        // ReSharper disable once InconsistentNaming
        public static IServiceCollection AddHH20(this IServiceCollection services, IConfiguration configuration)
        {
            // Add DI registration here

            // Config stuff
            services.AddSingleton(new DatabaseConfiguration(configuration.GetConnectionString("HH20")));
            services.AddSingleton(configuration
                .GetSection(BlobDocumentStorageOptions.BlobDocumentStorage)
                .Get<BlobDocumentStorageOptions>());

            RegisterRepositories(services);
            RegisterInteractors(services);
            RegisterOtherServices(services);

            return services;
        }

        private static void RegisterRepositories(IServiceCollection services)
        {
            services.AddTransient<IActivityRepository, ActivityRepository>();
            services.AddTransient<IDocumentRepository, DocumentRepository>();
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IDiseaseRepository, DiseaseRepository>();
            services.AddTransient<IAcuteDiseaseRepository, AcuteDiseaseRepository>();
            services.AddTransient<IShareRepository, ShareRepository>();
            services.AddTransient<ICommentsRepository, CommentsRepository>();
        }

        private static void RegisterInteractors(IServiceCollection services)
        {
            services.AddTransient<ActivityInteractor>();
            services.AddTransient<RequestImportUserInteractor>();
            services.AddTransient<ConfirmImportUserInteractor>();
            services.AddTransient<DocumentsInteractor>();
            services.AddTransient<GetAllSharedDataInteractor>();
            services.AddTransient<GetSharedActivitiesInteractor>();
            services.AddTransient<InsertActivityInteractor>();
            services.AddTransient<ShareInteractor>();
            services.AddTransient<GetSharedDocumentsInteractor>();
            services.AddTransient<CommentsInteractor>();
        }

        private static void RegisterOtherServices(IServiceCollection services)
        {
            services.AddSingleton<IDocumentStorage, BlobDocumentStorage>();
        }
    }
}