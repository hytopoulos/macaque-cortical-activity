fmri = load("data/Electrode_fmri_outline_with_MW.mat")

image(fmri.I)
axis on
hold on;
plot(fmri.X, fmri.Y, 'r+', 'MarkerSize', 30)