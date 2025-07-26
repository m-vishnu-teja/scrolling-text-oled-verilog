# Scrolling Text Display on PMOD OLED (Spartan-7 FPGA | Verilog)

This project implements a scrolling text display on a **96x64 PMOD OLED (SSD1331)** using **Verilog HDL** and the **Spartan-7 Basys FPGA board (by AMD/Xilinx)**.

The design uses a Verilog-based modular approach including FSMs, SPI display control, font ROM, and timing management. It was built during my early FPGA learning journey and integrates modules from various reference sources.

---

## 🔧 Technologies & Tools

- Verilog HDL
- Finite State Machine (FSM)
- SPI Communication Protocol
- PMOD OLED (SSD1331 RGB)
- Spartan-7 FPGA (Basys board)
- Xilinx Vivado (for synthesis and implementation)

---

## 📂 Project Files

| File | Description |
|------|-------------|
| `TopLevel.v` | The main top module connecting all components |
| `TextScroller.v` | FSM logic for text shifting/scrolling behavior |
| `Oled_Display.v` | OLED controller module with SPI-style interface |
| `Font_ROM.v` | ROM with 8x8 font bitmap data |
| `constraints.xdc` | Vivado constraints file for Boolean Board pin mappings |

---

## 🛠️ How It Works

1. **Font_ROM** stores 8x8 character bitmaps for ASCII letters.
2. **TextScroller** fetches and scrolls the text characters.
3. **Oled_Display** sends pixel data to the PMOD OLED display.
4. **TopLevel** integrates the modules and manages control.
5. Text scrolls from right to left, pixel-by-pixel, across the display.

---

## 🖼️ Output
<img width="610" height="502" alt="Screenshot 2025-07-26 171434" src="https://github.com/user-attachments/assets/aac7f9f9-0089-4d44-89ad-1d6eca3d8e9d" />


---

## 📦 Future Improvements
- Add dynamic text via UART
- Speed control for scroll rate
- Multi-font support
- Simulate using Icarus Verilog or ModelSim
- Change color or Font Size at mentioned lines in the code

---

## ⚠️ Disclaimer

This project was completed by referencing multiple open-source projects and AI-assisted suggestions (ChatGPT, Perplexity, etc.) to learn Verilog and FPGA design. The focus was on **understanding, integrating, and building a working system**, not creating each module from scratch.

---

## 📜 License

Licensed under the [MIT License](LICENSE).

