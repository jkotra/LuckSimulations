#=
MIT License

Copyright (c) 2019 Jagadeesh Kotra

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=#

using ArgParse


function parse_commandline_args()
    s = ArgParseSettings()
    @add_arg_table s begin

        "--bank"
           help = "bank / balance"
           required = true
           arg_type = Float64

        "--stake"
           help = "stake/Bet Amount to start with, also considered as base"
           required = true
           arg_type = Float64

        "--rolls"
           help = "N no of rolls"
           required = true
           arg_type = Int
           default = 1
        "--multiplier"
           help = "If won then, stake*multiplier"
           required = true
           arg_type = Float16

        "--report-freq"
           help = "Gap of rolls between each line printed to STDOUT"
           required = true
           arg_type = Int
           default = 1
    end
    return parse_args(s)
end

parsed_args = parse_commandline_args()


bank = parsed_args["bank"]

stake_base = parsed_args["stake"]
stake = 0

#for our 1st roll of Dice
stake = stake_base

multiplier = parsed_args["multiplier"]

w = 0
l = 0


for i = 1:parsed_args["rolls"]
    global bank -= stake

    if rand()*100 > 50.0

        global w += 1

        global bank += stake*multiplier
        global stake = stake_base
        
    else
        global l += 1
        global stake = stake*2
    end

    if i % parsed_args["report-freq"] == 0
        println(i," ",bank)
    end

    if stake > bank
        println(i," ",bank, " Bankrupt! Stake:",stake)
        break
    end

end

println("---END---")
println(w,"-",l," Win %:", 100*(w/(w+l)))