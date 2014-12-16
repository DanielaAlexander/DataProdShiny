library(shiny) 
shinyUI(navbarPage("App Pages",
  tabPanel("Application",
    titlePanel("Rudimentary Investment Yield Calculator"),
    sidebarPanel( 
      h4('Investment'),
      numericInput('sum', 'Investment Sum ($)', 50000, min = 10000, max = 100000000, step = 5000),
      numericInput('years', "Number of years until withdrawal", 5, min = 1, max = 50, step = 1),
      h5('Levers of growth / loss'),
      sliderInput('inflation', 'Inflation in %', value = 3, min = 2.4, max = 5, step = 0.1),
      sliderInput('bankRet', 'Bank interest in %', value = 1, min = 0.5, max = 5, step = 0.1),
      sliderInput('investRet', 'Investment return in %', value = 6, min = 4, max = 15, step = 0.5)
  ), 
  
  mainPanel( 
    h4("To have today's power of buying, you need to have: ($)"),
    textOutput("value"),
    h4("Cash Yield in today's money ($)"), 
    textOutput("cashYield"), 
    plotOutput('cashPlot'),
    h4("Bank Yield in today's money ($)"), 
    textOutput("bankYield"), 
    plotOutput('bankPlot'),
    h4("Investment Yield in today's money ($)"), 
    textOutput("investYield"), 
    plotOutput('investPlot') 
   ) 
),

  tabPanel("Documentation",
           h4('Documentation for Rudimentary Investment Yield Calculator Shiny App'), 
           helpText("This application shows potential investment yield over years taking into account inflation and predicted market appreciation."), 
           code("Input:"),
           br(),
           code("Investment Sum"), 
           helpText("- Investment Sum = sum of money you plan to invest."),
           code("Years"), 
           helpText("- Years = number of years you plan to keep that sum invested."),
           code("Inflation"), 
           helpText("- Inflation = percentage on inflation per year, in a slider form. The value is used to calculate the decrease of value per year."),
           code("Bank Rate"), 
           helpText("- Bank Rate = percentage on bank interest per year, in a slider form. The value is used to calculate the added value due to bank interest per year."),
           code("Investment Rate"), 
           helpText("- Investment Rate = percentage on investment return per year, in a slider form. The value is used to calculate the added value due to financial investment gains / losses per year."),
           br(),
           code("Output:"),
           br(),
           code("Value of sum"), 
           helpText("Value of sum = What sum of money you need at the end of the investment period to be on par with the value of money you plan to invest today."), 
           code("Cash Yield"), 
           helpText("Cash Yield = Value of today's money at the end of the investment period, if you keep the cash and do nothing with that money. It is caculated by reducing the amount of inflation every year."), 
           code("Bank Yield"), 
           helpText("Bank Yield = Value of today's money at the end of the investment period, if you keep the money in a bank account. It is caculated by adding the annual bank given interest to the money and then applying inflation."),    
           code("Investment Yield"), 
           helpText("Investment Yield = Value of today's money at the end of the investment period, if you invest the money in the financial market. It is caculated by adding the annual return of investment to the money and then applying inflation."),
           helpText("All calculations are made considering the inflation, bank interest and investment return rates as identical across all years. Consider them s averages of rates expectations.")
  )



) )
