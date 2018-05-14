CREATE TABLE [dbo].[ResponseLog] (
    [ResponseLogId]         BIGINT           NOT NULL IDENTITY (1, 1) CONSTRAINT [PK_ResponseLog] PRIMARY KEY CLUSTERED ([ResponseLogId] ASC),
    [FullUrl]               VARCHAR (200)    NOT NULL,
    [Path]                  VARCHAR (100)    NOT NULL,
    [HttpStatusCode]        SMALLINT         NOT NULL,
    [Data]                  VARCHAR (MAX)    NULL,
    [CorrelationId]         UNIQUEIDENTIFIER NOT NULL,
    [ResponseDate]          DATETIME2 (7)    NOT NULL,
    [ApplicationName]       VARCHAR(100)     NOT NULL,
    [ApplicationHostName]   VARCHAR(100)     NOT NULL,
    [AuditCreatedDate]      DATETIME2 (7)    NOT NULL CONSTRAINT [DF_ResponseLog_AuditCreatedDate] DEFAULT (GETUTCDATE()),
    [AuditCreatedByDbUser]  VARCHAR (100)    NOT NULL CONSTRAINT [DF_ResponseLog_AuditCreatedByDbUser] DEFAULT (SUSER_SNAME()),
    [AuditCreatedByApp]     VARCHAR (100)    NOT NULL CONSTRAINT [DF_ResponseLog_AuditCreatedByApp] DEFAULT (APP_NAME()),
    [AuditCreatedByHost]    VARCHAR (100)    NOT NULL CONSTRAINT [DF_ResponseLog_AuditCreatedByHost] DEFAULT (HOST_NAME())
);