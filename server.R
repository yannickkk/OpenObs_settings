options(shiny.maxRequestSize=300*1024^2) 
server <- function(input, output) {
  
  dat <- reactive({
    inFile <<- input$file
    
    
    if (is.null(inFile))
      return(NULL)
    as.data.frame(fread(inFile$datapath, header = input$header))
    
  })
  
  
  output$contents <- renderTable({
    head(dat(), input$n)
    
  })
  
  observeEvent(input$submit, {
    write.csv(c(input$titre_fenetre,input$logo,input$logo_lien,
                input$titre_onglet1,input$titre_onglet2,
                input$titre_onglet3,input$titre_onglet4,
                input$label1_select_2,
                input$label2_select_2,input$label3_select_2,
                input$label4_select_2,input$label_checkbox_1,
                input$label_checkbox_2,input$label1_pie_1,
                input$label1_pie_2,input$label1_pie_3,
                input$label1_pie_4,input$label1_geo_1,
                input$stroke_couche_1,input$weigth_couche_1,
                input$fill_couche_1,
                input$smoothFactor_couche_1,input$color_couche_1,
                input$fillOpacity_couche_1,input$stroke_couche_2,
                input$weigth_couche_2,
                input$fill_couche_2,input$smoothFactor_couche_2,
                input$color_couche_2,input$fillOpacity_couche_2,
                input$stroke_couche_3,input$weigth_couche_3,
                input$fill_couche_3,
                input$smoothFactor_couche_3,input$color_couche_3,
                input$fillOpacity_couche_3,input$stroke_couche_4,
                input$weigth_couche_4,
                input$fill_couche_4,input$smoothFactor_couche_4,
                input$color_couche_4,input$fillOpacity_couche_4,
                input$pie_width_1,input$pie_width_2,input$pie_width_3,
                input$pie_width_4,input$own_colors,input$colors_pie_1,
                input$colors_pie_2,input$colors_pie_3,input$colors_pie_4,
                input$nom_fichier),
              "../OpenObs_2/donnees/settings.csv")
    write.csv(as.data.frame(fread(inFile$datapath, header = input$header)),"../OpenObs_2/donnees/data.csv")
    dir.create(paste0("../OpenObs_2/donnees/",input$nom_fichier))
    write.csv(as.data.frame(fread(inFile$datapath, header = input$header)),paste0(paste0("../OpenObs_2/donnees/",input$nom_fichier),paste0(paste0("/data_",input$nom_fichier),".csv")))
    write.csv(c(input$titre_fenetre,input$logo,input$logo_lien,
                input$titre_onglet1,input$titre_onglet2,
                input$titre_onglet3,input$titre_onglet4,
                input$label1_select_2,
                input$label2_select_2,input$label3_select_2,
                input$label4_select_2,input$label_checkbox_1,
                input$label_checkbox_2,input$label1_pie_1,
                input$label1_pie_2,input$label1_pie_3,
                input$label1_pie_4,input$label1_geo_1,
                input$stroke_couche_1,input$weigth_couche_1,
                input$fill_couche_1,
                input$smoothFactor_couche_1,input$color_couche_1,
                input$fillOpacity_couche_1,input$stroke_couche_2,
                input$weigth_couche_2,
                input$fill_couche_2,input$smoothFactor_couche_2,
                input$color_couche_2,input$fillOpacity_couche_2,
                input$stroke_couche_3,input$weigth_couche_3,
                input$fill_couche_3,
                input$smoothFactor_couche_3,input$color_couche_3,
                input$fillOpacity_couche_3,input$stroke_couche_4,
                input$weigth_couche_4,
                input$fill_couche_4,input$smoothFactor_couche_4,
                input$color_couche_4,input$fillOpacity_couche_4,
                input$pie_width_1,input$pie_width_2,input$pie_width_3,
                input$pie_width_4,input$own_colors,input$colors_pie_1,
                input$colors_pie_2,input$colors_pie_3,input$colors_pie_4,
                input$nom_fichier),
              paste0(paste0("../OpenObs_2/donnees/",input$nom_fichier),"/settings.csv"))
    
    js$closeWindow()
    rstudioapi::jobRunScript(path = "../OpenObs_2/scripts/runApp.R")
    stopApp()
    
  })
  
}