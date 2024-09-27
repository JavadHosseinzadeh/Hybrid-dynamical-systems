# Hybrid Dynamical Systems
This repository contains projects on hybrid dynamical systems, including homework assignments from the course and a final project on graybox modeling of a gearbox system using neural networks.

## 1. Graybox Modeling of Gearbox System
This project employs neural networks for graybox modeling of a gearbox system that operates in multiple modes. The scripts involved include:

- **`ModeClassifier.m`**: Neural network classifiers to determine gearbox operation mode based on position, velocity, and time.
- **`Gearbox_model.m`**: Dynamic model of the gearbox using Gaussian membership functions.
- **`White_noise_input.m`**: Simulates input signals and generates white noise to drive the system.
- **`IdentificationOfEachMode.m`**: Trains neural networks for each mode and tests the system state prediction.
- **`Unbyp4.m`**: Prepares input for system identification by processing past states of the gearbox.

These scripts help build a robust neural network model capable of predicting gearbox state under various conditions.

## 2. Homework
This folder contains homework assignments from the hybrid dynamical systems course. These tasks focus on understanding and analyzing various dynamical systems using both analytical methods and simulations.
