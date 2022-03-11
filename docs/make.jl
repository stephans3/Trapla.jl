
using Documenter, Trapla

pages = ["Home" => "index.md", "Gevrey" => "gevrey.md"]


makedocs(
    sitename="Trapla.jl",
    format=Documenter.HTML(),
    modules=[Trapla],
    authors = "stephan.scholz@rwu.de",
    doctest = true,
    pages = pages
)


deploydocs(
    repo = "github.com/stephans3/Trapla.jl.git",
)