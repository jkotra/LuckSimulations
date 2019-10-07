<div align="center">
  <a href="/"><img src="luck.png"></a><br>
</div>

# LuckSimulations

Julia snippets for rapid testing and experimentation with random-based games such as dice, coin flip etc.

---

## Available Simulation(s)

* [Dice -> Martingale](/Dice/martingale.jl)

* [Monty Hall Simulation](/MontyHall/montyhall.jl)


# Usage

## Install Deps.

```julia
using Pkg
Pkg.add("ArgParse")
```

---


then run `PROGRAM.jl --help` for example usage and arguments.

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

### Example:

```julia martingale.jl --bank 1 --stake 0.00000010 --rolls 5000000 --multiplier 2 --report-freq 10000```

# Misc.

* [Martingale Custom Multiplier](/Dice/custom_fn_example.jl)