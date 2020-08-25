
library(shiny)

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
      #textInput("titre_fenetre","Intitulé de l'application", value = "", width = NULL, placeholder = NULL),
      #textInput("logo_lien","URL renvoyé lorsqu'on clique sur le logo", value = "", width = NULL, placeholder = NULL),
      textInput("titre_onglet1","Intitulé de l'onglet de visualisation des données", value = "", width = NULL, placeholder = NULL),
      textInput("titre_onglet2","Intitulé de l'onglet de spatialisation des données", value = "", width = NULL, placeholder = NULL),
      textInput("titre_onglet3","Intitulé de l'onglet d'informations des espèces", value = "", width = NULL, placeholder = NULL),
      textInput("label1_select_2", "Intitulé du label de trie subset_1", value = "", width = NULL, placeholder = NULL),
      textInput("label2_select_2", "Intitulé du label de trie subset_2", value = "", width = NULL, placeholder = NULL),
      textInput("label3_select_2", "Intitulé du label de trie subset_3", value = "", width = NULL, placeholder = NULL),
      textInput("label4_select_2", "Intitulé du label de trie subset_4", value = "", width = NULL, placeholder = NULL),
      textInput("label1_pie_1", "Intitulé du label de trie pie_1", value = "", width = NULL, placeholder = NULL),
      textInput("label1_pie_2", "Intitulé du label de trie pie_2", value = "", width = NULL, placeholder = NULL),
      textInput("label1_pie_3", "Intitulé du label de trie pie_3", value = "", width = NULL, placeholder = NULL),
      textInput("label1_pie_4", "Intitulé du label de trie pie_4", value = "", width = NULL, placeholder = NULL),
      #textInput("inputId", "titre du graphique à secteurs 1", value = "", width = NULL, placeholder = NULL),
      #textInput("inputId", "titre du graphique à secteurs 2", value = "", width = NULL, placeholder = NULL),
      #textInput("inputId", "titre du graphique à secteurs 3", value = "", width = NULL, placeholder = NULL),
      #textInput("inputId", "titre du graphique à secteurs 4", value = "", width = NULL, placeholder = NULL),
      textInput("x_axis_label", "Label de l'axe des abscisses", value = "", width = NULL, placeholder = NULL),
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
    inFile <- input$file
    
    
    if (is.null(inFile))
      return(NULL)
      as.data.frame(fread(inFile$datapath, header = input$header))
         
  })
  
 
  output$contents <- renderTable({
    head(dat(), input$n)
   
  })
  
  observeEvent(input$submit, {
    write.csv(c(input$titre_onglet1,input$titre_onglet2,input$titre_onglet3,input$label1_select_2,input$label2_select_2,input$label3_select_2,input$label4_select_2,input$label1_pie_1,input$label2_pie_1,input$label3_pie_1,input$label4_pie_1,input$x_axis_label),"test.csv")
  })


}

shinyApp(ui, server)