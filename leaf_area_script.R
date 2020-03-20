library(LeafArea)
imagepath = "C:/Users/makylac/Desktop/Stalk/Pot 1"
#run the automatic area analysis
res <- run.ij(path.imagej = "C:/ImageJ/", #location of imageJ progrma
set.directory = imagepath,  #location of images
low.size = 1,             #smallest size (units squared) to consider a leaf [filters dust]
low.circ = 0.3,             #ignore angular objects (must be 0.x circularity...gets rid of petioles/grids)
trim.pixel = 100,           #trim borders of images by this many pixels--gets rid of gaps in scans
save.image = TRUE,          #save the masks so you can make sure they look good!
log = TRUE, prefix="\\.",   #this records each filename as a sample, everything before the "." as in, .TIF
distance.pixel = 56.3333, known.distance = 1#add in how many pixels (distance.pixel) are in each known distance (in cm).
)
summary <- as.data.frame(res$summary)
summary$leaf.area.m2 <- summary$total.leaf.area/10000 #convert to meters

write.csv(summary, file="leafarea.csv")