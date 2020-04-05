USE dataBanco;

/*Proyectos iniciados en 2011*/
SELECT COUNT(*) FROM project WHERE transaction_start_year_project LIKE '2011';

/*Proyecto de mayor duracion*/
SELECT id_code_project,title_project,start_actual_isodate_project,end_actual_isodate_project, DATEDIFF( DATE_FORMAT(STR_TO_DATE(end_actual_isodate_project,'%d/%m/%Y'),'%Y/%m/%d'),DATE_FORMAT(STR_TO_DATE(start_actual_isodate_project,'%d/%m/%Y'),'%Y/%m/%d')) AS dias_duracion FROM project ORDER BY dias_duracion DESC LIMIT 1; 

/*Proyecto de menor duracion*/
SELECT id_code_project,title_project,start_actual_isodate_project,end_actual_isodate_project, DATEDIFF( DATE_FORMAT(STR_TO_DATE(end_actual_isodate_project,'%d/%m/%Y'),'%Y/%m/%d'),DATE_FORMAT(STR_TO_DATE(start_actual_isodate_project,'%d/%m/%Y'),'%Y/%m/%d')) AS dias_duracion FROM project WHERE  end_actual_isodate_project != '' ORDER BY dias_duracion ASC LIMIT 1; 

/*Top 5 paises con mas proyectos*/
SELECT country.name_country, COUNT(*) AS projects_count FROM project LEFT JOIN country ON project.country_id_country = country.id_country GROUP BY country.name_country ORDER BY projects_count DESC LIMIT 5;

/*Top 5 paises con menos proyectos*/
SELECT country.name_country, COUNT(*) AS projects_count FROM project LEFT JOIN country ON project.country_id_country = country.id_country GROUP BY country.name_country ORDER BY projects_count ASC LIMIT 5;

/*Cual fue el proyecto con mas costo*/
SELECT project_id_project,project.title_project,SUM(value_transaction) AS costo_proyecto FROM tbl_transaction LEFT JOIN project ON tbl_transaction.project_id_project = project.id_project GROUP BY project_id_project ORDER BY costo_proyecto DESC LIMIT 1;

/*Proyecto con menos costo*/
SELECT project_id_project,project.title_project,SUM(value_transaction) AS costo_proyecto FROM tbl_transaction LEFT JOIN project ON tbl_transaction.project_id_project = project.id_project GROUP BY project_id_project ORDER BY costo_proyecto ASC LIMIT 1;

/*5 Proyectos mas costos*/
SELECT project_id_project,project.title_project,SUM(value_transaction) AS costo_proyecto FROM tbl_transaction LEFT JOIN project ON tbl_transaction.project_id_project = project.id_project GROUP BY project_id_project ORDER BY costo_proyecto DESC LIMIT 5;

/*Costo Total de todos los proyectos*/
SELECT SUM(value_transaction) AS costo_total FROM tbl_transaction;

/*3 Transacciones mas costosas RI-East Africa Public Helath Laboratory Networking Project*/
SELECT project_id_project,project.title_project,value_transaction FROM tbl_transaction LEFT JOIN project ON tbl_transaction.project_id_project = project.id_project WHERE project.title_project LIKE 'AFCC2/RI-East Africa Public Health Laboratory Networking Project' ORDER BY value_transaction DESC LIMIT 3;

