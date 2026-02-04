# Module of first server ####
first_server <- function(id) {moduleServer(id,function(input, output, session) {

    output$whole_pop <- renderValueBox({

        valueBox(
            value = tags$p(
                paste(length(unique(ds$cd_pac)), 'subjects'),
                style = 'font-size: 80%; font-weigth: bold; color: #414141'),
            subtitle = tags$p(
                'Whole subjects',
                style = 'font-size: 120%; color: #414141'),
            icon = tags$i(
                class = 'fas fa-users',
                style="font-size: 50%; color: #9c6bf4"),
            color = 'purple'
        )
    })

    output$female_pop <- renderValueBox({

        df <- ds %>% filter(tp_sex == 'F')

        valueBox(
            value = tags$p(
                paste(length(unique(df$cd_pac)), 'subjects'),
                style = 'font-size: 80%; font-weigth: bold; color: #414141'),
            subtitle = tags$p(
                'Female subjects',
                style = 'font-size: 120%; color: #414141'),
            icon = tags$i(
                class = 'fas fa-users',
                style="font-size: 50%; color: #fc6bc4"),
            color = 'fuchsia'
        )
    })

    output$male_pop <- renderValueBox({

        df <- ds %>% filter(tp_sex == 'M')

        valueBox(
            value = tags$p(
                paste(length(unique(df$cd_pac)), 'subjects'),
                style = 'font-size: 80%; font-weigth: bold; color: #414141'),
            subtitle = tags$p(
                'Male subjects',
                style = 'font-size: 120%; color: #414141'),
            icon = tags$i(
                class = 'fas fa-users',
                style="font-size: 50%; color: #2c6bb4"),
            color = 'aqua'
        )
    })

    output$pyramid <- renderPlotly({

        df <- ds %>%
            select(cd_pac, age_group, tp_sex) %>%
            reframe(n = n(), .by = c(age_group, tp_sex)) %>%
            complete(age_group, tp_sex, fill = list(n = 0)) %>%
            mutate(n = case_when(tp_sex == 'F' ~-n, T~n))

        validate(
            need(!is.null(df), 'No data'),
            need(nrow(df) > 0, 'No data')
        )

        df  %>%  plot_pyramid(
            X = 'n', Y = 'age_group', Z = 'tp_sex', pal = pal[c(22,26)],
            lab_x = 'Whole subjects', text = 'subjects',
            title = paste0(
                '<b>Subjects population pyramid'))
    })
    
    output$race_donut <- renderPlotly({
        
        df <- ds %>%
            select(cd_pac, nm_race) %>%
            group_by(nm_race)  %>% 
            summarize(num = n()) %>% 
            mutate(nm_race = if_else(nm_race == 'Middle Eastern or North African',
                                     'Middle Eastern\nor North African',
                                     nm_race))
        
        
        validate(
            need(!is.null(df), 'No data'),
            need(nrow(df) > 0, 'No data')
        )
        
        df  %>%  plot_donut(
            n = 'num', label = 'nm_race',
            cor = pal[c(4,8,12,20,22)],
            text_n = ' subjects',
            title = paste0(
                '<b>Race distribution'))
    })
})}
