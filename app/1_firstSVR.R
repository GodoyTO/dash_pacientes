# Module of first server ####
first_server <- function(id) {moduleServer(id,function(input, output, session) {

    output$test <- renderValueBox({

        valueBox(
            value = tags$p(
                paste(length(unique(ds$cd_pac)), 'subjects'),
                style = 'font-size: 80%; font-weigth: bold; color: #414141'),
            subtitle = tags$p(
                'Total lines',
                style = 'font-size: 120%; color: #414141'),
            icon = tags$i(
                class = 'fas fa-users',
                style="font-size: 50%; color: #2c6bb495"),
            color = 'aqua'
        )
    })
})}
