execute_params <-
  list(execute =
         list("echo" = FALSE,
              "warning" = FALSE),
       # "number-sections" = TRUE,
       # "number-depth" = 3,
       # "toc" = TRUE,
       "toc-depth" = 4,
       "fig-dpi" = 500,
       "df-print" = "kable",
       # "crossref" = list(
       #   "chapters" = TRUE,
       #   "fig-title" = '**Figur**',
       #   "tbl-title" = '**Tabell**',
       #   "lof-title" = 'Figuroversikt',
       #   "lot-title" = 'Tabelloversikt',
       #   "title-delim" = '**.**',
       #   "fig-prefix" = "Figur",
       #   "tbl-prefix" = "Tabell",
       #   "ref-hyperlink" = TRUE,
       #   "labels" = "arabic"),
       # "fig-cap-location" = "bottom",
       # "tbl-cap-location" = "top",
       "lang" = "nb")


### IF THE ABOVE FAILS; RUN THE FOLLOWING INTERACTIVELY
paths_site <- if(nchar(Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR")) > 1) {
  Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR")
} else paths$site

if(interactive()) {
  list.files(path = file.path(paths_site, "Rapporter", "2023V"),
             pattern = "^_[^z].*.qmd", recursive = TRUE, full.names = TRUE) %>%
saros::render_full_reports(
  files = .,
  # processable_path = file.path(paths_site, "Rapporter"),
  path = paths_site,
  site_path = file.path(paths_site, "_site"),
 extensions_path = file.path(paths_site, "_extensions"),
 images_path = file.path(paths_site, "_images"))
} else {
  saros::render_full_reports(
    files = Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES"),
    processable_path = NULL,
    path = paths_site,
    site_path = file.path(paths_site, "_site"),
    extensions_path = file.path(paths_site, "..", "_extensions"),
    images_path = file.path(paths_site, "..", "_images"))
}
