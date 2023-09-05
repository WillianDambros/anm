# Mineral water Production #####################################################

agua_mineral_producao_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Agua_Mineral_Producao.csv"

anm_agua_mineral_producao <- 
  readr::read_csv(agua_mineral_producao_file,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y"),
                    .default = readr::col_character()))

convert_number <- function(number) {
  number <- stringr::str_replace_all(number, "\\.", "")
  number <- stringr::str_replace_all(number, ",", ".")
  return(number)
}

anm_agua_mineral_producao <- anm_agua_mineral_producao |> 
  dplyr::mutate(across(matches("litros|Valor"), ~ sub("^,", "", .))) |>
  dplyr::mutate(across(matches("litros|Valor"), convert_number)) |>
  dplyr::mutate(across(matches("litros|Valor"), as.double))
  

# production by packaging #

anm_agua_mineral_producao_litros <- anm_agua_mineral_producao |>
  dplyr::select(!matches("Valor")) |>
  tidyr::pivot_longer(cols = matches("litros"), names_to = "Embalagem",
               values_to = "Quantidade_litro") |>
  dplyr::mutate(
    Embalagem = stringr::str_replace(Embalagem, "Quantidade \\(litros\\) ", ""))

anm_agua_mineral_producao_valor <- anm_agua_mineral_producao |>
  dplyr::select(!matches("litros")) |>
  tidyr::pivot_longer(cols = matches("Valor"), names_to = "Embalagens",
               values_to = "Valor (R$)") |>
  dplyr::select(`Valor (R$)`)

anm_agua_mineral_producao <- 
  dplyr::bind_cols(anm_agua_mineral_producao_litros,
                   anm_agua_mineral_producao_valor)

# Writing file

nome_arquivo_csv <- "anm_agua_mineral_producao"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_agua_mineral_producao,
                  caminho_arquivo)

# Benefited Mineral Production #################################################

anm_producao_beneficiada_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Producao_Beneficiada.csv"

anm_producao_beneficiada <- 
  readr::read_csv(anm_producao_beneficiada_file, 
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y"),
                    .default = readr::col_character()))

convert_number <- function(number) {
  number <- stringr::str_replace_all(number, "\\.", "")
  number <- stringr::str_replace_all(number, ",", ".")
  return(number)
}

anm_producao_beneficiada <- anm_producao_beneficiada |> 
  dplyr::mutate(across(matches("Quantidade|Valor"), ~ sub("^,", "", .))) |>
  dplyr::mutate(across(matches("Quantidade|Valor"), convert_number)) |>
  dplyr::mutate(across(matches("Quantidade|Valor"), as.double))

# Writing file

nome_arquivo_csv <- "anm_producao_beneficiada"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_producao_beneficiada,
                  caminho_arquivo)

# Gross Mineral Production #####################################################

anm_producao_bruta_file <-
  "https://app.anm.gov.br/dadosabertos/AMB/Producao_Bruta.csv"

anm_producao_bruta <-
  readr::read_csv(anm_producao_bruta_file,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    `Ano base` = readr::col_date(format = "%Y"),
                    .default = readr::col_character()))

convert_number <- function(number) {
  number <- stringr::str_replace_all(number, "\\.", "")
  number <- stringr::str_replace_all(number, ",", ".")
  return(number)
}

anm_producao_bruta <- anm_producao_bruta |> 
  dplyr::mutate(across(matches("Quantidade|Valor"), ~ sub("^,", "", .))) |>
  dplyr::mutate(across(matches("Quantidade|Valor"), convert_number)) |>
  dplyr::mutate(across(matches("Quantidade|Valor"), as.double))

# Writing file

nome_arquivo_csv <- "anm_producao_bruta"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_producao_bruta,
                  caminho_arquivo)


# writing another path #########################################################

# Writing file

nome_arquivo_csv <- "anm_agua_mineral_producao"

caminho_arquivo <- paste0("Y:/27_anm_dados/amb/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_agua_mineral_producao,
                  caminho_arquivo)

# Writing file

nome_arquivo_csv <- "anm_producao_beneficiada"

caminho_arquivo <- paste0("Y:/27_anm_dados/amb/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_producao_beneficiada,
                  caminho_arquivo)


# Writing file

nome_arquivo_csv <- "anm_producao_bruta"

caminho_arquivo <- paste0("Y:/27_anm_dados/amb/",nome_arquivo_csv, ".csv")

readr::write_csv2(anm_producao_bruta,
                  caminho_arquivo)
