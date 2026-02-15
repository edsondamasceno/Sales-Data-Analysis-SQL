/*
Sales Data Analysis with SQL

Este projeto utiliza o conjunto de dados "sales dataset",
que apresenta dados de vendas sintéticos gerados para fins de simulação.

O conjunto de dados pode ser acessado no Kaggle pelo link:
https://www.kaggle.com/datasets/vinothkannaece/sales-dataset
*/

-- Importando os dados de um arquivo CSV

LOAD DATA LOCAL INFILE 'dataset/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;