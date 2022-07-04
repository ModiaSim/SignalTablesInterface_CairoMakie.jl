module test_save_svg_figure

using SignalTables
@usingPlotPackage

# Test the Figure operations
println("\n... test SignalTablesInterface_CairoMakie/test/test_save_svg_figure.jl:\n")

sigTable = getSignalTableExample("OneScalarSignal")
plot(sigTable, "phi", heading="sine(time)", figure=2)
saveFigure(2, "test_save_svg_figure.svg")

end