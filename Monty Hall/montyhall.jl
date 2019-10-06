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
        "--switch"
           help = "to SWITCH or NOT"
           action = :store_true

        "--simulations"
           help = "N no of simulations"
           required = true
           arg_type = Int64
   
    end
    return parse_args(s)
end

parsed_args = parse_commandline_args()

n_doors = 3
n_siml = parsed_args["simulations"]
switch = parsed_args["switch"]

w = 0
l = 0

for i = 1:n_siml

    doors = rand(0:0,n_doors)

    #Keep the money in random door
    money_door = rand(1:length(doors))
    doors[money_door] = 1

    chosen_door = rand(1:length(doors))

    #DO YOU WANT TO SWITCH?!?!?!
    if switch
        doors_cpy = copy(doors)
        doors_cpy[chosen_door] = -1

        #open and mark money-less door!
        host_choice = findall(x->x!=1 && x!=-1, doors_cpy)[1]
        doors_cpy[host_choice] = -1

        #set chosen door index
        chosen_door = findall(x->x!=-1, doors_cpy)[1]
    end

    if doors[chosen_door] == 1
        global w += 1
    else
        global l += 1
    end

    println("Chosen:",chosen_door," Money In:", money_door, " outcome:", doors[chosen_door] == 1)

end

println("---END---")
println(w,"-",l," Win %:", 100*(w/(w+l)))    