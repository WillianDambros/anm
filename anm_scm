###### anm_scm_alvara_pesquisa #################################################

anm_scm_alvara_pesquisa_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Alvara_de_Pesquisa.csv"

anm_scm_alvara_pesquisa <- 
  readr::read_csv(anm_scm_alvara_pesquisa_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_alvara_pesquisa <- anm_scm_alvara_pesquisa |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                  stringr::str_extract(
                    Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_alvara_pesquisa"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_alvara_pesquisa,
                  caminho_arquivo)

###### anm_scm_cessoes_direitos ################################################

anm_scm_cessoes_direitos_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Cessoes_de_Direitos.csv"

anm_scm_cessoes_direitos <- 
  readr::read_csv(anm_scm_cessoes_direitos_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    `Data da Cessão` = readr::col_date(format = "%d/%m/%Y"),
                    .default = readr::col_character()))

# Writing file

nome_arquivo_csv <- "anm_scm_cessoes_direitos"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_cessoes_direitos,
                  caminho_arquivo)

##### anm_scm_guia_utilizacao_autorizada #######################################

anm_scm_guia_utilizacao_autorizada_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Guia_de_Utilizacao_Autorizada.csv"

anm_scm_guia_utilizacao_autorizada <- 
  readr::read_csv(anm_scm_guia_utilizacao_autorizada_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_guia_utilizacao_autorizada <- anm_scm_guia_utilizacao_autorizada |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_guia_utilizacao_autorizada"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_guia_utilizacao_autorizada,
                  caminho_arquivo)

##### anm_scm_licenciamento ####################################################

anm_scm_licenciamento_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Licenciamento.csv"

anm_scm_licenciamento <- 
  readr::read_csv(anm_scm_licenciamento_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_licenciamento <- anm_scm_licenciamento |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_licenciamento"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_licenciamento,
                  caminho_arquivo)

###### anm_scm_microdados ######################################################

anm_scm_microdados_endereco <-
  "https://app.anm.gov.br/dadosabertos/SICOP/Sicop.csv"

anm_scm_microdados <- 
  readr::read_csv(anm_scm_microdados_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))


anm_scm_microdados <- anm_scm_microdados |>
  dplyr::mutate(`Data/Hora da movimentação` =
                  as.Date(`Data/Hora da movimentação`, format = "%d/%m/%Y"),
                `Data de recebimento` =
                  as.Date(`Data de recebimento`))

# Writing file

nome_arquivo_csv <- "anm_scm_microdados"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_microdados,
                  caminho_arquivo)


##### anm_scm_plg ##############################################################

anm_scm_plg_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Licenciamento.csv"

anm_scm_plg <- 
  readr::read_csv(anm_scm_plg_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_plg <- anm_scm_plg |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_plg"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_plg,
                  caminho_arquivo)


##### anm_scm_portaria_lavra ###################################################

anm_scm_portaria_lavra_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Portaria_de_Lavra.csv"

anm_scm_portaria_lavra <- 
  readr::read_csv(anm_scm_portaria_lavra_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_portaria_lavra <- anm_scm_portaria_lavra |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_portaria_lavra"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_portaria_lavra,
                  caminho_arquivo)


##### anm_scm_registro_extracao_publicado ######################################

anm_scm_registro_extracao_publicado_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Registro_de_Extracao_Publicado.csv"

anm_scm_registro_extracao_publicado <- 
  readr::read_csv(anm_scm_registro_extracao_publicado_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_registro_extracao_publicado <- anm_scm_registro_extracao_publicado |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_registro_extracao_publicado"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_registro_extracao_publicado,
                  caminho_arquivo)


##### anm_scm_relatorio_pesquisa_aprovado ######################################

anm_scm_relatorio_pesquisa_aprovado_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Relatorio_de_Pesquisa_Aprovado.csv"

anm_scm_relatorio_pesquisa_aprovado <- 
  readr::read_csv(anm_scm_relatorio_pesquisa_aprovado_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_relatorio_pesquisa_aprovado <- anm_scm_relatorio_pesquisa_aprovado |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_relatorio_pesquisa_aprovado"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_relatorio_pesquisa_aprovado,
                  caminho_arquivo)

##### anm_scm_relatorio_pesquisa_aprovado ######################################

anm_scm_requerimento_lavra_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_Lavra.csv"

anm_scm_requerimento_lavra <- 
  readr::read_csv(anm_scm_requerimento_lavra_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_relatorio_pesquisa_aprovado <- anm_scm_relatorio_pesquisa_aprovado |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_relatorio_pesquisa_aprovado"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_relatorio_pesquisa_aprovado,
                  caminho_arquivo)



##### anm_scm_requerimento_lavra ###############################################

anm_scm_requerimento_lavra_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_Lavra.csv"

anm_scm_requerimento_lavra <- 
  readr::read_csv(anm_scm_requerimento_lavra_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_requerimento_lavra <- anm_scm_requerimento_lavra |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_requerimento_lavra"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_requerimento_lavra,
                  caminho_arquivo)


##### anm_scm_requerimento_licenciamento #######################################

anm_scm_requerimento_licenciamento_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_Licenciamento.csv"

anm_scm_requerimento_licenciamento <- 
  readr::read_csv(anm_scm_requerimento_licenciamento_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_requerimento_licenciamento <- anm_scm_requerimento_licenciamento |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_requerimento_licenciamento"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_requerimento_licenciamento,
                  caminho_arquivo)


##### anm_scm_requerimento_pesquisa #######################################

anm_scm_requerimento_pesquisa_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_Pesquisa.csv"

anm_scm_requerimento_pesquisa <- 
  readr::read_csv(anm_scm_requerimento_pesquisa_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_requerimento_pesquisa <- anm_scm_requerimento_pesquisa |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_requerimento_pesquisa"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_requerimento_pesquisa,
                  caminho_arquivo)

##### anm_scm_requerimento_plg #######################################

anm_scm_requerimento_plg_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_PLG.csv"

anm_scm_requerimento_plg <- 
  readr::read_csv(anm_scm_requerimento_plg_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_requerimento_plg <- anm_scm_requerimento_plg |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_requerimento_plg"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_requerimento_pesquisa,
                  caminho_arquivo)

##### anm_scm_requerimento_registro_extracao_protocolizado #####################

anm_scm_requerimento_registro_extracao_protocolizado_endereco <-
  "https://app.anm.gov.br/dadosabertos/SCM/Requerimento_de_Registro_de_Extracao_Protocolizado.csv"

anm_scm_requerimento_registro_extracao_protocolizado <- 
  readr::read_csv(anm_scm_requerimento_registro_extracao_protocolizado_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

anm_scm_requerimento_registro_extracao_protocolizado <- 
  anm_scm_requerimento_registro_extracao_protocolizado |>
  dplyr::mutate(processo_ano =
                  lubridate::as_date(
                    stringr::str_extract(
                      Processo, "(?<=/)\\d{4}"), format = "%Y"))

# Writing file

nome_arquivo_csv <- "anm_scm_requerimento_registro_extracao_protocolizado"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_scm_requerimento_registro_extracao_protocolizado,
                  caminho_arquivo)
