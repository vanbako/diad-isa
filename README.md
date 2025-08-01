# Diad RISC Core

Diad-ISA is an experimental 24-bit RISC microarchitecture. It features a simple six-stage pipeline that now includes full instruction fetch, x-translation, decode, execution, memory access and register writeback.
The current design adds a register file, forwarding, branch handling and basic hazard detection so a small program can run end-to-end.

The overall architecture and instruction format are documented in `design.txt`.

## Repository layout

```
src/        Verilog source files for the core and its pipeline stages
LICENSE     GPLv3 license text
```

Key pipeline stages are defined in `src/diad.v`:

```
1. IA/IF – Instruction Address & Fetch
2. XT    - eXpansion Translation Unit (ISA to µA)
3. ID    – Instruction Decode
4. EX    – Execute
5. MA/MO – Memory Address & Operation
6. WB    – Register Write Back
```

## Building and simulation

The project is written for Verilog-2001. A simple way to test the design is with Icarus Verilog:

```bash
tst/bash/test.bash <test> [<DEBUG> ...]
example:
tst/bash/test.bash LDu OPC MEM GP
```

## License

This project is distributed under the terms of the GNU General Public License version 3. See the `LICENSE` file for details.
