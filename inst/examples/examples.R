library(trailr)
library(pipeR)

trailr(
  data.frame(x=seq(1,500,50),y=seq(1,500,50)) %>>%
    (
      data.frame(
        i= 1:nrow(.)
        ,.
      )
    )
)
