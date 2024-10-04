# anm_arrecadacao

# cfem_arrecadacao #############################################################

anm_cfem_arrecadacao_endereco <-
  "https://app.anm.gov.br/dadosabertos/ARRECADACAO/CFEM_Arrecadacao.csv"

anm_arrecadacao_cfem_arrecadacao <- 
  readr::read_csv(anm_cfem_arrecadacao_endereco,
                  locale = readr::locale(encoding = "latin1",
                                         decimal_mark = ","),
                  col_types = readr::cols(
                    AnoDoProcesso = readr::col_date(format = "%Y"),
                    QuantidadeComercializada = readr::col_double(),
                    ValorRecolhido = readr::col_double(),
                    DataCriacao = readr::col_datetime(format =
                                                        "%Y-%m-%d %H:%M:%S"),
                    .default = readr::col_character()
                  ))

anm_arrecadacao_cfem_arrecadacao <- anm_arrecadacao_cfem_arrecadacao |>
  tidyr::unite(competencia, "Mês", "Ano", sep = "-") |> 
  dplyr::mutate(competencia = stringr::str_c("01-", competencia)) |>
  dplyr::mutate(competencia = lubridate::dmy(competencia))

# Writing file

#nome_arquivo_csv <- "anm_cfem_arrecadacao"
#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")
#readr::write_csv2(anm_cfem_arrecadacao, caminho_arquivo)

# cefm_autuacao ################################################################

anm_cfem_autuacao_endereco <-
  "https://app.anm.gov.br/dadosabertos/ARRECADACAO/CFEM_Autuacao.csv"

anm_arrecadacao_cfem_autuacao <- readr::read_csv2(anm_cfem_autuacao_endereco,
                                      locale = readr::locale(encoding = "latin1",
                                                             decimal_mark = ","),
                                      col_types = readr::cols(
                                        Valor = readr::col_double(),
                                        .default = readr::col_character()
                                        ))

anm_arrecadacao_cfem_autuacao <- anm_arrecadacao_cfem_autuacao |>
  tidyr::unite(competencia_publicacao,
               "MêsPublicação", "AnoPublicação", sep = "-") |> 
  dplyr::mutate(competencia_publicacao =
                  stringr::str_c("01-", competencia_publicacao)) |>
  dplyr::mutate(competencia_publicacao = lubridate::dmy(competencia_publicacao))

# Writing file

#nome_arquivo_csv <- "anm_cfem_autuacao"
#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")
#readr::write_csv2(anm_cfem_autuacao, caminho_arquivo)

# cfem_distribuicao ############################################################

anm_cfem_distribuicao_endereco <-
  "https://app.anm.gov.br/dadosabertos/ARRECADACAO/CFEM_Distribuicao.csv"

anm_arrecadacao_cfem_distribuicao <-
  readr::read_csv(anm_cfem_distribuicao_endereco,
                   locale = readr::locale(encoding = "latin1",
                                          decimal_mark = ","),
                   col_types = readr::cols(
                     Valor = readr::col_double(),
                     DataCriacao = readr::col_datetime(format =
                                                         "%Y-%m-%d %H:%M:%S"),
                     .default = readr::col_character()))


anm_arrecadacao_cfem_distribuicao <- 
  anm_arrecadacao_cfem_distribuicao |>
  tidyr::unite(competencia, "Mês", "Ano", sep = "-") |> 
  dplyr::mutate(competencia = stringr::str_c("01-", competencia)) |>
  dplyr::mutate(competencia = lubridate::dmy(competencia))

# Writing file

#nome_arquivo_csv <- "anm_cfem_distribuicao"
#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")
#readr::write_csv2(anm_cfem_distribuicao, caminho_arquivo)


# tah ##########################################################################

anm_tah_endereco <- "https://app.anm.gov.br/dadosabertos/ARRECADACAO/Tah.csv"

anm_arrecadacao_tah <- readr::read_csv(anm_tah_endereco,
                           locale = readr::locale(encoding = "latin1",
                                                  decimal_mark = ","),
                           col_types = readr::cols(
                             `Ano do Processo` = readr::col_date(format = "%Y"),
                             Hectares = readr::col_double(),
                             `Valor Pago` = readr::col_double(),
                             `Valor Total Cobrado` = readr::col_double(),
                             .default = readr::col_character()))


# Writing file

#nome_arquivo_csv <- "anm_tah"
#caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")
#readr::write_csv2(anm_tah, caminho_arquivo)

# writing PostgreSQL

# Conectar ao banco de dados
conexao <- RPostgres::dbConnect(RPostgres::Postgres(),
                                dbname = "#######",
                                host = "########",
                                port = "########",
                                user =  "#######",
                                password = "#########")

# Listar as tabelas existentes
RPostgres::dbListTables(conexao)

# Criar o schema, se não existir

schema_name <- "anm"

DBI::dbSendQuery(conexao, paste0("CREATE SCHEMA IF NOT EXISTS ", schema_name))

# Definir os nomes das tabelas e os dados
tabelas <- list(
  anm_arrecadacao_cfem_arrecadacao = anm_arrecadacao_cfem_arrecadacao,  
  anm_arrecadacao_cfem_autuacao = anm_arrecadacao_cfem_autuacao,           
  anm_arrecadacao_cfem_distribuicao = anm_arrecadacao_cfem_distribuicao,
  anm_arrecadacao_tah = anm_arrecadacao_tah
)

# Escrever cada tabela no banco de dados
for (table_name in names(tabelas)) {
  RPostgres::dbWriteTable(conexao,
                          name = DBI::Id(schema = schema_name,
                                         table = table_name),
                          value = tabelas[[table_name]],
                          row.names = FALSE,
                          overwrite = TRUE)
}

# Desconectar do banco de dados
RPostgres::dbDisconnect(conexao)
