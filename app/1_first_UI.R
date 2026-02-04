# Module of first ui item ####
first_ui <- function(id) { tabItem(
    tabName = 'placeholder1',
    # Title ####
    h2('Demography', align = 'center'),

    tags$br(),

    # Panels ####
    tabsetPanel(tabPanel(
        tags$p('Age and sex',
               style = 'color: #2c6bb4; font-size: 120%'),
        tags$br(),

        fluidRow(
            column(width = 4, valueBoxOutput(
                NS(id, 'whole_pop'), width = NULL)
            ),
            column(width = 4, valueBoxOutput(
                NS(id, 'male_pop'), width = NULL)
            ),
            column(width = 4, valueBoxOutput(
                NS(id, 'female_pop'), width = NULL)
            )
        ),

        fluidRow(
            # Population pyramid
            box(
                width = 6, height = '600px', title = NULL,
                plotlyOutput(NS(id,'pyramid'), height = '500px')
            ),
            
            # Race distribution
            box(
                width = 6, height = '600px', title = NULL,
                plotlyOutput(NS(id,'race_donut'), height = '500px')
            )
        )
    ))
)}

