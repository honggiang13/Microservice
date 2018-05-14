CREATE TABLE [dbo].[ErrorLog] (
    [ErrorLogId]            BIGINT           NOT NULL IDENTITY (1, 1) CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED ([ErrorLogId] ASC),
    [FullUrl]               VARCHAR (200)    NULL,
    [Path]                  VARCHAR (100)    NULL,
    [Message]               VARCHAR (MAX)    NULL,
    [StackTrace]            VARCHAR (MAX)    NULL,
    [Data]                  VARCHAR (MAX)    NULL,
    [CorrelationId]         UNIQUEIDENTIFIER NOT NULL,
    [ErrorDate]             DATETIME2 (7)    NULL,
    [ApplicationName]       VARCHAR (100)    NOT NULL,
    [ApplicationHostName]   VARCHAR (100)    NOT NULL,
    [AuditCreatedDate]      DATETIME2 (7)    NOT NULL CONSTRAINT [DF_ErrorLog_AuditCreatedDate] DEFAULT (GETUTCDATE()),
    [AuditCreatedByDbUser]  VARCHAR (100)    NOT NULL CONSTRAINT [DF_ErrorLog_AuditCreatedByDbUser] DEFAULT (SUSER_SNAME()),
    [AuditCreatedByApp]     VARCHAR (100)    NOT NULL CONSTRAINT [DF_ErrorLog_AuditCreatedByApp] DEFAULT (APP_NAME()),
    [AuditCreatedByHost]    VARCHAR (100)    NOT NULL CONSTRAINT [DF_ErrorLog_AuditCreatedByHost] DEFAULT (HOST_NAME())
);