library(shiny)
library(shinydashboard)



## ui.R is the layout of the app ##

#Create a Dashboard page
dashboardPage(
  dashboardHeader(title = 'The EV Revolution'),
  
  
  #THE SIDEBAR
  dashboardSidebar(
    sidebarMenu(
      menuItem('Introduction', tabName = 'intro', icon = icon('book-open', lib = 'font-awesome')),
      menuItem('Current Market', tabName = 'market', icon = icon('chart-area', lib = 'font-awesome')),
      menuItem('Possible Explanations', tabName = 'explanations', icon = icon('book-open', lib='font-awesome'))
    )
  ),
  
  
  #THE BODY
  dashboardBody(
    tabItems(
      
      #-------> FIRST PAGE <---------
      tabItem(
        tabName = 'intro',
        h1('Introduction:'),
        p('In this R Shiny project, I investigated the possible reasons that are delaying the mass adoption of 
          electric vehicles(EVs) in the United States and worldwide. EVs promise to make transport more accessible to
          everyone, dramatically reduce global carbon emissions, and be more green in general, and yet somehow, they have not
          been able to gain significant market share from combustion engine vehicles'),
        h2('Types of EV:'),
        p('Just as there are a variety of technologies available in conventional vehicles, plug-in electric vehicles have 
        different capabilities that can accommodate different drivers’ needs. A major feature of EVs is that drivers can plug them in 
        to charge from an off-board electric power source. This distinguishes them from hybrid electric vehicles, which supplement an internal 
        combustion engine with battery power but cannot be plugged in.'),
        p('Therefore, I categorized EVs in the following way: all-electric vehicles (AEVs) and plug-in hybrid electric vehicles (PHEVs).'),
        p('AEVs include Battery Electric Vehicles (BEVs) and Fuel Cell Electric Vehicles (FCEVs). In addition to charging from the electrical grid, both types are charged in part by
          regenerative braking, which generates electricity from some of the energy normally lost when braking. Which type of vehicle will fit your 
          lifestyle depends on your needs and driving habits.'),
        p('I will consider only BEVs and will refer to them as EVs in this project'),
        
        plotOutput('marketShare'),
        em('Source: Statista')
      ),
      
      #----------> Second Page <---------
      tabItem(
        tabName = 'market',
        h2('Industry Leaders'),
        p('Although the market Share of EVs is tiny compared to traditional combustion engines vehicles,
          we need to understand the leaders of the industry and analyze what makes them leaders.'),
        h3('Top 3 Cars by Total Units Sold'),
        fluidRow(
          infoBoxOutput('first'),
          infoBoxOutput('second'),
          infoBoxOutput('third')
        ),
        
        plotOutput('salesHist'),
        em('Source: InsideEVs'),
        p('As we can see, Tesla leads the way when it comes to selling EVs'),
        h3('Relationship between Price, Range and Sales'),
        selectInput(inputId = "choose_plot",
                    label = "Choose type of plot:",
                    choices = c('Sales vs MSRP', 'Sales vs Range', 'MSRP vs Range'),
                    selected = 'MSRP vs Range'),
        plotOutput('relationship'),
        em('Sources: Manufacturers\' websites'),
        p('The plots indicate that very few manufacturers are able to sell their cars at reasonable
          levels. The cars are often too pricy with not enough range.')
      ),
      #------------->THIRD PAGE<------------------
      tabItem(
        tabName = 'explanations',
        p('From the analysis, I can think of 2 possible reasons why the mass adoption of EVs has not
          happened yet.'),
        h2('Explanation #1'),
        p('According to a survey of 1000 participants by Castrol, the specifications for an EV to be attractive are
          at least 319 miles on battery and not higher than $40,000. I will plot the desired
          specifications over a plot of the current offerings.'),
        plotOutput('demand'),
        p('The plot shines light on the problem. From the previous page, I showed that the Tesla
          Model 3 is the most popular car by sales and now we can see that it is the only car in the
          golden zone that consumers want.'),
        p('We can also see that most cars are far from this zone, which could be a reason why people are
          not buying into the EV market. I can think of only two reasons why manufacturers do not produce
          cars in the golden zone: they have not figured out consumer demands yet, or they do not possess
          the technology to do so.'),
        h2('Explanation #2:'),
        p('It is possible that people are simply not interested in buying electric vehicles or that 
          the charging network is not reliable enough to convince people to switch. As the plots have
          shown us, Tesla has been the main driving force for the EV industry and it could be that people
          are just fans of Tesla and not necessirily of Electric Vehicles.')
        
        
      )
    )
    
  )
)
