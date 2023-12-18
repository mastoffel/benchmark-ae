# Cardiac datasets

from Marina Strocchi / Steven Niederer

zenodo: https://zenodo.org/records/7405335  
paper: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1011257

All datasets in cardiac/
Original zenodo data in cardiac/original

### cardiac1

atrial_cell_model/ionic   
sampled with LHS

### cardiac2

atrial_cell_model/contraction_isotonic  
possibly non-LHS sampled

#### cardiac3

atrial_cell_model/contraction_isometric_ stretch1.0  
possibly non-LHS sampled

#### cardiac4

atrial_cell_model/contraction_isometric_stretch1.1  
possibly non-LHS sampled

#### cardiac5

CircAdap

LHS sampled.

Predicts four-chamber pressure and volume features with the CircAdapt ODE model.

### cardiac6

fourchamber

non-LHS sampled.

samples generated with a 3D-0D four-chamber electromechanics model to predict pressure and volume biomarkers for cardiac function.


### cardiac7

passive_mechanics

predict inflated volumes and mean atrial and ventricular fiber strains for a passive inflation.


### cardiac8

tissue_electophysiology

predict total atrial and ventricular activation times with an Eikonal model.

### cardiac9

ventricular_cell_model/ionic

ToR-ORd model samples used to train GPEs to predict the ventricular calcium transient features

### cardiac10

ventricular_cell_model/contraction_isotonic

ToR-ORd model coupled with the Land contraction model samples used to train GPEs to predict the ventricular active tension transient features. The simulations were isotonic.

### cardiac11

ventricular_cell_model/contraction_isometric_stretch1.0

ToR-ORd model coupled with the Land contraction model samples used to train GPEs to predict the ventricular active tension transient features. The simulations were isometric contractions with no strain (or stretch 1.0).

### cardiac12

ventricular_cell_model/contraction_isometric_stretch1.1

ToR-ORd model coupled with the Land contraction model samples used to train GPEs to predict the ventricular active tension transient features. The simulations were isometric contractions with 0.1 strain (or stretch 1.1).