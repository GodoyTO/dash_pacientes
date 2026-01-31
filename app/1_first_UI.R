# Module of first ui item ####
first_ui <- function(id) { tabItem(
    tabName = 'placeholder1',
    # Title ####
    h2('First', align = 'center'),

    tags$br(),

    # Panels ####
    tabsetPanel(tabPanel(
        tags$p('Item1',
               style = 'color: #2c6bb4; font-size: 120%'),
        tags$br(),
        fluidRow(
            # cards
            column(width = 4, valueBoxOutput(
                NS(id, 'test'), width = NULL)
            )
        )
    ))
)}
