#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
trailr <- function(data, ..., width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = data
    ,...
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'trailr',
    x,
    width = width,
    height = height,
    package = 'trailr'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
trailrOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'trailr', width, height, package = 'trailr')
}

#' Widget render function for use in Shiny
#'
#' @export
renderTrailr <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, trailrOutput, env, quoted = TRUE)
}
