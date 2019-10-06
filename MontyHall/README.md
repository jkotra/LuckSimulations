[Monty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem)

# Usage

```julia
usage: montyhall.jl [--switch] --simulations SIMULATIONS [-h]

optional arguments:
  --switch              to SWITCH or NOT
  --simulations SIMULATIONS
                        N no of simulations (type: Int64)
  -h, --help            show this help message and exit

```

# Example

```shell
julia montyhall.jl --switch --simulations 250 
Chosen:1 Money In:1 outcome:true
Chosen:2 Money In:3 outcome:false
Chosen:3 Money In:1 outcome:false
....
....
....
....
Chosen:2 Money In:2 outcome:true
Chosen:1 Money In:1 outcome:true
Chosen:3 Money In:3 outcome:true
Chosen:3 Money In:1 outcome:false
Chosen:3 Money In:2 outcome:false
Chosen:2 Money In:2 outcome:true
Chosen:3 Money In:1 outcome:false
---END---
168-82 Win %:67.2
```

```shell
julia montyhall.jl --simulations 250 
Chosen:1 Money In:2 outcome:false
Chosen:2 Money In:2 outcome:true
Chosen:1 Money In:3 outcome:false
Chosen:1 Money In:2 outcome:false
Chosen:3 Money In:2 outcome:false
Chosen:2 Money In:3 outcome:false
Chosen:1 Money In:1 outcome:true
...
...
...
...
Chosen:1 Money In:3 outcome:false
Chosen:1 Money In:1 outcome:true
Chosen:1 Money In:1 outcome:true
Chosen:2 Money In:2 outcome:true
---END---
85-165 Win %:34.0

```