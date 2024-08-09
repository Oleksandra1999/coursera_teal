ADSL <- pharmaverseadam::adsl
ADAE <- pharmaverseadam::adae
ADTTE <- pharmaverseadam::adtte_onco

app <- teal::init(
  data = cdisc_data(
    ADSL = ADSL,
    ADAE = ADAE,
    ADTTE = ADTTE
  ),
  modules = teal::modules(
    tm_data_table(),
    tm_variable_browser()
  )
)
shinyApp(app$ui, app$server)


