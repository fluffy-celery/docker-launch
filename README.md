# Weather Constraint Data Generator

## Overview

This application generates **realistic weather constraint data** and exports it to a **CSV file**.
It is designed to work with **OGS Web GUI JSON outputs** (from the JSON tab) as configuration input.

The tool simulates weather variables such as:

* Temperature (°C)
* Wind Speed (m/s)
* Humidity (%)
* Precipitation (mm)

These constraints can be used in downstream modeling, scenario planning, or testing.

---

## Workflow

1. **Input JSON**

   * Export configuration data from the OGS Web GUI JSON tab.
   * Example fields used:

     * `start_date`
     * `simulation_days`
     * `avg_temp` (or inferred baseline temp from OGS metadata)

2. **Weather Simulation**

   * Uses configurable ranges and realistic distributions for environmental factors.
   * Incorporates seasonal variation and stochastic elements.

3. **Output CSV**

   * Generates a tabular dataset with daily weather constraints.
   * Example columns:

     * `date`
     * `temperature_c`
     * `wind_speed_mps`
     * `etc`

---

## Project Structure

```
weather-generator/
├── data/
│   ├── ogs_config.json        # Input from OGS Web GUI
│   └── weather_constraints.csv # Output CSV
├── src/
│   ├── generator.py           # Core logic
│   ├── parsers.py             # JSON parsing helpers
│   └── simulator.py           # Weather simulation engine
├── tests/
│   └── test_generator.py      # Unit tests
├── README.md                  # Project documentation
├── requirements.txt           # Dependencies
└── run.py                     # CLI entry point
```

---

## Usage

1. Place your OGS-exported JSON file into `data/`.
2. Run the application with:

   ```bash
   python run.py --config data/ogs_config.json --output data/weather_constraints.csv
   ```
3. The generated CSV will be available in `data/weather_constraints.csv`.

---

## Configuration

Example input JSON:

```json
{
  "something": 1,
  "something-again": 2,
  "weather": 3
}
```
