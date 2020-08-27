library(shiny)
library(shinyjs)
library(data.table)

jscode <- "shinyjs.closeWindow = function() { window.close(); }"
options(shiny.maxRequestSize=300*1024^2) 
