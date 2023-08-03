###### anm_sicob ###########################################################

anm_sicop_endereco <-
  "https://app.anm.gov.br/dadosabertos/SICOP/Sicop.csv"

anm_sicop <- 
  readr::read_csv(anm_sicop_endereco,
                   locale = readr::locale(encoding = "latin1"),
                   col_types = readr::cols(
                     .default = readr::col_character()))

anm_sicop <- anm_sicop |>
  dplyr::mutate(`Data/Hora da movimentação` =
                  as.Date(`Data/Hora da movimentação`, format = "%d/%m/%Y"),
                `Data de recebimento` =
                  as.Date(`Data de recebimento`))

# Writing file

nome_arquivo_csv <- "anm_sicop"

caminho_arquivo <- paste0(getwd(),"/",nome_arquivo_csv, ".txt")

readr::write_csv2(anm_sicop,
                  caminho_arquivo)
