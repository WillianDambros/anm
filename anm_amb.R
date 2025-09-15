# Mineral water Production #####################################################

agua_mineral_producao_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Agua_Mineral_Producao.csv"

# 1 maneira
anm_agua_mineral_producao <- 
  readr::read_csv(agua_mineral_producao_file,
                  locale = readr::locale(encoding = "latin1",
                                         decimal_mark = ","),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y"),
                    .default = readr::col_character())) |>
  dplyr::mutate(across(matches("litros|Valor"), 
                       ~ readr::parse_number(., locale = readr::locale(
                         decimal_mark = ","))))
# 2 maneira
anm_amb_agua_mineral_producao <- readr::read_csv(
  agua_mineral_producao_file,
  locale = readr::locale(encoding = "latin1",
                         decimal_mark = ","),
  col_types =
    readr::cols(`Ano base` = readr::col_date(format = "%Y")))

# production by packaging #

anm_agua_mineral_producao_litros <- anm_amb_agua_mineral_producao |>
  dplyr::select(!matches("Valor")) |>
  tidyr::pivot_longer(cols = matches("litros"), names_to = "Embalagem",
                      values_to = "Quantidade_litro") |>
  dplyr::mutate(
    Embalagem = stringr::str_replace(Embalagem, "Quantidade \\(litros\\) ", ""))

anm_agua_mineral_producao_valor <- anm_amb_agua_mineral_producao |>
  dplyr::select(!matches("litros")) |>
  tidyr::pivot_longer(cols = matches("Valor"), names_to = "Embalagens",
                      values_to = "Valor (R$)") |>
  dplyr::select(`Valor (R$)`)

anm_amb_agua_mineral_producao <- 
  dplyr::bind_cols(anm_agua_mineral_producao_litros,
                   anm_agua_mineral_producao_valor)

# Writing file

#nome_arquivo_csv <- "anm_agua_mineral_producao"

#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

#readr::write_csv2(anm_agua_mineral_producao, caminho_arquivo)

#Benefited Mineral Production ##################################################

anm_producao_beneficiada_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Producao_Beneficiada.csv"

anm_amb_producao_beneficiada <- 
  readr::read_csv(anm_producao_beneficiada_file, 
                  locale = readr::locale(encoding = "latin1",
                                         decimal_mark = ","),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y")))


# Writing file

#nome_arquivo_csv <- "anm_producao_beneficiada"

#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

#readr::write_csv2(anm_producao_beneficiada, caminho_arquivo)

# Gross Mineral Production #####################################################

anm_producao_bruta_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Producao_Bruta.csv"

anm_amb_producao_bruta <-
  readr::read_csv(anm_producao_bruta_file,
                  locale = readr::locale(encoding = "latin1",
                                         decimal_mark = ","),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y")))

# Writing file

#nome_arquivo_csv <- "anm_producao_bruta"

#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

#readr::write_csv2(anm_producao_bruta, caminho_arquivo)
anm_amb_agua_mineral_producao
anm_amb_producao_bruta
anm_amb_producao_beneficiada

# writing PostgreSQL

# Conectar ao banco de dados

source("X:/POWER BI/NOVOCAGED/conexao.R")

# Listar as tabelas existentes
RPostgres::dbListTables(conexao)

# Criar o schema, se não existir

schema_name <- "anm"

DBI::dbSendQuery(conexao, paste0("CREATE SCHEMA IF NOT EXISTS ", schema_name))

# Definir os nomes das tabelas e os dados
tabelas <- list(
  anm_amb_agua_mineral_producao = anm_amb_agua_mineral_producao,  
  anm_amb_producao_bruta = anm_amb_producao_bruta,           
  anm_amb_producao_beneficiada = anm_amb_producao_beneficiada
)

# Escrever cada tabela no banco de dados
for (table_name in names(tabelas)) {
  RPostgres::dbWriteTable(conexao,
                          name = DBI::Id(schema = schema_name, table = table_name),
                          value = tabelas[[table_name]],
                          row.names = FALSE,
                          overwrite = TRUE)
}

# Desconectar do banco de dados
RPostgres::dbDisconnect(conexao)
