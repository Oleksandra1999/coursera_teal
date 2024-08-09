ADSL <- df_explicit_na(pharmaverseadam::adsl)
ADAE <- df_explicit_na(pharmaverseadam::adae)
ADTTE <- df_explicit_na(pharmaverseadam::adtte_onco)

arm_levels <- c("Screen Failure","Placebo", "Xanomeline Low Dose", "Xanomeline Hight Dose")
ADSL <- ADSL %>% 
  mutate(
    TRT01P=fct_relevel(TRT01P, arm_levels),
    TRT01A=fct_relevel(TRT01A, arm_levels)
  )
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
        c("SEX","AGE")
        
      ),
      numeric_stats = c("n", "mean_sd", "median", "range")

     
    )
  )
)


shinyApp(app$ui, app$server)



