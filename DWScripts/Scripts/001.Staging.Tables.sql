CREATE TABLE staging.[Invoice](
	[InvoiceId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BillingAddress] [nvarchar](70) NULL,
	[BillingCity] [nvarchar](40) NULL,
	[BillingState] [nvarchar](40) NULL,
	[BillingCountry] [nvarchar](40) NULL,
	[BillingPostalCode] [nvarchar](10) NULL,
	[Total] [numeric](10, 2) NOT NULL
)
GO

CREATE TABLE staging.[InvoiceLine](
	[InvoiceLineId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL
)
GO


