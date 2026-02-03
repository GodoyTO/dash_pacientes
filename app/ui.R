# Loading UI
source("1_first_UI.R")


# Header with logo
header <- dashboardHeader(
    title = tags$a(tags$img(
        src = "./logo.jpg",
        width = "120",
        style = "vertical-align:middle;
                horizontal-align:left;
                margin-left:-2px;"
    )),
    disable = FALSE,
    titleWidth = 210
)

# Sidebar ####
siderbar <- dashboardSidebar(
    width = 210,
    collapsed = TRUE,
    sidebarMenu(
        tags$br(),
        menuItem(
            "Demography",
            tabName = "placeholder1",
            icon = tags$i(class = "fas fa-1")
        # ),
        # menuItem(
        #     "Second item",
        #     tabName = "placeholder2",
        #     icon = tags$i(class = "fas fa-2")
        # ),
        # menuItem(
        #     "Third item",
        #     tabName = "placeholder3",
        #     icon = tags$i(class = "fas fa-3")
        # ),
        # menuItem(
        #     "Fourth item",
        #     tabName = "placeholder4",
        #     icon = tags$i(class = "fas fa-4")
        # ),
        # menuItem(
        #     "Fifth item",
        #     tabName = "placeholder5",
        #     icon = tags$i(class = "fas fa-5")
        )
    )
)

body <- dashboardBody(
    shinyDashboardThemes(theme = "grey_light"),
    shinyjs::useShinyjs(),

    # ## Auth ####
    # shinyauthr::loginUI(id = "login",
    #                     title = " ",
    #                     user_title = "User",
    #                     pass_title = "Password",
    #                     login_title = "Access",
    #                     error_message = "Invalid user of password!"),


    ### Latest (as 2026-01-30) FAS repository
    tags$style(
        "@import url(https://use.fontawesome.com/releases/v7.1.0/css/all.css);"
    ),

    ### Customization
    tags$head(
        tags$style(
            HTML("/* logo */
                .skin-blue .main-header .logo {
                background-color: #ffff;
                }

                /* Sidebar with long text */
                .sidebar-menu > li {
                white-space: normal;
                }

                /* logo when hovered */
                .skin-blue .main-header .logo:hover {
                background-color: #ffff;
                colour: #ffff;
                }

                /* navbar (rest of the header) */
                .skin-blue .main-header .navbar {
                background-color: #2c6bb4;
                }

                /* main sidebar */
                .skin-blue .main-sidebar {
                background-color: #fafbfb;
                }

                /* sidebar toggle */
                .skin-blue .main-header .navbar .sidebar-toggle {
                background-color: #2c6bb4;
                color: #ffff;
                }

                /* sidebar toggle */
                .skin-blue .main-header .navbar .sidebar-toggle:hover {
                background-color: #0c4bb4;
                color: #ffff;
                }

                /* button default */
                .btn-default {
                background-color: #279aff;
                border-color: #279aff;
                color: white;
                }

                /* login pannel */
                .well {
                background-color: white;
                border-color: #white;
                }

               /* tab pannels */
                .nav-tabs>li>a {
                border-color: #D2D1D1;
                }")
        )
    ),

    ### Body elements ####
    tags$br(),
    tabItems(
        #### Call element number 1
        first_ui("number_1")
        # #### Call element number 2
        # second_ui("number_2"),
        # #### Call element number 3
        # third_ui("number_3"),
        # #### Call element number 4
        # fourth_ui("number_4"),
        # #### Call element number 5
        # fifth_ui("number_5")
    )
)

# Integration between elements  ####
ui <- dashboardPage(header, siderbar, body)
