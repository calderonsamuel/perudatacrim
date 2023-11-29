library(httr2)

url <- "https://datacrim.inei.gob.pe"
ids_tematicos <- c("40171", "40172", "40173")
ids_geograficos <- c("40514", "40515", "40516")

base_request <- request(url) |>
    req_url_path_append("csv_controller/index") |>
    req_url_query(
        desde = "tematico",
        id = c(ids_tematicos, ids_geograficos),
        .multi = "comma"
    )

response <- req_perform(base_request)

resp_tbl <- response |>
    resp_body_string() |>
    readr::read_csv()

