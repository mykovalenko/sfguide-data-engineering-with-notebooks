--!jinja

/*-----------------------------------------------------------------------------
Hands-On Lab: Intro to Data Engineering with Notebooks
Script:       deploy_notebooks.sql
Author:       Jeremiah Hansen
Last Updated: 6/11/2024
Editor:       Mykola Kovalenko
Last Updated: 10/12/2024
-----------------------------------------------------------------------------*/

-- See https://docs.snowflake.com/en/LIMITEDACCESS/execute-immediate-from-template

-- Create the Notebooks
--USE SCHEMA {{env}}_SCHEMA;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"DEMO"."PYPLINES_{{env}}"."NB_Demo_Pyplines_{{env}}_06_load_excel_files"')
    FROM '@"DEMO"."PYPLINES"."REPO_GIT_DEMO_PYPLINES"/branches/"{{branch}}"/notebooks/06_load_excel_files/'
    QUERY_WAREHOUSE = 'WH_DEMO_PYPLINES'
    MAIN_FILE = '06_load_excel_files.ipynb';

ALTER NOTEBOOK "DEMO"."PYPLINES_{{env}}"."NB_Demo_Pyplines_{{env}}_06_load_excel_files" ADD LIVE VERSION FROM LAST;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"DEMO"."PYPLINES_{{env}}"."NB_Demo_Pyplines_{{env}}_07_load_city_metrics"')
    FROM '@"DEMO"."PYPLINES"."REPO_GIT_DEMO_PYPLINES"/branches/"{{branch}}"/notebooks/07_load_city_metrics/'
    QUERY_WAREHOUSE = 'WH_DEMO_PYPLINES'
    MAIN_FILE = '07_load_city_metrics.ipynb';

ALTER NOTEBOOK "DEMO"."PYPLINES_{{env}}"."NB_Demo_Pyplines_{{env}}_07_load_city_metrics" ADD LIVE VERSION FROM LAST;
