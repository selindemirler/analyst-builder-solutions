SELECT company, ROUND((employees_fired::NUMERIC / company_size) * 100,2) AS Percentage_Laid_Off
FROM tech_layoffs
ORDER BY company ASC;