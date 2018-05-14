CREATE TABLE [dbo].[RequestLog] (
    [RequestLogId]          BIGINT           NOT NULL IDENTITY (1, 1) CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED ([RequestLogId] ASC),
    [FullUrl]               VARCHAR (200)    NOT NULL,
    [Path]                  VARCHAR (100)    NOT NULL,
    [Data]                  VARCHAR (MAX)    NULL,
    [CorrelationId]         UNIQUEIDENTIFIER NOT NULL,
    [RequestDate]           DATETIME2 (7)    NOT NULL,
    [ApplicationName]       VARCHAR(100)     NOT NULL,
    [ApplicationHostName]   VARCHAR(100)     NOT NULL,
    [AuditCreatedDate]      DATETIME2 (7)    NOT NULL CONSTRAINT [DF_RequestLog_AuditCreatedDate] DEFAULT (GETUTCDATE()),
    [AuditCreatedByDbUser]  VARCHAR (100)    NOT NULL CONSTRAINT [DF_RequestLog_AuditCreatedByDbUser] DEFAULT (SUSER_SNAME()),
    [AuditCreatedByApp]     VARCHAR (100)    NOT NULL CONSTRAINT [DF_RequestLog_AuditCreatedByApp] DEFAULT (APP_NAME()),
    [AuditCreatedByHost]    VARCHAR (100)    NOT NULL CONSTRAINT [DF_RequestLog_AuditCreatedByHost] DEFAULT (HOST_NAME())
);