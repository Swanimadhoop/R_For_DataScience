data(mtcars)

cyl_am_table <- table(mtcars$cyl, mtcars$am)

barplot(cyl_am_table,
        beside=TRUE,
        col= c("blue","green"),
        legend.text= c("Automatic","manual"),
        args.legend =list(title="transmission type",x="topright"),
        xlab="number of cylinders",
        ylab="count",
        main="number of cylinders of transmission type"
)
