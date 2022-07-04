module SignalTablesInterface_CairoMakie


# Constants
const headingSize = 10

const path = dirname(dirname(@__FILE__))   # Absolute path of package directory
const Version = "0.1.0"
const Date = "2022-07-04"

println("Importing SignalTablesInterface_CairoMakie Version $Version ($Date) - this takes some time due to CairoMakie import")

import SignalTables
import Colors
import Measurements
import MonteCarloMeasurements
using  Unitful

using  CairoMakie
include("$(SignalTables.path)/src/AbstractPlotInterface.jl")

const showFigureStringInDiagram = false
const callDisplayFunction = false
const reusePossible = true

const Makie_Point2f = isdefined(CairoMakie, :Point2f) ? Point2f : Point2f0 
include("$(SignalTables.path)/src/makie.jl")


showFigure(figureNumber::Int) = nothing

function saveFigure(figureNumber::Int, fileName; kwargs...)::Nothing
    if haskey(figures, figureNumber)
        fig = figures[figureNumber].fig
        fullFileName = joinpath(pwd(), fileName)
        println("... save plot in file: \"$fullFileName\"")
        save(fileName, fig; kwargs...)
    else
        @info "saveFigure: figure $figureNumber is not defined."
    end    
    return nothing
end


function closeFigure(figureNumber::Int)::Nothing
    delete!(figures,figureNumber)
    return nothing
end


"""
    closeAllFigures()

Close all figures.
"""
function closeAllFigures()::Nothing
    if length(figures) > 0
        empty!(figures)
    end
    return nothing
end


end
