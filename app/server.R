# Loading servers
source("global.R")
source("1_firstSVR.R")


## Calling child servers for item #####
server <- function(input, output, session) {

    first_server('number_1')
    # second_server('number_2')
    # third_server('number_3')
    # fourth_server('number_4')
    # fifth_server('number_5')

}
