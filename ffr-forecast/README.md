# Forecasting the Federal Funds Rate

This R project focuses on analyzing the Federal Funds Rate (FFR), its relationship with inflation data and with its own lags. The analysis includes data preprocessing, visualization, and linear regression modeling to forecast the FFR's mid-point. 

## Files

Three main files are used in this project:

* [DFEDTARL.csv](https://fred.stlouisfed.org/series/DFEDTARL): contains the lower limit for FFR's target range;
* [DEFEDTARU.csv](https://fred.stlouisfed.org/series/DFEDTARU): contains the upper limit for FFR's target range;
* [MEDCPI.csv](https://fred.stlouisfed.org/series/MEDCPIM158SFRBCLE): data of the median Consumer Price Index (CPI).

## Packages

Before running the code, ensure you have the following R packages installed:

* `tidyverse`
* `patchwork`
* `ggcorrplot`
* `viridisLite`
* `lmtest`
* `car`
* `caret`
* `scales`

You also need to source helper objects and functions from `../objects_and_functions.R`.