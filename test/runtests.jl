module SignalTablesInterface_CairoMakie_runtests

import SignalTables
using  Test

@testset "Test SignalTablesInterface_CairoMakie/test" begin
    SignalTables.usePlotPackage("CairoMakie")
    include("$(SignalTables.path)/test/include_all.jl")
    SignalTables.usePreviousPlotPackage()
end

end
