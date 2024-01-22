###### anm_barragens ###########################################################

anm_barragens_endereco <-
  "https://app.anm.gov.br/dadosabertos/BARRAGEM/Barragens.csv"

anm_barragens <- 
  readr::read_csv(anm_barragens_endereco,
                  locale = readr::locale(encoding = "latin1"),
                  col_types = readr::cols(
                    .default = readr::col_character()))

partes_comum <- 
  c("Quantidade", "(Anos)", "(%)", "(m)", "(m²)", "(m³)", "(m³/seg)")

convert_number <- function(number) {
  number <- stringr::str_replace_all(number, "\\.", "")
  number <- stringr::str_replace_all(number, ",", ".")
  return(number)
}

anm_barragens <- anm_barragens |> 
  dplyr::mutate(across(contains(partes_comum), ~ sub("^,", "", .))) |>
  dplyr::mutate(across(contains(partes_comum), convert_number)) |>
  dplyr::mutate(across(contains(partes_comum), as.double)) |>
  dplyr::mutate(across(matches("desde|data")& !`Data da Finalização da DCE` 
                       & !`Desde (Back Up Dam)`, ~ lubridate::dmy(.x))) |>
  dplyr::mutate(`Data da Finalização da DCE` = 
                  as.Date(lubridate::dmy_hms(`Data da Finalização da DCE`)))

# Writing file

nome_arquivo_csv <- "anm_barragens"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_barragens,
                  caminho_arquivo)
