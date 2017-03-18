# Pecan-web-app
Test web application for PEcAn organisation in GSoC 2017.
The project is to build a visualisation report of the Avian habitat data collected on the Seward Peninsula, Alaska, USA.

We will perform visualisation on 15 continuous variables and 1 categorical variable.

To know more about the dataset, visit [https://catalog.data.gov/dataset/avian-habitat-data-seward-peninsula-alaska-2012](https://catalog.data.gov/dataset/avian-habitat-data-seward-peninsula-alaska-2012).

## **How to Run:**

**Prerequisites:** System should have R and Rstudio installed.
* `Clone` this repository. Open the project in Rstudio by clicking on pecanwebapp.Rproj. 
* Run `packages.R` file in R to make sure you have all the required packages.
* Click on the Run app button in Rstudio or run the command `shiny::runApp()`.

A **running instance** has been deployed on [https://vandit15.shinyapps.io/pecan-web-app/](https://vandit15.shinyapps.io/pecan-web-app/)

## **Using the features:** 

**Handling input:**

* Move the slider to slice the amount of data that is to considred for visualisation.
* Select x-axis, y-axis, z-axis(useful for 3-d graphs only) from the drop down menu.
* Default value of x-axis is the `"Observer"` column.
* Default value of y-axis and z-axis is the `"Subpoint"` column.

**Selecting Tab:** Select from 3 tabs (plot1, plot2, plot3) to get various graphs for current input.

## **Working**

The project is a shiny web application using [shiny](https://shiny.rstudio.com/), [ggplot2](ggplot2.org/) and [plotly](https://plot.ly/) packages from R.

The application consists of `server.R` and `ui.R` along with the `data.csv` file. `ui.R` is to decide the layout of the web app and to decide type of inputs and the mainPanel. `server.R` handles the logic behind. It loads the data and uses the input given by the user (given to the main server function as a parameter). It then applies the input and data onto visualisation functions supplied from `ggplot2` and `plotly`.

## **Output**

In total output consists of 4 different kinds of dynamic plots(give information on hovering, zoom-in-out functionality available etc.). 

* Scatter plot: Two kinds of dynamic scatter plots(2-D and 3-D). Both are dynamic in nature.
* Box-Plot: Between the categorical variable("Observer") and continuous variables.
* density-curve: This is a density curve of a continous variable divided according to Observer variable.
* line-graph: Standard line graph between two continous variables divided accoring to Observer variable.

## **Further Use**
This visualisation can be used to study data and apply any machine learning models is required.

