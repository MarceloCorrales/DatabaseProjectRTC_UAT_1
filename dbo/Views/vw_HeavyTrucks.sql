CREATE view [dbo].[vw_HeavyTrucks]
as
SELECT TOP 100000
     'Auction' as Source 
     ,e.Name 'Make' 
     --,[Model] 
     ,[Year] 
	 ,avg([HoursMiles]) AvgHoursMiles
	 ,avg([SalePrice]) AvgSalePrice
	 ,count(1) CountSale
	 ,c.Name 'Category'
	 ,s.Name 'SubCategory'
	 ,CASE WHEN s.SiteSubCategoryName in
		('heavy-duty-trucks-dump-trucks','heavy-duty-trucks-dump-chassis-trucks','heavy-duty-trucks-bucket-trucks-boom-trucks')
		THEN 'Vocational'
		WHEN  s.SiteSubCategoryName in
		('heavy-duty-trucks-dump-chassis-trucks','heavy-duty-trucks-conventional-trucks-w-sleeper','heavy-duty-trucks-conventional-trucks-w-o-sleeper')
		THEN 'Road'
		ELSE
	 s.SiteSubCategoryName END SiteSubCategoryName
	FROM 
	[dbo].[TruckPaperEquipment] T (NOLOCK)
	JOIN [dbo].[EquipmentCategoryManufacturer] e (NOLOCK) ON t.[EquipmentCategoryManufacturerId] = e.id 
	JOIN [dbo].[EquipmentCategory] c (NOLOCK) ON E.EquipmentCategoryId = c.Id 
    LEFT JOIN [dbo].[EquipmentSubCategory] s (NOLOCK)ON c.Id = s.EquipmentCategoryId AND T.EquipmentSubCategoryId = S.ID AND  s.SiteId = 1 
	WHERE [HoursMiles] <> 0
	AND e.Name IN ('Freightliner','Peterbilt','Kenworth')
	AND t.year > 1920
	GROUP BY
	 e.Name  
   --  ,[Model] 
     ,[Year] 
	 ,c.Name 
	 ,s.Name 
	 ,CASE WHEN s.SiteSubCategoryName in
		('heavy-duty-trucks-dump-trucks','heavy-duty-trucks-dump-chassis-trucks','heavy-duty-trucks-bucket-trucks-boom-trucks')
		THEN 'Vocational'
		WHEN  s.SiteSubCategoryName in
		('heavy-duty-trucks-dump-chassis-trucks','heavy-duty-trucks-conventional-trucks-w-sleeper','heavy-duty-trucks-conventional-trucks-w-o-sleeper')
		THEN 'Road'
		ELSE
	 s.SiteSubCategoryName END
	 ORDER BY 
		2,3,4

GO

