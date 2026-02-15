/*
Sales Data Analysis with SQL

Este projeto utiliza o conjunto de dados "sales dataset",
que apresenta dados de vendas sintéticos gerados para fins de simulação.

O conjunto de dados pode ser acessado no Kaggle pelo link:
https://www.kaggle.com/datasets/vinothkannaece/sales-dataset
*/

-- Criando a tabela

CREATE TABLE sales_data (
    Product_ID INT,
    Sale_Date DATE,
    Sales_Rep VARCHAR(100),
    Region VARCHAR(50),
    Sales_Amount DECIMAL(10,2),
    Quantity_Sold INT,
    Product_Category VARCHAR(100),
    Unit_Cost DECIMAL(10,2),
    Unit_Price DECIMAL(10,2),
    Customer_Type VARCHAR(50),
    Discount DECIMAL(5,2),
    Payment_Method VARCHAR(50),
    Sales_Channel VARCHAR(50),
    Region_and_Sales_Rep VARCHAR(100)
);