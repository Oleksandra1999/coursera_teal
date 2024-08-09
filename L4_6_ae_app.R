ADSL <- df_explicit_na(pharmaverseadam::adsl)
ADAE <- df_explicit_na(pharmaverseadam::adae)
ADTTE <- df_explicit_na(pharmaverseadam::adtte_onco)

arm_levels <- c("Screen Failure","Placebo", "Xanomeline Low Dose","Xanomeline High Dose")

ADSL <- ADSL %>% 
  mutate(
    TRT01P=fct_relevel(TRT01P, arm_levels),
    TRT01A=fct_relevel(TRT01A, arm_levels)
  )

ADAE <- ADAE %>% 
  mutate(
    AEDECOD =with_label(AEDECOD, "Dictionary-derived term"),
    AEBODSYS=with_label(AEBODSYS, "Body system or organ class")
  )

app <- init(
  data = cdisc_data(
    ADSL = ADSL,
    ADAE=ADAE,
    code = "ADSL <- df_explicit_na(pharmaverseadam::adsl)
            ADAE <- df_explicit_na(pharmaverseadam::adae)
            ADTTE <- df_explicit_na(pharmaverseadam::adtte_onco)"
  ),
  modules = modules(
    tm_t_events(
      label = "Adverse Event Table",
      dataname = "ADAE",
      arm_var = choices_selected(c("TRT01P", "TRT01A"), "TRT01P"),
      llt = choices_selected(
        choices = variable_choices(ADAE, c("AETERM", "AEDECOD")),
        selected = c("AEDECOD")
      ),
      hlt = choices_selected(
        choices = variable_choices(ADAE, c("AEBODSYS", "AESOC")),
        selected = "AEBODSYS"
      ),
      add_total = TRUE,
      event_type = "adverse event"
    )
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}


