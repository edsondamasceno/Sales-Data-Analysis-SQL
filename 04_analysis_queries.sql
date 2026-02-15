/*
Sales Data Analysis with SQL

Este projeto utiliza o conjunto de dados "sales dataset",
que apresenta dados de vendas sintéticos gerados para fins de simulação.

O conjunto de dados pode ser acessado no Kaggle pelo link:
https://www.kaggle.com/datasets/vinothkannaece/sales-dataset
*/

-- Usando o banco de dados vendas_db
USE vendas_db;

-- visualizando os primeiros 10 registros da tabela
SELECT * FROM sales_data LIMIT 10;

/*
Aqui estão algumas consultas SQL para análise de vendas usando a 
tabela sales_data no MySQL.
*/

-- 1. Receita total (faturamento total)

SELECT SUM(Sales_Amount) AS receita_total
FROM sales_data;

-- 2. Receita por região

SELECT 
    Region,
    SUM(Sales_Amount) AS receita_total
FROM sales_data
GROUP BY Region
ORDER BY receita_total DESC;

-- 3. Receita por vendedor (Sales Rep)

SELECT 
    Sales_Rep,
    SUM(Sales_Amount) AS receita_total
FROM sales_data
GROUP BY Sales_Rep
ORDER BY receita_total DESC;

-- 4. Vendas por categoria de produto

SELECT 
    Product_Category,
    SUM(Sales_Amount) AS receita_total,
    SUM(Quantity_Sold) AS total_produtos_vendidos
FROM sales_data
GROUP BY Product_Category
ORDER BY receita_total DESC;

-- 5. Ticket médio (valor médio por venda)

SELECT AVG(Sales_Amount) AS ticket_medio
FROM sales_data;

-- 6. Quantidade total vendida

SELECT SUM(Quantity_Sold) AS total_itens_vendidos
FROM sales_data;

-- 7. Lucro estimado (receita - custo)

SELECT 
    SUM((Unit_Price - Unit_Cost) * Quantity_Sold) AS lucro_estimado
FROM sales_data;

-- 8. Comparação clientes novos vs recorrentes

SELECT 
    Customer_Type,
    COUNT(*) AS total_vendas,
    SUM(Sales_Amount) AS receita_total
FROM sales_data
GROUP BY Customer_Type;

-- 9. Receita por método de pagamento

SELECT 
    Payment_Method,
    SUM(Sales_Amount) AS receita_total
FROM sales_data
GROUP BY Payment_Method
ORDER BY receita_total DESC;

-- 10. Vendas por canal (Online vs Retail)

SELECT 
    Sales_Channel,
    SUM(Sales_Amount) AS receita_total,
    COUNT(*) AS total_vendas
FROM sales_data
GROUP BY Sales_Channel;

-- 11. Receita por mês (análise temporal)

SELECT 
    DATE_FORMAT(Sale_Date, '%Y-%m') AS mes,
    SUM(Sales_Amount) AS receita_total
FROM sales_data
GROUP BY mes
ORDER BY mes;

-- 12. Top 5 maiores vendas

SELECT *
FROM sales_data
ORDER BY Sales_Amount DESC
LIMIT 5;

-- 13. Desconto médio aplicado

SELECT AVG(Discount) AS desconto_medio
FROM sales_data;

-- 14. Receita + lucro por região

SELECT 
    Region,
    SUM(Sales_Amount) AS receita_total,
    SUM((Unit_Price - Unit_Cost) * Quantity_Sold) AS lucro_total
FROM sales_data
GROUP BY Region
ORDER BY receita_total DESC;

-- 15. Participação (%) de cada região

SELECT 
    Region,
    SUM(Sales_Amount) receita,
    ROUND(SUM(Sales_Amount) * 100 /
         (SELECT SUM(Sales_Amount) FROM sales_data), 2) participacao_percentual
FROM sales_data
GROUP BY Region;

-- 16. Ranking de vendedores com RANK()

SELECT 
    Sales_Rep,
    SUM(Sales_Amount) receita,
    RANK() OVER (ORDER BY SUM(Sales_Amount) DESC) ranking
FROM sales_data
GROUP BY Sales_Rep;

-- 17. Vendas acima da média

SELECT *
FROM sales_data
WHERE Sales_Amount > (
    SELECT AVG(Sales_Amount)
    FROM sales_data
);

-- 18. Receita acumulada ao longo do tempo

SELECT 
    Sale_Date,
    SUM(Sales_Amount) OVER (ORDER BY Sale_Date) receita_acumulada
FROM sales_data;