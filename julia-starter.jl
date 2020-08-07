# The aim of this file is to load useful stuff and define helper functions
#
# to get properly started, make sure matplotlib is installed and Pkg install everything
#

using Pkg

useful_packages = [
    :PyPlot,
    :CSV,
    :DataFrames,
    :Statistics,
    :DelimitedFiles,
    :LazyJSON,
    :JSON3,
    :MLJBase,
    :ProgressMeter,
    :PrettyTables,
    :CategoricalArrays,
    :FreqTables,
    :PyCall,
    :ScikitLearn,
    :Random,
    :Measurements,
    :Dates
]

for package in useful_packages
    try
        eval(Meta.parse("using $package"))
        println("✅ successful 'using $package'")
    catch
        try
            Pkg.add("$package")
            eval(Meta.parse("using $package"))
        catch
            println("❌ couldn't install or using '$package'.")
        end
    end
end

ENV["COLUMNS"] = 1000

skipnan(v) = filter(!isnan, v)

p20(v) = quantile(v, 0.2)
p80(v) = quantile(v, 0.8)

# Dummy tooling to compute gap between two dates in seconds
# when the dates don't work well with Base.Dates

function date_splitter(d)
    year=Meta.parse(d[1:4])
    month=Meta.parse(d[6:7])
    day=Meta.parse(d[9:10])
    hour=Meta.parse(d[12:13])
    minute=Meta.parse(d[15:16])
    second=Meta.parse(d[18:19])
    millisecond=Meta.parse(d[21:23])
    [year,month,day,hour,minute,second,millisecond]
    # 1    2     3  4    5      6      7
end
function gap_s(d1, d2)
    d1 = String(d1)
    d2 = String(d2)
    d = values(date_splitter(d1[1:23])) .- values(date_splitter(d2[1:23]))
    # ignore year month
    d[3] * 24 * 3600 + d[4] * 3600 + d[5] * 60 + d[6] + d[7] / 1000
end
