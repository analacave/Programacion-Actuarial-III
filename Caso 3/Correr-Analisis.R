#Correr Análisis
data <- rbind(read.table("~/UCI HAR Dataset/train/X_train.txt"),read.table("~/UCI HAR Dataset/test/x_test.txt"))
encabezados <- read.table("~/UCI HAR Dataset/features.txt")
act <- rbind(read.table("~/UCI HAR Dataset/train/y_train.txt"),read.table("~/UCI HAR Dataset/test/y_test.txt"))[,1]
labels <- as.character(read.table("~/UCI HAR Dataset/activity_labels.txt")[,2])
vol <- rbind(read.table("~/UCI HAR Dataset/train/subject_train.txt"),read.table("~/UCI HAR Dataset/test/subject_test.txt"))[,1]

colnames(data) <- encabezados$V2
medidas <- grepl('-(mean|std)\\(',encabezados$V2)
data <- data[medidas]
act <- labels[act]

colnames(data) <- gsub("mean", "Mean", colnames(data))
colnames(data) <- gsub("std", "Std", colnames(data))
colnames(data) <- gsub("t", "Time", colnames(data))
colnames(data) <- gsub("f", "Frequency", colnames(data))
colnames(data) <- gsub("\\(\\)", "", colnames(data))
colnames(data) <- gsub("-", "", colnames(data))
colnames(data) <- gsub("BodyBody", "Body", colnames(data))
colnames(data) <- gsub("^", "MeanOf", colnames(data))

data <- cbind(Voluntario = vol,Actividad = act,data)
library(dplyr)
prom_data_set <- data %>% group_by(Voluntario,Actividad) %>% summarise_each(funs(mean))
write.table(prom_data_set,row.names = F,file = "Base de datos.txt")