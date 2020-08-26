library(shiny)
library(data.table)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose CSV File",
                accept = c(
                  ".csv")
                
      ),
      numericInput("n", "Rows", value = 10, min = 1, step = 1),
      tags$hr(),
      checkboxInput("header", "Header", TRUE),
      h3("Options général"),
      textInput("nom_fichier","Intitulé du fichier de donnée", value = "", width = NULL, placeholder = NULL),
      textInput("titre_fenetre","Intitulé de l'application", value = "OpenObs", width = NULL, placeholder = NULL),
      textInput("logo","Intitulé de l'image du logo (Exemple : logo.png)", value = "logo.png", width = NULL, placeholder = NULL),
      textInput("logo_lien","URL renvoyé lorsqu'on clique sur le logo", value = "https://...", width = NULL, placeholder = NULL),
      textInput("titre_onglet1","Intitulé de l'onglet de visualisation des données", value = "Données visuelles", width = NULL, placeholder = NULL),
      textInput("titre_onglet2","Intitulé de l'onglet de spatialisation des données", value = "Données spatiales", width = NULL, placeholder = NULL),
      textInput("titre_onglet3","Intitulé de l'onglet d'informations des espèces", value = "Informations des espèces", width = NULL, placeholder = NULL),
      textInput("label1_select_2", "Intitulé du label de trie subset_1", value = "subset_1", width = NULL, placeholder = NULL),
      textInput("label2_select_2", "Intitulé du label de trie subset_2", value = "subset_2", width = NULL, placeholder = NULL),
      textInput("label3_select_2", "Intitulé du label de trie subset_3", value = "subset_3", width = NULL, placeholder = NULL),
      textInput("label4_select_2", "Intitulé du label de trie subset_4", value = "subset_4", width = NULL, placeholder = NULL),
      textInput("label_checkbox_1", "Intitulé du label de la checkbox_1", value = "checkbox_1", width = NULL, placeholder = NULL),
      textInput("label_checkbox_2", "Intitulé du label de la checkbox_2", value = "checkbox_2", width = NULL, placeholder = NULL),
      textInput("label1_pie_1", "Intitulé du label de trie pie_1", value = "pie_1", width = NULL, placeholder = NULL),
      textInput("label1_pie_2", "Intitulé du label de trie pie_2", value = "pie_2", width = NULL, placeholder = NULL),
      textInput("label1_pie_3", "Intitulé du label de trie pie_3", value = "pie_3", width = NULL, placeholder = NULL),
      textInput("label1_pie_4", "Intitulé du label de trie pie_4", value = "pie_4", width = NULL, placeholder = NULL),
      textInput("label1_geo_1", "Intitulé du label de geo_1", value = "geo_1", width = NULL, placeholder = NULL),
      h3("Options des différentes couches additionnelles"),
      h4("Couche 1"),
      checkboxInput("stroke_couche_1","Afficher les contours de la couche"),
      sliderInput("weigth_couche_1","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
      checkboxInput("fill_couche_1","Remplir l'intérieur de la couche"),
      sliderInput("smoothFactor_couche_1","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
      textInput("color_couche_1","Couleur de la couche (En anglais ou code couleur html)",value = "green", width = NULL, placeholder = NULL),
      sliderInput("fillOpacity_couche_1","Opacité du remplissage",min=0,max=1,value = 0),
      h4("Couche 2"),
      checkboxInput("stroke_couche_2","Afficher les contours de la couche"),
      sliderInput("weigth_couche_2","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
      checkboxInput("fill_couche_2","Remplir l'intérieur de la couche"),
      sliderInput("smoothFactor_couche_2","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
      textInput("color_couche_2","Couleur de la couche (En anglais ou code couleur html)",value = "red", width = NULL, placeholder = NULL),
      sliderInput("fillOpacity_couche_2","Opacité du remplissage",min=0,max=1,value = 0),
      h4("Couche 3"),
      checkboxInput("stroke_couche_3","Afficher les contours de la couche"),
      sliderInput("weigth_couche_3","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
      checkboxInput("fill_couche_3","Remplir l'intérieur de la couche"),
      sliderInput("smoothFactor_couche_3","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
      textInput("color_couche_3","Couleur de la couche (En anglais ou code couleur html)",value = "blue", width = NULL, placeholder = NULL),
      sliderInput("fillOpacity_couche_3","Opacité du remplissage",min=0,max=1,value = 0),
      h4("Couche 4"),
      checkboxInput("stroke_couche_4","Afficher les contours de la couche"),
      sliderInput("weigth_couche_4","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
      checkboxInput("fill_couche_4","Remplir l'intérieur de la couche"),
      sliderInput("smoothFactor_couche_4","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
      textInput("color_couche_4","Couleur de la couche (En anglais ou code couleur html)",value = "yellow", width = NULL, placeholder = NULL),
      sliderInput("fillOpacity_couche_4","Opacité du remplissage",min=0,max=1,value = 0),
      h3("Options des camemberts"),
      sliderInput("pie_width_1","Taille des camemberts de pie_1 (en pixel)", min = 30, max = 100, value = 70),
      sliderInput("pie_width_2","Taille des camemberts de pie_2 (en pixel)", min = 30, max = 100, value = 70),
      sliderInput("pie_width_3","Taille des camemberts de pie_3 (en pixel)", min = 30, max = 100, value = 70),
      sliderInput("pie_width_4","Taille des camemberts de pie_4 (en pixel)", min = 30, max = 100, value = 70),
      checkboxInput("own_colors","Utiliser ses propres couleurs pour les camemberts"),
      helpText("Note : Utiliser ses propres couleurs uniquement si vous êtes sur du nombre de paramètre affiché. La taille du vecteur des couleurs doit correspondre au nombre de paramètre affiché."),
      textInput("colors_pie_1","Code couleur utilisé pour pie_1",value = "", width = NULL, placeholder = NULL),
      helpText("Note : Utiliser seulement les codes html (https://www.code-couleur.com/). Ecrire chaque code couleur séparé par une virgule,sans espace. Exemple : #01FEDD,#448279,#000908"),
      textInput("colors_pie_2","Code couleur utilisé pour pie_2",value = "", width = NULL, placeholder = NULL),
      textInput("colors_pie_3","Code couleur utilisé pour pie_3",value = "", width = NULL, placeholder = NULL),
      textInput("colors_pie_4","Code couleur utilisé pour pie_4",value = "", width = NULL, placeholder = NULL),
      actionButton("submit","Créer la configuration"),
     
  
    ),
    mainPanel(
      tableOutput("contents")
    )
  )
)

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
                input$titre_onglet3,input$label1_select_2,
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
                input$colors_pie_2,input$colors_pie_3,input$colors_pie_4),
              "../OpenObs_2/données/settings.csv")
    write.csv(as.data.frame(fread(inFile$datapath, header = input$header)),paste0("../OpenObs_2/données/",paste0(paste0("data_",input$nom_fichier),".csv")))
  })


}

shinyApp(ui, server)