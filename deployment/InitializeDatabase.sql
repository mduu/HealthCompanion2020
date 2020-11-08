create table [User]
(
    Id                   uniqueidentifier       not null
        constraint PK_User
            primary key nonclustered,
    Email                nvarchar(200)          not null,
    Mobile               nvarchar(20),
    Firstname            nvarchar(50),
    Lastname             nvarchar(50),
    Street               nvarchar(100),
    Zip                  nvarchar(6),
    City                 nvarchar(50),
    Birthday             datetime2,
    Country              nvarchar(50) default 'CH',
    Weight               int,
    Height               int,
    HasHplus             bit          default 0 not null,
    HasCoach             bit          default 0 not null,
    HasMedicalEvents     bit          default 0 not null,
    HasPrescriptionDrugs bit          default 0 not null,
    InsuranceNumber      nvarchar(30)
)
go

create table Activity
(
    Id           uniqueidentifier                           not null
        constraint PK_Activity
            primary key nonclustered,
    ActivityTime datetimeoffset default sysdatetimeoffset() not null,
    Title        nvarchar(300)                              not null,
    Description  nvarchar(max),
    ActivityType int            default 0                   not null,
    UserId       uniqueidentifier                           not null
        constraint FK_Activity_User_Id
            references [User]
)
go

create index IX_Activity_UserId_ActivityTime
    on Activity (UserId asc, ActivityTime desc, Id asc)
go

create table AcuteDisease
(
    Id               uniqueidentifier not null
        constraint AcutDesease_pk
            primary key nonclustered,
    UserId           uniqueidentifier not null
        constraint FK_AcutDesease_User_Id
            references [User]
            on delete cascade,
    AcuteDiseaseType int              not null
)
go

create index AcutDesease_UserId_Id_index
    on AcuteDisease (UserId, Id)
go

create table Disease
(
    Id          uniqueidentifier not null
        constraint Deseas_pk
            primary key nonclustered,
    UserId      uniqueidentifier not null
        constraint FK_Deseas_User_Id
            references [User]
            on delete cascade,
    DiseaseType int              not null
)
go

create index IX_Deseas_UserId_Id
    on Disease (UserId, Id)
go

create table Document
(
    Id             uniqueidentifier                           not null
        constraint PK_Document
            primary key nonclustered,
    UploadedAt     datetimeoffset default sysdatetimeoffset() not null,
    DocumentTime   datetimeoffset default sysdatetimeoffset() not null,
    UserId         uniqueidentifier                           not null
        constraint FK_Document_User_Id
            references [User],
    ActivityId     uniqueidentifier
        constraint FK_Document_Activity_Id
            references Activity,
    Filename       nvarchar(300)                              not null,
    Mimetype       nvarchar(60)                               not null,
    BlobIdentifier nvarchar(max)                              not null,
    Title          nvarchar(200),
    Description    nvarchar(max),
    DocumentType   int                                        not null
)
go

create index IX_Document_UserId_DocumentTime_Id
    on Document (UserId, DocumentTime, Id)
go

create index IX_Document_ActivityId_DocumentTime_Id
    on Document (ActivityId, DocumentTime, Id)
go

create index IDX_Document_UserId_DocumentType
    on Document (UserId, DocumentType)
go

create table Share
(
    Id                 uniqueidentifier not null
        constraint PK_Share
            primary key nonclustered,
    ShareKey           nvarchar(50)     not null,
    SharingUserId      uniqueidentifier not null
        constraint FK_Share_User_Id
            references [User],
    ValidFromTime      datetime2        not null,
    ValidUntilTime     datetime2        not null,
    AllowActivities    bit default 1    not null,
    AllowDocuments     bit default 1    not null,
    AllowComments      bit default 1    not null,
    AllowCommentsWrite bit default 1    not null,
    Email              nvarchar(200),
    AllowDiseases      bit default 0    not null,
    AllowAcuteDiseases bit default 0    not null
)
go

create index IX_Share_SharingUserId
    on Share (SharingUserId, Id)
go

create unique index IX_Share_ShareKey_Id
    on Share (ShareKey, Id)
go

create table __MigrationsHistory
(
    MigrationId nvarchar(150)               not null
        constraint PK___MigrationsHistory
            primary key,
    AppliedAt   datetime2 default getdate() not null
)
go

