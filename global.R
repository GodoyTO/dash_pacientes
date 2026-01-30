# Load packages ####
if(!require(shiny)) install.packages('shiny'); require(shiny)
if(!require(shinydashboard)) install.packages('shinydashboard'); require(shinydashboard)
if(!require(shinydashboardPlus)) install.packages('shinydashboardPlus'); require(shinydashboardPlus)
if(!require(plotly)) install.packages('plotly'); require(plotly)
if(!require(tidyverse)) install.packages('tidyverse'); require(tidyverse)

# Color pallet ####
pal <- c('#ffc9e5', '#ffabed', '#ff8abd', '#b8708a',
         '#e5ffc9', '#edffab', '#bdff8a', '#8ab870',
         '#cae5ff', '#acedff', '#89bbfe', '#6f8ab7',
         '#27187e', '#758bfd', '#aeb8fe', '#ff8600', 
         '#187d2d', '#8bfc74', '#b9ffb0', '#8800ff',
         '#7d2718', '#fc748b', '#ffb0b9', '#00ff88',
         "#FFBC4D", '#2c6bb4', '#f37120', '#00c1f3')

# Global functions ####
## Simple Bar plot #####
bar_simple <- function(
        dt, x, y, cor, total, title = 'Title',
        label_x = 'Label x',
        var_text = 'Variable text') {
    
    porc <- round(100*(dt[[x]] / total), 1)
    
    fig <- plot_ly() %>%  
        add_trace(
            y = dt[[y]], x = dt[[x]],
            marker = list(color = cor),
            hoverinfo = 'text', textposition = 'none',
            type = 'bar', name = ' ',
            text = ~ paste0(dt[[y]], '\n',
                            format(dt[[x]], big.mark = '.'), ' ',
                            var_text, '\n', 
                            format(porc, decimal.mark = ','),
                            '%')) %>% 
        layout(
            title = list(text = title, y = 0.98, x = 0.5, font = list(size = 16)),
            margin = list(pad = 1,
                          t = 40),
            yaxis = list(title = '', mirror = TRUE,
                         showgrid = FALSE,
                         tickfont = list(size = 15)), 
            xaxis = list(title = list(size = 16, text = rotulo_x), mirror = TRUE,
                         showgrid = TRUE, showticklabels = TRUE, zeroline = F,
                         tickfont = list(size = 15)),
            
            hoverlabel = list(font = list(size = 16)))
    
    return(fig)
}

## Simple Donut plot ####
pizzaplot2 <- function(
        df, n, label, cor = pal[1:2],
        text_n = ' subjects', title = 'Title'){
    
    df$prop <- round(df[[n]]/sum(df[[n]])*100, 1)
    
    plot_ly() %>% 
        add_pie(
            data = df, labels = ~ df[[label]], 
            values = ~ df[[n]],
            sort = FALSE,
            hole = 0.5,
            marker = list(
                colors = cor, line = list(color = '#FFFFFF', width = 1)),
            domain = list(row = 0, column = 0),
            textinfo = 'label',
            textposition = 'inside',
            # customize the text
            hoverinfo = 'text',
            text = ~paste0(
                df[[label]], '\n',
                format(df[[n]], big.mark = '.',
                       decimal.mark = ','), texto_n,
                '\n', format(df$prop, big.mark = '.',
                             decimal.mark = ','), '%')) %>% 
        layout(
            title = list(
                text = title, y = 0.97, x = 0.5, font = list(size = 16)),
            margin = list(pad = 1, t = 50),
            legend = list(
                orientation = 'v', yanchor = "center",
                y = 0.5, font = list(size = 16)),
            hoverlabel = list(font = list(size = 16))
        )
}



