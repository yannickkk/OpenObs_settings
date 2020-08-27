library(shiny)
library(shinyjs)
library(data.table)

jscode <- "shinyjs.closeWindow = function() { window.close(); }"