# This is the calculations file

## Dow Companies

### Disney

income_df <- read.csv("C:\\Users\\admin\\Documents\\Wacc\\Data\\Annual_IncomeStatement_DIS.csv"
                      , stringsAsFactors = FALSE)

bal_sheet_df <- read.csv("C:\\Users\\admin\\Documents\\Wacc\\Data\\Annual_BalanceSheet_DIS.csv"
                         , stringsAsFactors = FALSE)

dis_int_expense <- income_df %>%
  select(1:2) %>%
  mutate(col_1 = .[[1]],
         col_2 = .[[2]])  %>%
  select(col_1, col_2) %>%
  filter(col_1 == "=Interest Expense") %>%
  pull(col_2)
  
dis_int_expense <- as.numeric(sub("=","", dis_int_expense ))


dis_total_debt <- bal_sheet_df %>%
  select(1:2) %>%
  mutate(col_1 = .[[1]],
         col_2 = .[[2]])  %>%
  select(col_1, col_2) %>%
  filter(col_1 == "=Total Liabilities Net Minority Interest") %>%
  pull(col_2)

dis_total_debt <- as.numeric(sub("=", "", dis_total_debt))

dis_cost_of_debt <- round(dis_int_expense / dis_total_debt, 4)  

dis_total_assets <- bal_sheet_df %>%
  select(1:2) %>%
  mutate(col_1 = .[[1]],
         col_2 = .[[2]])  %>%
  select(col_1, col_2) %>%
  filter(col_1 == "=Total Assets") %>%
  pull(col_2)
dis_total_assets <- as.numeric(sub("=", "", dis_total_assets))

dis_total_equity <-  bal_sheet_df %>%
  select(1:2) %>%
  mutate(col_1 = .[[1]],
         col_2 = .[[2]])  %>%
  select(col_1, col_2) %>%
  filter(col_1 == "=total equity gross minority interest") %>%
  pull(col_2)
dis_total_equity <- as.numeric(sub("=", "", dis_total_equity))

risk_free_rate <- 0.091
market_risk_premium <- 0.056

dis_preffered_stock_percentage <- bal_sheet_df %>%
  select(1:2) %>%
  mutate(col_1 = .[[1]],
         col_2 = .[[2]])  %>%
  select(col_1, col_2) %>%
  filter(col_1 == "=preferred stock") %>%
  pull(col_2)
dis_preffered_stock_percentage <- as.numeric(sub("=", "", dis_preffered_stock_percentage))
if (is.na(dis_preffered_stock_percentage) == TRUE) {
  dis_preffered_stock_percentage <- 0
}






