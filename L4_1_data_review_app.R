ADSL <- pharmaverseadam::adsl

app <- teal::init(
  data = cdisc_data(
    ADSL = ADSL,
  ),
  modules = teal::modules(
    tm_data_table(),
    tm_variable_browser()
  )
)
shinyApp(app$ui, app$server)

