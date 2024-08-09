ADSL <- df_explicit_na(pharmaverseadam::adsl)
ADAE <- df_explicit_na(pharmaverseadam::adae)
ADTTE <- df_explicit_na(pharmaverseadam::adtte_onco)


app <- init(
  data = cdisc_data(
    ADSL = ADSL,
    code = "ADSL <- df_explicit_na(pharmaverseadam::adsl)
            ADAE <- df_explicit_na(pharmaverseadam::adae)
            ADTTE <- df_explicit_na(pharmaverseadam::adtte_onco)"
  ),
  modules = modules(
    tm_t_summary(
      label = "Demographic Table",
      dataname = "ADSL",
      arm_var = choices_selected(c("TRT01P", "TRT01A"),"TRT01P"),
      add_total = TRUE,
      summarize_vars = choices_selected(
        c("AGE","SEX")
        
      ),
      useNA = "ifany"
    )
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}

#shinyApp(app$ui, app$server)



