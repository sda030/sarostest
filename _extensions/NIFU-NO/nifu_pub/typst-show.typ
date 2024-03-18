#show: doc => NIFU_report(
  title: "$title$",
  subtitle: "$subtitle$",
  abstract: "$abstract$",
  authors: (
    $for(by-author)$
    (
      "$it.name.literal$"
    )$sep$,
    $endfor$
  ),
  report_no: "$report_no$",
  project_no: "$project_no$",
  isbn: "$isbn$",
  issn: "$issn$",
  funder: "$funder$",
  funder_address: "$funder_address$",
  date: "$date$",
  preface: "$preface$",
  signer_1: "$signer_1$",
  signer_2: "$signer_2$",
  signer_1_title: "$signer_1_title$",
  signer_2_title: "$signer_2_title$",
  figure_table: $figure_table$,
  table_table: $table_table$,
  references: "$references$",
  doc,
) 