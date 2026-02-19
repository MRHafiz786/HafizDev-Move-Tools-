# 🚀 HafizDev File Mover

### Professional Batch-Based File Management System (v3.0)

![Version](https://img.shields.io/badge/version-3.0-blue)
![Platform](https://img.shields.io/badge/platform-Windows-brightgreen)
![Language](https://img.shields.io/badge/language-Batch-4EAA25)
![License](https://img.shields.io/badge/license-MIT-orange)

------------------------------------------------------------------------

## 📖 Overview

HafizDev File Mover is a professional Windows batch utility designed for
secure, structured, and efficient file transfers.

Built entirely using Windows Batch scripting, it provides speed,
reliability, and a clean ASCII interface powered by robocopy.

------------------------------------------------------------------------

## ✨ Key Features

### Dual Operating Modes

-   Full Mode -- Animated interface, detailed statistics
-   Quick Mode -- Minimal output for faster transfers

### Smart System Handling

-   Automatic destination creation
-   Configuration validation
-   Source scanning & item counting
-   Robust error code reporting

### Professional Interface

-   ASCII-compatible layout
-   Color-coded status output
-   Structured menu navigation
-   Built-in documentation viewer

------------------------------------------------------------------------

## 📦 Installation

### Requirements

-   Windows XP or newer
-   No additional software required
-   Administrator privileges recommended

### Setup

Keep all files together:

RUN.bat\
SYSTEM.bat\
EDIT PATHS.txt\
README.md

Double-click RUN.bat to launch.

------------------------------------------------------------------------

## ⚙ Configuration

Edit EDIT PATHS.txt:

SOURCE=C:`\Users`{=tex}`\YourUsername`{=tex}`\Desktop`{=tex}`\SourceFolder  `{=tex}
DESTINATION=D:`\Backup`{=tex}`\DestinationFolder  `{=tex}

Important: - Do NOT add spaces around = - Use full absolute paths - Keep
file name exactly as EDIT PATHS.txt

------------------------------------------------------------------------

## 🔄 How It Works

1.  Loads configuration from EDIT PATHS.txt
2.  Validates source and destination
3.  Uses robocopy to perform structured transfer
4.  Displays success/failure summary with exit codes

------------------------------------------------------------------------

## 📊 Error Code Reference

0--7 → Success\
8+ → Transfer Failed (check permissions or paths)

------------------------------------------------------------------------

## 📁 Project Structure

HafizDev-FileMover/ │ ├── RUN.bat ├── SYSTEM.bat ├── EDIT PATHS.txt └──
README.md

------------------------------------------------------------------------

## 📝 Changelog

### v3.0

-   Dual mode operation
-   Improved ASCII interface
-   System diagnostics
-   Enhanced error handling

### v2.0

-   Added animations
-   Color-coded output

### v1.0

-   Basic file moving functionality

------------------------------------------------------------------------

## 📜 License

MIT License

Copyright (c) 2024 HafizDev

------------------------------------------------------------------------

## 👨‍💻 Author

HafizDev\
Professional Batch Developer

Built with passion for Windows automation.
