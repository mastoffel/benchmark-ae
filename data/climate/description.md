# Climate datasets

from Richard Wilkinson (University of Nottingham)

chosen because:

- high dimensional output (UVic) 
- a high(ish) dimensional input (Genie)
- and data that live on the globe with heteroskedastic errors.

## 1) UVic Climate Model

A simple low dimensional problem using data from the University of Victoria climate model.
Details [here](https://rich-d-wilkinson.github.io/docs/papers/WilkinsonInverseChapter.pdf), which is Wilkinson 2010 [here](https://rich-d-wilkinson.github.io/Publications.html).

There are two inputs, Q10 and Kv. Q10 controls the temperature depenndence of respiration and can be considered a carbon source, while Kv (should this be Kc ?) is the Michaelis-Menton constant for CO2 and controls the sensitivity of photosynthesis and can be considered a carbon sink.The aim is calibrate these two parameters to the Keeling and Whorf (2005) sequence of atmospheric carbondioxide measurements.
Each model run takes approximately two weeks of computer time and we have an ensemble of 55 model runs with which to perform the analysis.


 and the simulator has been run 55 times at the inputs in `design`.

The outputs are a time series of CO2 values in `sim.co2`, as well as two flux values for the 80s and 90s in `sim.flux`. Each input to the simulator thus produces one time series and two fluxes. In the paper, we emulated both the fluxes, and the time series, by decomposing the multidimensional output with PCA first.

There are also the Keeling observed physical measurements of CO2 values in `field.co2` and `field.flux`. The aim is learn which input parameters lead to these measurements.


## Climate data

Climate model data from [here](https://www.nature.com/articles/s41558-018-0197-7). I think its from the GENIE model.

The aim is to predict the climate variables SAT, ACC, VEGC, SOILC, MAXPMOC, OCN_O2, fCaCO3, SIAREA_S from the  variables in columns 2 to 34 (indexing from 1). We found in the paper that considering different mean structures and covariance functions for each different output produced good results. This included using the LASSO to select a subset of input variables. I don't think we'd do it this way now, so it might be an interesting test set.


## Spherical data

The file `ModelData_comparison.txt` contains palaeo data collected from multiple different locations around the world. x and y are the latitude and longitude in degrees, and z is the observation. `std` is the standard deviation of the noise on the observation (ie it is heteroskedastic noise). 

The challenge here is to build an emulator that knows this data is on the globe (ie on something close to a sphere). We did this by building an emulator that uses the Haversine distance. I've included a Python notebook (`SphericalGP_Demo.ipynb`) that demonstrate the details.

The motivation for this emulator was to build a spatial prediction model that could then be used to compare climate model output to the paleo record. The paper is [here](https://cp.copernicus.org/articles/16/1953/2020/).