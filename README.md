![](luck.png)

# LuckSimulations

Julia snippets for rapid testing and experimentation with random-based games such as dice, coin flip etc.

# Available Simulation

* [Dice -> Martingale](/Dice/martingale.jl)


# Usage

## Install Deps.

`using Pkg`

`Pkg.add("ArgParse")`


`PROGRAM.jl --help` for example usage and arguments.

## Example

```julia
usage: martingale.jl --bank BANK --stake STAKE --rolls ROLLS
                     --multiplier MULTIPLIER --report-freq REPORT-FREQ
                     [-h]

optional arguments:
  --bank BANK           bank / balance (type: Float64)
  --stake STAKE         stake/Bet Amount to start with, also
                        considered as base (type: Float64)
  --rolls ROLLS         N no of rolls (type: Int64, default: 1)
  --multiplier MULTIPLIER
                        If won then, stake*multiplier (type: Float16)
  --report-freq REPORT-FREQ
                        Gap of rolls between each line printed to
                        STDOUT (type: Int64, default: 1)
  -h, --help            show this help message and exit
```

---

```julia martingale.jl --bank 1 --stake 0.00000010 --rolls 5000000 --multiplier 2 --report-freq 10000```

The above command will run martingale simulation with given arguments.